# encoding=utf-8

import MySQLdb
from flask import Flask, Response, request
import json, re, jieba, urlparse
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
import numpy as np
from datetime import date, datetime
from geopy.distance import vincenty
from urllib import urlopen
from xml.dom.minidom import parseString
from urllib import unquote
app = Flask(__name__)

RECOMMEND_CNT = 100
key = 'w6LI4tGSMUGsO7rIo1LkLm5n7qdG0Odo'
discounts_detail = []
indices = []
cosine_similarities = None
merchant_coordinates = []
preferences = []
click_rates = []
types = {
    "shopping": "购物",
    "entertainment": "休闲娱乐",
    "car": "汽车",
    "food": "美食",
    "dailyservice": "生活服务",
    "travelling": "旅游",
    "fashion": "时尚丽人",
    "cards_gifts": "办卡送礼",
    "hotel": "酒店",
    "outing": "出行"
}

banks = {
    "shanghai": "上海",
    "zhongguo": "中国",
    "zhongxin": "中信",
    "jiaohang": "交行",
    "guangda": "光大",
    "xingye": "兴业",
    "nongye": "农业",
    "huaxia": "华夏",
    "gonghang": "工行",
    "pingan": "平安",
    "guangfa": "广发",
    "jianshe": "建设",
    "zhaoshang": "招商",
    "minsheng": "民生",
    "pufa": "浦发",
    "zhada": "渣打银行",
    "huaqi": "花旗"
}

class ComplexEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        elif isinstance(obj, date):
            return obj.strftime('%Y-%m-%d')
        else:
            return json.JSONEncoder.default(self, obj)


def load_data():
    print "loading data..."
    global indices, discounts_detail, merchant_coordinates
    db = MySQLdb.connect(host="localhost", user="root", passwd="", db="deal_bridge", charset="utf8")
    cursor = db.cursor()
    sql = "SELECT discount_id, bank_name, summary, description, begin_time, " \
          "end_time, img, merchant_location, latitude, longitude, classify FROM discount"
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        discounts_detail = [(result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[10]) for result in results]
        indices = [result[0] for result in results]
        merchant_coordinates = [(result[8], result[9]) for result in results]
        # for result in results:
        #     print result[0]
        #     if result[8] != "":
        #         merchant_coordinates.append((result[8], result[9]))
        #         print result[8], result[9]
        #     else:
        #         print 'add default gps'
        #         merchant_coordinates.append((-74.8597760000, 109.8062440000))  # Antarctica
    except:
        print "Error, unable to fetch data"
    print "data loading completed!"
    db.close()


def load_preferences():
    global preferences
    print 'loading preference data...'
    db = MySQLdb.connect(host="localhost", user="root", passwd="", db="deal_bridge", charset="utf8")
    cursor = db.cursor()
    sql = "select user.user_id, favorite.discount_id from user, favorite where user.user_id = favorite.user_id"
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        preferences = [(result[0], result[1]) for result in results]
    except:
        print "unable to fetch user preferences"
    print 'preference loading completed!'
    db.close()


def load_click():
    global click_rates
    print 'loading click rates data...'
    db = MySQLdb.connect(host="localhost", user="root", passwd="", db="deal_bridge", charset="utf8")
    cursor = db.cursor()
    sql = "select clickrate from discount"
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        click_rates = [result[0] for result in results]
    except:
        print 'unable to fetch click rate data'
    print 'click rate data loading completed!'
    db.close()

def calculate_similarity():
    print "calculating similarity..."
    global cosine_similarities
    discounts_after_cut = [re.sub("[\d]+", "",
                                  " ".join(jieba.cut(discount[1] + " " + discount[2] + " " + discount[3])))
                           for discount in discounts_detail]
    vectorizer = TfidfVectorizer()
    discounts_tfidf = vectorizer.fit_transform(discounts_after_cut)
    cosine_similarities = linear_kernel(discounts_tfidf, discounts_tfidf)
    print "calculating completed!"


def urlEncodeNonAscii(b):
    return re.sub('[\x80-\xFF]', lambda c: '%%%02x' % ord(c.group(0)), b)


def iriToUri(iri):
    parts= urlparse.urlparse(iri)
    return urlparse.urlunparse(
        part.encode('idna') if parti==1 else urlEncodeNonAscii(part.encode('utf-8'))
        for parti, part in enumerate(parts)
    )


# localhost:5000/customized/user_id?start=?&number=?
@app.route('/customized/<int:user_id>')
def customized_recommend(user_id):
    global preferences, cosine_similarities
    offset_start = int(request.args['start'])
    offset_end = int(request.args['number']) + offset_start
    latitude = float(request.args['lat'])
    longitude = float(request.args['lng'])
    vector = np.zeros_like(cosine_similarities[0], dtype=float)
    load_click()
    load_preferences()
    distance = [vincenty(coordinate, (latitude, longitude)).kilometers for coordinate in merchant_coordinates]
    distance = np.array(distance)
    distance_weight = 1.0/(0.1*distance + 1)
    for (id, discount_id) in preferences:
        if id == user_id:
            vector += cosine_similarities[indices.index(discount_id)]
    if vector.sum() == 0:
        return Response(
            response=json.dumps([]),
            status=200,
            mimetype="application/json")
    print distance[1:100]
    print distance_weight[1:100]
    print vector[1:100]
    vector += distance_weight
    item_indices = vector.argsort()[-offset_end-1:-offset_start-1]
    print item_indices
    data = []
    for index in item_indices:
        data.append({
            "id": discounts_detail[index][0],
            "bank_name": discounts_detail[index][1],
            "summary": discounts_detail[index][2],
            "description": discounts_detail[index][3],
            "begin_time": discounts_detail[index][4],
            "end_time": discounts_detail[index][5],
            "img": discounts_detail[index][6],
            "click_rate": click_rates[index],
            "distance": distance[index]
        })
    data = json.dumps(data, cls=ComplexEncoder)
    resp = Response(response=data,
                    status=200,
                    mimetype="application/json")
    return resp


@app.route("/bank")
def bank_recommend():
    global preferences, cosine_similarities
    offset_start = int(request.args['start'])
    offset_end = int(request.args['number']) + offset_start
    latitude = float(request.args['lat'])
    longitude = float(request.args['lng'])
    bank_name = request.args['bankName']
    user_id = int(request.args['userId'])
    vector = np.zeros_like(cosine_similarities[0], dtype=float)
    load_preferences()
    distance_1 = [vincenty(coordinate, (latitude, longitude)).kilometers for coordinate in merchant_coordinates]
    distance = np.array(distance_1)
    distance_weight = 1.0/(0.1*distance + 1)
    for (id, discount_id) in preferences:
        if id == user_id:
            vector += cosine_similarities[indices.index(discount_id)]
    if vector.sum() == 0:
        return Response(
            response=json.dumps([]),
            status=200,
            mimetype="application/json")
    vector += distance_weight
    _bank = banks[bank_name]
    for i in xrange(len(indices)):
        if discounts_detail[i][1] != _bank.decode("UTF-8"):
            vector[i] = 0
    print vector.sum()
    item_indices = vector.argsort()[-offset_end-1:-offset_start-1]
    data = []
    for index in item_indices:
        data.append({
            "id": discounts_detail[index][0],
            "bank_name": discounts_detail[index][1],
            "summary": discounts_detail[index][2],
            "description": discounts_detail[index][3],
            "begin_time": discounts_detail[index][4],
            "end_time": discounts_detail[index][5],
            "img": discounts_detail[index][6],
            "distance": distance_1[index]
        })
    data = json.dumps(data, cls=ComplexEncoder)
    resp = Response(response=data,
                    status=200,
                    mimetype="application/json")
    return resp


@app.route("/type/<int:user_id>")
def type_recommend(user_id):
    global preferences, cosine_similarities, types
    offset_start = int(request.args['start'])
    offset_end = int(request.args['number']) + offset_start
    _type = request.args['type']
    _type = types[_type]
    print _type
    vector = np.zeros_like(cosine_similarities[0], dtype=float)
    for (id, discount_id) in preferences:
        if id == user_id:
            vector += cosine_similarities[indices.index(discount_id)]
    if vector.sum() == 0:
        return Response(
            response=json.dumps([]),
            status=200,
            mimetype="application/json")
    for i in xrange(len(indices)):
        if discounts_detail[i][8] != _type.decode("UTF-8"):
            vector[i] = 0
    # print vector[1:100]
    item_indices = vector.argsort()[-offset_end-1:-offset_start-1]
    # print item_indices
    data = []
    for index in item_indices:
        data.append({
            "id": discounts_detail[index][0],
            "bank_name": discounts_detail[index][1],
            "summary": discounts_detail[index][2],
            "description": discounts_detail[index][3],
            "begin_time": discounts_detail[index][4],
            "end_time": discounts_detail[index][5],
            "img": discounts_detail[index][6]
        })
    data = json.dumps(data, cls=ComplexEncoder)
    resp = Response(response=data,
                    status=200,
                    mimetype="application/json")
    return resp


@app.route("/vicinity")
def vicinity_recommend():
    start = int(request.args['start'])
    end = int(request.args['number']) + start
    latitude = float(request.args['lat'])
    longitude = float(request.args['lng'])
    distance = [vincenty(coordinate, (latitude, longitude)).kilometers for coordinate in merchant_coordinates]  # compute the distance
    distance = np.array(distance)
    item_indices = distance.argsort()[start:end]
    data = []
    for index in item_indices:
        data.append({
            "id": discounts_detail[index][0],
            "bank_name": discounts_detail[index][1],
            "summary": discounts_detail[index][2],
            "description": discounts_detail[index][3],
            "begin_time": discounts_detail[index][4],
            "end_time": discounts_detail[index][5],
            "img": discounts_detail[index][6],
            "distance": distance[index]
        })
    data = json.dumps(data, cls=ComplexEncoder)
    resp = Response(response=data,
                    status=200,
                    mimetype="application/json")
    return resp


@app.route("/hot/<int:user_id>")
def hot_recommend(user_id):
    start = int(request.args['start'])
    end = int(request.args['end'])

if __name__ == '__main__':
    load_data()
    load_preferences()
    calculate_similarity()
    # address2coord()
    app.run(host='10.225.224.182')
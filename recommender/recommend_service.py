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

app = Flask(__name__)

RECOMMEND_CNT = 100
key = 'w6LI4tGSMUGsO7rIo1LkLm5n7qdG0Odo'
db = MySQLdb.connect(host="10.22.96.25", user="dealbridge_user", passwd="dealbridge_pwd", db="deal_bridge", charset="utf8")  # db supported by Jiezhe
cursor = db.cursor()
discounts_detail = []
indices = []
cosine_similarities = None
merchant_coordinates = []


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
    sql = "SELECT discount_id, bank_name, summary, description, " \
          "begin_time, end_time, img, merchant_location, latitude, longitude FROM discount"  # limit 0, 2000"
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        discounts_detail = [(result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7]) for result in results]
        indices = [result[0] for result in results]
        for result in results:
            if result[8] != "":
                merchant_coordinates.append((result[8], result[9]))
            else:
                merchant_coordinates.append(-74.8597760000, 109.8062440000)  # Antarctica

    except:
        print "Error, unable to fetch data"
    print "data loading completed!"


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


# def address2coord():
#     global merchant_coordinates
#     for discount in discounts_detail:
#         address = discount[7]
#         id = discount[0]
#         url = 'http://api.map.baidu.com/geocoder/v2/?address=%s&output=xml&ak=%s' % (address, key)
#         doc = urlopen(iriToUri(url))
#         dom = parseString(doc.read())
#         status = dom.getElementsByTagName('status')[0].firstChild.data
#         print "id %d address %s" % (id, address)
#         if status == '0':  # valid request
#             lat = dom.getElementsByTagName('lat')[0].firstChild.data
#             lng = dom.getElementsByTagName('lng')[0].firstChild.data
#             print "\t valid %s %s" % (lat, lng)
#             merchant_coordinates.append((float(lat), float(lng)))
#         else:              # invalid request
#             merchant_coordinates.append((0, 0))
#             print "\t invalid "


# localhost:5000/customized/user_id?start=?&end=?
@app.route('/customized/<int:user_id>')
def customized_recommend(user_id):
    offset_start = int(request.args['start'])
    offset_end = int(request.args['end'])
    sql = "select discount_id from favorite where user_id = %s"
    preference = []
    try:
        cursor.execute(sql, user_id)
        results = cursor.fetchall()
        preference = [result[0] for result in results]
    except:
        print "Error, cannot fetch data for user %d" % user_id
    if len(preference) == 0:
        return Response(
            response=json.dumps([]),
            status=200,
            mimetype="application/json")
    vector = [0 for ele in cosine_similarities[0]]
    for pre in preference:
        for i in xrange(len(vector)):
            vector[i] += cosine_similarities[indices.index(pre)][i]
    vector = np.array(vector)
    item_indices = vector.argsort()[-offset_end - 1:-offset_start]
    print item_indices
    data = []
    for index in item_indices:
        data.append({
            "discount_id": discounts_detail[index][0],
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


# http://api.map.baidu.com/geocoder?address=%E6%AD%A6%E6%B1%89&output=json&key=f247cdb592eb43ebac6ccd27f796e2d2
@app.route("/vicinity/<int:user_id>")
def vicinity_recommend(user_id):
    start = int(request.args['start'])
    end = int(request.args['end'])
    latitude = float(request.args['lat'])
    longitude = float(request.args['lng'])
    distance = [vincenty(coordinate, (latitude, longitude)).kilometers for coordinate in merchant_coordinates]  # compute the distance
    distance = np.array(distance)
    item_indices = distance.argsort()[start:end+1]
    data = []
    for index in item_indices:
        data.append({
            "discount_id": discounts_detail[index][0],
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
    # calculate_similarity()
    # address2coord()
    app.run(host='0.0.0.0')
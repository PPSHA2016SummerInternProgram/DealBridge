# encoding=utf-8

import MySQLdb
from flask import Flask, Response, request
import json,re, jieba
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
import numpy as np

app = Flask(__name__)

RECOMMEND_CNT = 100

db = MySQLdb.connect(host="10.22.96.25", user="dealbridge_user", passwd="dealbridge_pwd", db="deal_bridge", charset="utf8")  # db supported by Jiezhe
cursor = db.cursor()
discounts = []
discounts_detail = []
indices = []
cosine_similarities = None


def load_data():
    global discounts, indices, discounts_detail
    sql = "SELECT discount_id, bank_name, summary, description FROM discount"  # limit 0, 2000"
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        discounts = ["%s %s %s" % (result[1], result[2], result[3]) for result in results]
        discounts_detail = [(result[0], result[1], result[2], result[3]) for result in results]
        indices = [result[0] for result in results]
    except:
        print "Error, unable to fetch data"


def calculate_similarity():
    global cosine_similarities
    discounts_after_cut = [re.sub("[\d]+", "", " ".join(jieba.cut(discount))) for discount in discounts]
    vectorizer = TfidfVectorizer()
    discounts_tfidf = vectorizer.fit_transform(discounts_after_cut)
    cosine_similarities = linear_kernel(discounts_tfidf, discounts_tfidf)


@app.route('/hello')
def hello_world(user_id):
    start = request.args.get('offset_start')
    end = request.args.get('offset_end')
    return 'Hello World! %d %d' % (start, end)


# localhost:5000/customized/user_id?offset_start=&offset_end=
@app.route('/customized/<int:user_id>/<int:offset_start>/<int:offset_end>')
def customized_recommend(user_id, offset_start, offset_end):
    # data = json.dumps([{"first": first, "second": second}, {"nickname": first, "given name": second}])
    sql = "select discount_id from favorite where user_id = %s"
    preference = []
    try:
        cursor.execute(sql, (user_id))
        results = cursor.fetchall()
        preference = [result[0] for result in results]
    except:
        print "Error, cannot fetch data for %d" % user_id
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
            "description": discounts_detail[index][3]
        })
    data = json.dumps(data)
    print data
    resp = Response(response=data,
                    status=200,
                    mimetype="application/json")
    return resp

if __name__ == '__main__':
    print "loading data..."
    load_data()
    print "data loading completed!"
    print "calculating similarity..."
    calculate_similarity()
    print "calculating completed!"
    app.run('0.0.0.0')
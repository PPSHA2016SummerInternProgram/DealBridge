# encoding=utf-8

import jieba
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
import re
import numpy as np
import MySQLdb

# several discount detail extracted as instances
# discounts = ["美食 持中信银行信用卡至重庆好利来指定门店刷9积分即可享受价值17元的指定早钱",
#
#              "活动期间，使用中国光大银行信用卡在全国范围内指定餐厅、咖啡店、甜品店等"
#              "（如面包新语、赛百味、禾绿回转寿司）仅刷10元即可享受心仪美味，"
#              "同样的美食，超低的价格，缤纷优惠邀您畅享！",
#
#              "活动期间，持卡人在全国指定哈根达斯门店刷卡消费,在POS机上验证成功获取优惠小票后，"
#              "可享受10元吃哈根达斯单球冰淇淋、脆皮条、小纸杯优惠活动。本次活动名额共计37500个，"
#              "夏季每个活动日均限制优惠名额1875个，冬季每个活动日限制优惠名额865个，"
#              "每位持卡人在优惠日当天仅可享受一次优惠。",
#
#              "活动期间每周五上午十点开始抢票，持卡人客户在格瓦拉@电影APP在线购票，"
#              "并通过指定优惠通道支付，即可享受10元/张优惠价格。每位持卡人（同一"
#              "格瓦拉账户，同一光大银行卡号， 同"
#              "一手机号均视为同一持卡人）活动期间限参与1次最多购买2张电影票。 "
#              "本次活动共计64，800张票，共15个自然周，每周4320张票，数量有限，先到先得。",
#
#              "即日起至，2016年8月28日，中信信用卡持卡人通过指定渠道下单“美国关岛百变自由行美联航北京包机直飞”产品，报名三重优惠："
#              "1,持中信信用卡在线全额支付即可专享立减500元/人"
#              "2,可享：1元美签、提前报名优惠和多人报名优惠（三选一）"
#              "3,持中信银行62开头信用卡在遨游网【出境福利】绑定后，境外刷卡最高返利500元",
#
#              "凤凰知音中信“账户+”是中信银行信用卡中心和中国国际航空股份有限公司基于凤凰知音汇APP打造的数字账户，将为您提供联名信用卡申请、线下兑换星巴克或哈根达斯等商户权益、专属活动的一站式权益服务。"
#              "成功注册账户即可获赠200凤凰知音里程，还有机会获赠5000凤凰知音里程或RIM0WA旅行箱。",
#
#              "精选大陆、港澳台及全球热门网购 300多个国际品牌、上千家商户，只要刷万事达卡，就可尊享 5%额外奖励，"
#              "利上加利！"
#              "消费400美元，即可赚取20美元奖励，赚取奖励无上限。"
#              "可在线兑换各式商户现金券或万事达卡储值卡，使用时无最低消费限额。"
#              "只要1分钟，立即注册，长期有效。",
#
#              "中信悠游出行，百程三重豪礼相送，多年签证，红包立减",
#
#              "一汽吉林 ，智行合一， 森雅R7 ，招行分期低至0费率",
#
#              "活动期间，刷平安信用卡在思妍丽各门店消费享好礼："
#              "1.单笔消费满3888元，即可获赠价值250元的400mlDB多肽活力洗发精一瓶；"
#              "2.单笔消费满5888元，即可获赠价值475元的50mlDECLEOR香薰保湿面霜一瓶。"
#              "注：每人每天仅限兑换1份礼品，礼品在门店指定位置领取，不可叠加领取，礼品各限量50份，数量有限，赠完为止。"
#         ]

# fetch data from database
# db = MySQLdb.connect(host="localhost", user="root", passwd="", db="deal_bridge", charset="utf8")  # local database
db = MySQLdb.connect(host="10.22.96.25", user="dealbridge_user", passwd="dealbridge_pwd", db="deal_bridge", charset="utf8")  # db supported by Jiezhe
cursor = db.cursor()
sql = "SELECT discount_id, bank_name, summary, description FROM discount" # limit 0, 2000"
discounts = []
indices = []
try:
    cursor.execute(sql)
    results = cursor.fetchall()
    discounts = ["%s %s %s" % (result[1], result[2], result[3]) for result in results]
    indices = [result[0] for result in results]
except:
    print "Error, unable to fetch data"

# cut the discount info into meaningful segments and filter out the digits with Jieba library
discounts_after_cut = [re.sub("[\d]+", "", " ".join(jieba.cut(discount))) for discount in discounts]

# stop words example that don't carry meaningful info for the discount
stop_words_list = ['一次', '一瓶', '不可']

# initialize the tf-idf vectorizer with the stop words list
vectorizer = TfidfVectorizer(stop_words=stop_words_list)

# generate the tf-idf vector for each discount info
discounts_tfidf = vectorizer.fit_transform(discounts_after_cut)

# print the words that are extracted as feature by the TF-IDF vectorizer
# features = vectorizer.get_feature_names()
# print("number of features: %d" %(len(features)))
# for feature in features:
#     print feature.encode('utf-8')

# compute the cosine_similarities
cosine_similarities = linear_kernel(discounts_tfidf, discounts_tfidf)
# print cosine_similarities

# fetch the top K  items that are similar to each discount
# K = 3
# for id in xrange(len(cosine_similarities)):
#     similar_indices = cosine_similarities[id].argsort()[-K-1:-1]
#     # similar_items = [(cosine_similarities[id][i], contents[i].encode('utf-8')) for i in similar_indices]
#     print("%d:\n\t%s\n\t is most similar to " % (id, discounts[id]))
#     for index in similar_indices:
#         print("\t\t similarity: %f %s" % (cosine_similarities[id,index],discounts[index]))


# recommend
# recommend based on the user behavior
def content_based_recommend():
    RECOMMEND_CNT = 100
    sql = "select user.user_id, favorite.discount_id from user, favorite where user.user_id = favorite.user_id"
    users = []
    preference = []
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        preference = [(result[0],result[1]) for result in results]
        users = [result[0] for result in results]
        users = list(set(users))     # remove the duplicate one
    except:
        print "Error, unable to fetch data"

    sql = "insert into recommend(user_id, discount_id) values(%s,%s)"
    for user in users:
        print "%d is interested in: " % user
        vector = [0 for ele in cosine_similarities[0]]
        for tu in preference:
            if tu[0] == user:
                print tu[1], indices.index(tu[1])
                print "\t", discounts[indices.index(tu[1])]
                for i in xrange(len(vector)):
                    vector[i] += cosine_similarities[indices.index(tu[1])][i]
        vector = np.array(vector)
        item_indices = vector.argsort()[-RECOMMEND_CNT-1:-1]
        print "so, we recommend to him/her: "
        print item_indices

        for item in xrange(RECOMMEND_CNT):
            item = item_indices[RECOMMEND_CNT - 1 - item]
            try:
                cursor.execute(sql, (user, indices[item]))
                db.commit()
            except:
                print "Insert error"
                db.rollback()
            print "\t%f " % (vector[item]), discounts[item]


# recommend based on the transaction data
def transaction_based_recommend():
    print "recommend based on transaction data"
    sql = "select discount.discount_id, mock_transaction.user_id, mock_transaction.merchant, " \
          "discount.description from discount, mock_transaction " \
          "where mock_transaction.merchant = discount.summary and " \
          "discount.bank_name = mock_transaction.bank_name"
    try:
        cursor.execute(sql)
        results = cursor.fetchall()
        recos = [result[0] for result in results]
        users = [result[1] for result in results]
        users = list(set(users))        # remove the duplicate ones
    except:
        print "fetch data error"
    sql = "insert into recommend(user_id, discount_id) values(%s,%s)"
    for reco in recos:
        try:
            cursor.execute(sql, (users[0], reco))
            db.commit()
        except:
            print "insert error"

# content_based_recommend()
transaction_based_recommend()
db.close()
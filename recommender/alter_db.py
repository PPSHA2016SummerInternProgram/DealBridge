# encoding=utf-8

import MySQLdb
import re
import urlparse
from urllib import urlopen
from xml.dom.minidom import parseString

key = 'X5LMOwZinR2H4vwvUUkE95fei0yfAN3r' # 'q67enuHpNzRHPrVpCqhEsByT5Dm6YtzH' #'5RekZNyYeuAB4CV3DN5GulOKynFNt9lT'  shi  # 'w6LI4tGSMUGsO7rIo1LkLm5n7qdG0Odo'
db = MySQLdb.connect(host="10.24.96.170", user="dealbridge_user", passwd="dealbridge_pwd", db="deal_bridge", charset="utf8")
cursor = db.cursor()
locations = []


def urlEncodeNonAscii(b):
    return re.sub('[\x80-\xFF]', lambda c: '%%%02x' % ord(c.group(0)), b)


def iriToUri(iri):
    parts= urlparse.urlparse(iri)
    return urlparse.urlunparse(
        part.encode('idna') if parti==1 else urlEncodeNonAscii(part.encode('utf-8'))
        for parti, part in enumerate(parts)
    )


# sql = "SELECT discount_id, merchant_location FROM discount where area is null and discount_id > 15540"  # limit 0, 2000"
sql = "select discount_id, latitude, longitude from discount where latitude is not null and discount_id > 10944"
try:
    cursor.execute(sql)
    results = cursor.fetchall()
    locations = [(result[0], result[1], result[2]) for result in results]
except:
    print "Error, unable to fetch data"

sql = "update discount set area = %s where discount_id = %s"
i = 1
for (discount_id, latitude, longitude) in locations:
#   url = 'http://api.map.baidu.com/geocoder/v2/?address=%s&output=xml&ak=%s' % (location, key)
    url = 'http://api.map.baidu.com/geocoder/v2/?ak=%s&location=%f,%f&output=xml&pois=0' % (key, latitude, longitude)
#   doc = urlopen(re.sub('#', '',  iriToUri(url)))   # tag '#' may confuse the url request
    doc = urlopen(url)
    dom = parseString(doc.read())
    status = dom.getElementsByTagName('status')[0].firstChild.data
    area = dom.getElementsByTagName('city')[0].firstChild.data
    print "%d id %d address %s" % (i, discount_id, area)
    i += 1
    if status == '0':  # valid request
        lat = dom.getElementsByTagName('lat')[0].firstChild.data
        lng = dom.getElementsByTagName('lng')[0].firstChild.data
        try:
            cursor.execute(sql, (area, discount_id))
            db.commit()
            print "\tinsertion succeeded"
        except:
            print "\tfailed to insert"
            db.rollback()
    else:              # invalid request
        print "\t invalid "

db.close()
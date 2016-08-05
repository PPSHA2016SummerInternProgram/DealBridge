# encoding=utf-8

import MySQLdb
import re
import urlparse
from urllib import urlopen
from xml.dom.minidom import parseString

key = '5RekZNyYeuAB4CV3DN5GulOKynFNt9lT' # shi 'q67enuHpNzRHPrVpCqhEsByT5Dm6YtzH' # 'w6LI4tGSMUGsO7rIo1LkLm5n7qdG0Odo'
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


sql = "SELECT discount_id, merchant_location FROM discount where area is null and discount_id > 8004"  # limit 0, 2000"
try:
    cursor.execute(sql)
    results = cursor.fetchall()
    locations = [(result[0], result[1]) for result in results]
except:
    print "Error, unable to fetch data"

sql = "update discount set latitude = %s, longitude = %s where discount_id = %s"
for (discount_id, location) in locations:
    url = 'http://api.map.baidu.com/geocoder/v2/?address=%s&output=xml&ak=%s' % (location, key)
    doc = urlopen(re.sub('#', '',  iriToUri(url)))   # tag '#' may confuse the url request
    dom = parseString(doc.read())
    status = dom.getElementsByTagName('status')[0].firstChild.data
    print "id %d address %s" % (discount_id, location)
    if status == '0':  # valid request
        lat = dom.getElementsByTagName('lat')[0].firstChild.data
        lng = dom.getElementsByTagName('lng')[0].firstChild.data
        try:
            cursor.execute(sql, (lat, lng, discount_id))
            db.commit()
            print "\tinsertion succeeded"
        except:
            print "\tfailed to insert"
            db.rollback()
    else:              # invalid request
        print "\t invalid "

db.close()
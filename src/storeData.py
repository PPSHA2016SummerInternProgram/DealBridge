#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb
import sys
reload(sys)
sys.setdefaultencoding('utf8')


def store_discount(discount_dict):
    sql = "INSERT INTO Discount VALUES (NULL, '" \
          + discount_dict['bank'] + "', '" \
          + discount_dict['summary'] + "', '" \
          + discount_dict['description'] + "', '" \
          + discount_dict['begin_time'] + "', '" \
          + discount_dict['end_time'] + "', '" \
          + discount_dict['area'] + "', '" \
          + discount_dict['discount_usage'] + "', '" \
          + discount_dict['discount_detail'] + "', '" \
          + discount_dict['classify'] + "', '" \
          + discount_dict['characteristic'] + "', '" \
          + discount_dict['img'] + "', '" \
          + discount_dict['merchant_description'] + "', '" \
          + discount_dict['merchant_location'] + "', '" \
          + discount_dict['merchant_tel'] + "')"

    # print sql

    db = MySQLdb.connect(host="10.22.99.109", user="root", passwd="abyjun", db="dealbridge", port=3306, charset='utf8')
    # db = MySQLdb.connect(host="localhost", user="root", passwd="abyjun", db="dealbridge", port=3306, charset='utf8')
    cursor = db.cursor()

    try:
        cursor.execute(sql)
        db.commit()
    except Exception, e:
        print e
        db.rollback()

    db.close()

#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb
import sys
import traceback
import log
reload(sys)
sys.setdefaultencoding('utf8')

db = MySQLdb.connect(host="10.22.99.109", user="root", passwd="abyjun", db="deal_bridge", port=3306, charset='utf8')
# db = MySQLdb.connect(host="localhost", user="root", passwd="abyjun", db="deal_bridge", port=3306, charset='utf8')


def is_contain(sql):
    """"
    Query whether the record exit is in the table or not.
    Return 'True' if exit, otherwise return 'False'
    """
    cur = db.cursor()
    cur.execute(sql)
    return len(cur.fetchall()) > 0


def escape_single_quote(string):
    """"
    Escape single quotes for string
    Escape ' to \'
    """
    return string.replace("'", "\\'")


def escape_single_quotes(discount_dicts):
    """
    Escape single quotes for all string columns before generating s sql statement
    """
    for discount_dict in discount_dicts:
        discount_dict['summary'] = escape_single_quote(discount_dict['summary'])
        discount_dict['description'] = escape_single_quote(discount_dict['description'])
        discount_dict['area'] = escape_single_quote(discount_dict['area'])
        discount_dict['discount_usage'] = escape_single_quote(discount_dict['discount_usage'])
        discount_dict['discount_detail'] = escape_single_quote(discount_dict['discount_detail'])
        discount_dict['merchant_description'] = escape_single_quote(discount_dict['merchant_description'])
        discount_dict['merchant_location'] = escape_single_quote(discount_dict['merchant_location'])


def store_discount(discount_dicts):
    cur = db.cursor()
    sql = "INSERT INTO discount (bank, summary, description, begin_time, end_time, area," \
          " discount_usage, discount_detail, classify, characteristic, img, merchant_description," \
          " merchant_location, merchant_call, end_of_url) VALUES  "

    escape_single_quotes(discount_dicts)

    for i in range(len(discount_dicts)):
        discount_dict = discount_dicts[i]
        if i != 0:
            sql += ', '
        sql += "('" + discount_dict['bank'] + "', '" \
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
                 + discount_dict['merchant_tel'] + "', '" \
                 + discount_dict['end_of_url'] + "')"

    try:
        cur.execute(sql)
        db.commit()
    except:
        # print sql
        # problem_url = "http://www.rong360.com/credit/youhui/" + discount_dict['end_of_url']
        log.record_error_to_logfile("There is something wrong with sql: " + sql)
        log.record_error_to_logfile(traceback.format_exc())


# print is_contain("select * from deal_bridge.discount where end_of_url = '9afc721968ddb8e4e8537c6ffee3d794'")
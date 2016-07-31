#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb
import sys
import traceback
import log
reload(sys)
sys.setdefaultencoding('utf8')

db = MySQLdb.connect(host="localhost", user="root", passwd="abyjun", port=3306, charset='utf8')


def insert_record(discount_id, area):
    sql = "insert ignore into deal_bridge.area (discount_id, discount_area) value ( '" + str(discount_id) + "', '" + area + "')"
    cur = db.cursor()
    cur.execute(sql)
    if area != '全国':
        cur.execute("select parent_id from location.locations where name = '" + area + "'")
        parent_id = cur.fetchone()[0]
        if parent_id == 0:
            insert_record(discount_id, "全国")
        else:
            cur.execute("select name from location.locations where id = " + str(parent_id))
            parent_name = cur.fetchone()[0]
            insert_record(discount_id, parent_name)


def insert_records(discount_id, areas_string):
    areas = areas_string.split('、')
    cur = db.cursor()
    for area in areas:
        if area == '全国':
            insert_record(discount_id, '全国')
        else:
            for string in [area + '区', area + '县', area + '市', area + '省']:
                sql = "select id from location.locations where name = '" + string + "'"
                cur.execute(sql)
                if cur.rowcount > 0:
                    insert_record(discount_id, string)
                    break
    db.commit()


def store_location_to_another_table():
    sql = "SELECT discount_id, area FROM deal_bridge.discount where area != ''"
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        for i in range(cursor.rowcount):
            result = cursor.fetchone()
            discount_id = result[0]
            area = result[1]
            insert_records(discount_id, area)
    except:
        traceback.print_exc()




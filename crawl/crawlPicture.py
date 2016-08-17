#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb
import sys
import traceback
import urllib
import multiprocessing
import threading
import re
import socket
from multiprocessing import Process, Queue, Pool

reload(sys)
sys.setdefaultencoding('utf8')

db = MySQLdb.connect(host="127.0.0.1", user="root", passwd="abyjun", db="test", port=3306, charset='utf8')

def get_pic_list():
    sql = "select end_of_url,img from discount"
    cur = db.cursor()
    cur.execute(sql)
    results = cur.fetchall()
    imgs = []
    for row in results:
        imgs.append([row[0], row[1]])
    return imgs


def regular(pattern, string):
    p = re.compile(r'' + pattern)
    result = re.findall(p, string)
    return result[0]


def get_img_format(string):
    pattern = '.*(\..*)'
    return regular(pattern, string)


def download_img(queue, imgs):
    p_num = queue.get()
    while p_num < len(imgs):
        print p_num
        p_num += 1
        queue.put(p_num)
        element = imgs[p_num - 1]
        url = element[1]
        name = element[0]
        try:
            img_format = get_img_format(url)
        except:
            traceback.print_exc()
        path = r"./img/" + name + img_format


        try:
            socket.setdefaulttimeout(30)
            urllib.urlretrieve(url, path)
        except:
            print 'picture:' + url + "download failed."
        p_num = queue.get()
        if p_num >= len(imgs):
            queue.put(p_num)
            break


if __name__ == '__main__':
    manager = multiprocessing.Manager()
    queue = manager.Queue()  # a queue storing index of url
    queue.put(0)  # Initialization of url index
    imgs = get_pic_list()
    print len(imgs)

    thread_num = 20
    pool = Pool(thread_num)
    for i in range(thread_num):
        pool.apply_async(download_img, args=(queue, imgs))
    pool.close()
    pool.join()
    file.close()


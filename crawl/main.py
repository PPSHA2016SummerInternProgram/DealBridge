#!/usr/bin/python
# -*- coding: UTF-8 -*-
import threading
import requests
import detail_info
import store_data
import bs4
import re
import sys
import log
import multiprocessing
import traceback
import store_data
from request_page import get_page
from multiprocessing import Process, Queue, Pool
reload(sys)
sys.setdefaultencoding('utf8')


def get_num_of_page(url):
    """Get the total number of discounts"""
    content = get_page(url)
    result_title = content.find("div", {"class": "result-title"}).string.encode("latin1")
    pattern = re.compile(r'.*?(\d+).*')
    total_result = re.findall(pattern, result_title)[0]
    total_result = int(total_result)
    # print total_result
    num_of_page = total_result / 20
    if total_result % 20 != 0:
        num_of_page += 1
    return num_of_page


def get_end_of_url(url):
    """Return the distinctive content of a series of urls.
       Example:
           url: 'http://www.rong360.com/credit/youhui/2469ec8784e05534c603e15276cc3afb'
           return '2469ec8784e05534c603e15276cc3afb'
    """
    p = re.compile(r'.*/(.*)')
    return re.findall(p, url)[0]


def get_short_description_page(url):
    """Get the content of a short description page.
       Each short description page has twenty subpage.
       Then, continue to get content of all subpages and store the result to database.
    """
    try:
        content = get_page(url)
        li = content.findAll("li", {"class": "clearfix"})
        discount_dicts = []
        for discount in li:
            img = discount.find("img")['src']
            link = 'http://www.rong360.com' + discount.find("a")['href']
            if link == 'http://www.rong360.com/credit/xingye':
                break
            discount_dict = detail_info.get_detail_info(link)
            end_of_url = get_end_of_url(link)
            sql = "select count(*) from discount where end_of_url = '" + end_of_url + "'"
            if store_data.is_contain(sql) is True:      # if database has this record before, not need to crawl again
                continue
            else:
                print sql

            if discount_dict is None:
                log.record_error_to_logfile("There is something wrong when parsing the url: " + link)
                continue
            discount_dict['end_of_url'] = end_of_url
            discount_dict['img'] = img
            discount_dict['classify'] = ''
            discount_dict['characteristic'] = ''
            discount_dicts.append(discount_dict)

        if len(discount_dicts) > 0:
            store_data.store_discount(discount_dicts)
    except Exception, e:
        print e
        traceback.print_exc()


def work(queue, total_num_of_page):
    p_num = queue.get()
    while p_num < total_num_of_page:
        p_num += 1
        queue.put(p_num)
        url = 'http://www.rong360.com/credit/f-youhui' + '-p' + str(p_num)
        get_short_description_page(url)
        p_num = queue.get()
    queue.put(p_num)


if __name__ == '__main__':
    total_num_of_page = get_num_of_page('http://www.rong360.com/credit/f-youhui')
    thread_num = 2
    manager = multiprocessing.Manager()
    queue = manager.Queue()
    queue.put(0)

    print str(total_num_of_page)
    pool = Pool(thread_num)
    for i in range(thread_num):
        pool.apply_async(work, args=(queue, total_num_of_page))

    pool.close()
    pool.join()


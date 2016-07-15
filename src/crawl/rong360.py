#!/usr/bin/python
# -*- coding: UTF-8 -*-
import threading
import requests
import detailInfo
import storeData
import bs4
import re
import sys
reload(sys)
sys.setdefaultencoding('utf8')


def get_page(url):
    """Get the content of the url by using BeautifulSoup"""
    try:
        response = requests.post(url)
    except Exception, e:
        print e
    return bs4.BeautifulSoup(response.text)


def get_num_of_discount(url):
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


def get_short_description_page(url):
    """Get the content of a short description page.
       Each short description page has twenty subpage.
       So, continue to get content of all subpages and store the result to database.
    """
    content = get_page(url)
    li = content.findAll("li", {"class": "clearfix"})
    for discount in li:
        img = discount.find("img")['src']
        link = 'http://www.rong360.com' + discount.find("a")['href']
        discount_dict = detailInfo.get_detail_info(link)
        if discount_dict is None:
            continue
        discount_dict['img'] = img
        discount_dict['classify'] = ''
        discount_dict['characteristic'] = ''
        storeData.store_discount(discount_dict)


class CrawlThread(threading.Thread):
    """A thread to crawl data.
       Using 'Condition' to ensure proper synchronize between multi-thread
    """
    def __init__(self):
        threading.Thread.__init__(self)

    def run(self):
        global p_num, total_num_of_page, con
        while p_num < total_num_of_page:
            con.acquire()
            p_num += 1
            con.notify()
            con.release()

            url = 'http://www.rong360.com/credit/f-youhui'
            if p_num != 1:
                url += '-p' + str(p_num)    # make up a url of short description page
            get_short_description_page(url)


total_num_of_page = get_num_of_discount('http://www.rong360.com/credit/f-youhui')
thread_num = 20
p_num = 1   # the begin num of short description page we crawl
con = threading.Condition()    # a variable to ensure proper synchronize between multi-thread

for i in range(thread_num):
    CrawlThread().start()

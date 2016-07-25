#!/usr/bin/python
# -*- coding: UTF-8 -*-
import bs4
import requests
import requesocks


def get_page(url):
    """
    Get the content of the url by using BeautifulSoup
    """
    try:
        session = requesocks.session()
        session.proxies = {'http': 'socks5://127.0.0.1:9050',
                           'https': 'socks5://127.0.0.1:9050'}
        response = session.get(url)
    except Exception, e:
        print e
    return bs4.BeautifulSoup(response.text)


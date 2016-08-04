#!/usr/bin/python
# -*- coding: UTF-8 -*-
import bs4
import requests
import requesocks
import time


def get_page(url):
    """
    Get the content of the url by using BeautifulSoup
    """
    try:
        session = requesocks.session()
        session.proxies = {'http': 'socks5://127.0.0.1:9050',
                           'https': 'socks5://127.0.0.1:9050'}
        response = session.get(url, timeout=5)
        return bs4.BeautifulSoup(response.text)
    except Exception, e:
        return get_page(url)


#!/usr/bin/python
# -*- coding: UTF-8 -*-
import requests
import traceback
import bs4
import re
import sys
reload(sys)
sys.setdefaultencoding('utf8')

ENCODE_FORMAT = 'latin1'


def regular(pattern, string):
    p = re.compile(r'' + pattern)
    result = re.findall(p, string)
    return result


def remove_blank(string):
    """Remove all the blank for the given string
       and return a string after removing operation
    """
    p = re.compile('\s+')
    return re.sub(p, '', string)


def convert_date(date):
    date = date.replace('年', '-')
    date = date.replace('月', '-')
    date = date.replace('日', '')
    return date


def get_bank_name(title):
    pattern = '【(.*?)】'
    return regular(pattern, title)[0]


def get_summary(title):
    pattern = '【.*?】(.*)'
    return regular(pattern, title)[0]


def get_description(soup_content):
    """Get description of the discount message and return it as a string."""
    description = soup_content.find('p', {'class': 'p1'})

    # there are two types of page
    if description is not None:     # deal with the first type
        if description.string is None:
            description = remove_blank(str(description))
            description = regular('>(.*?)</p>', description)[0].encode(ENCODE_FORMAT)
        else:
            description = description.string.encode(ENCODE_FORMAT).strip()
    else:     # another type of pages
        tmp = soup_content.findAll('div', {'class': 'text'})
        description = tmp[0].find('p')
        if description is not None:
            description = description.string.encode(ENCODE_FORMAT)
        else:
            description = regular('\">(.*?)</div>', str(tmp[0]))[0].encode(ENCODE_FORMAT)
    return description


def get_merchant_description(merchant_info):
    """"Return a string represents description of the merchant."""
    merchant_description = merchant_info[1].string
    if merchant_description is not None:
        merchant_description = merchant_description.encode(ENCODE_FORMAT)
    else:
        merchant_description = ''
    return merchant_description


def get_merchant_location(merchant_info):
    return regular('>(.*?)<', str(merchant_info[3]))[0].encode(ENCODE_FORMAT)


def get_merchant_tel(soup_content):
    p2 = soup_content.findAll('div', {'class': 'p2'})
    if len(p2) > 0:
        return ''
    else:
        p1 = soup_content.findAll('span', {'class': 'p1'})
        mer_tel = str(p1[1])
        mer_tel = remove_blank(mer_tel)
        pattern = re.compile(r'</span>(.*?)</span>')
        mer_tel = re.findall(pattern, mer_tel)[0].encode(ENCODE_FORMAT)
        return mer_tel


def get_discount_time(soup_content):
    """Get start time and end time for the discount message.
       If it has no begin time, set it '0000-00-00' as default.
       If it has no end time, set it '9999-12-31' as default.
       Return a list, which contain two elements.
       First element is the begin time and second element is end time.
    """
    p2 = soup_content.findAll('div', {'class': 'p2'})

    if len(p2) > 0:
        data = str(p2[0]).encode(ENCODE_FORMAT)
    else:
        p1 = soup_content.findAll('span', {'class': 'p1'})
        data = str(p1[0]).encode(ENCODE_FORMAT)

    data = remove_blank(data)
    if data.find('长期有效') != -1:  # if it has no begin time nor end time
        begin_time = '0000-00-00'
        end_time = '9999-12-31'
    elif data.find('开始') == -1:  # if it has no begin time
        pattern = re.compile(r'</span>(.*?)\(')
        end_time = re.findall(pattern, data)[0]
        begin_time = '0000-00-00'
    else:
        pattern = re.compile(r'</span>(.*?)\(')
        begin_time = re.findall(pattern, data)[0]
        if data.find('结束') == -1:  # if it has no end time
            end_time = '9999-12-31'
        else:
            pattern = re.compile(r'~(.*?)\(')
            end_time = re.findall(pattern, data)[0]

    begin_time = convert_date(begin_time)
    end_time = convert_date(end_time)
    return [begin_time, end_time]


def get_area(soup_content):
    """Return the area(a string) where the discount can use."""
    p2 = soup_content.findAll('div', {'class': 'p2'})
    area = ''
    if len(p2) < 2:
        return area
    else:
        data = str(p2[1]).encode(ENCODE_FORMAT)
        p = re.compile('\s+')
        data = re.sub(p, '', data)
        pattern = re.compile(r'span>(.*?)<')
        area = re.findall(pattern, data)[0]
        return area


def get_content_usage(content):
    """Return a string represents the message that how to use the discount."""
    activities = content.find_next_sibling().findAll("div", {"class": "list-l"})
    result = ''
    for activity in activities:
        activity_name = activity.find("p", {"class": "list-tit"}).string.encode("latin1")
        result += activity_name + ':'
        imgs = activity.findAll("img")
        for img in imgs:
            result += img["src"] + '|'
            result += ';'
    return result


def get_content_detail(content):
    """Return a string represents some other details that how to use the discount."""
    s = content.find_next_sibling().findAll('div', {"class": "list-l"})[0]
    s = remove_blank(str(s))
    s = regular('>(.*?)</div>', s)
    return s[0].encode(ENCODE_FORMAT).replace('<br/><br/>', '<br/>')


def get_detail_info(url):
    """Get the detail information for the given url.
       Return a dictionary, which contains the messages of discount.
    """
    try:
        response = requests.post(url)
    except Exception, e:
        print e
        traceback.print_exc()

    try:
        result_dict = {}    # a dictionary that store the discount message
        soup_content = bs4.BeautifulSoup(response.text)

        title = soup_content.find('div', {'class': 'p1'}).string.encode(ENCODE_FORMAT).strip()
        result_dict['bank'] = get_bank_name(title)
        result_dict['summary'] = get_summary(title)

        print 'bank: ' + result_dict['bank']
        print 'summary: ' + result_dict['summary']

        result_dict['description'] = get_description(soup_content)
        print 'description: ' + result_dict['description']

        merchant_description = ''
        merchant_location = ''

        merchant_info = soup_content.findAll('div', {'class': 'text'})
        if len(merchant_info) > 0:
            merchant_location = get_merchant_location(merchant_info)
            merchant_description = get_merchant_description(merchant_info)
        print 'merchant_description: ' + merchant_description
        print 'merchant_location: ' + merchant_location

        discount_time = get_discount_time(soup_content)
        result_dict['begin_time'] = discount_time[0]
        result_dict['end_time'] = discount_time[1]
        print result_dict['begin_time']
        print result_dict['end_time']

        result_dict['area'] = get_area(soup_content)
        print result_dict['area']

        # parse info including how to use the discount and what should be noted when using the discount
        con_tit = soup_content.findAll("div", {"class": "con-tit"})
        result_dict['discount_usage'] = ''
        result_dict['discount_detail'] = ''

        for content in con_tit:
            string = content.string.encode('latin1')
            if string == '活动内容':
                result_dict['discount_usage'] = get_content_usage(content)
            elif string == '活动细则':
                result_dict['discount_detail'] = get_content_detail(content)

        merchant_tel = get_merchant_tel(soup_content)
        print('discount content: ' + result_dict['discount_usage'])
        print('discount detail: ' + result_dict['discount_detail'])
        result_dict['merchant_description'] = merchant_description
        result_dict['merchant_location'] = merchant_location
        result_dict['merchant_tel'] = merchant_tel
        return result_dict
    except Exception, e:
        print e
        traceback.print_exc()

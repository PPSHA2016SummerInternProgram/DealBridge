#!/usr/bin/python
# -*- coding: UTF-8 -*-
import logging
import datetime


def record_error_to_logfile(message):
    log_name = './log/' + str(datetime.date.today()) + '.txt'
    logger = logging.getLogger()
    fh = logging.FileHandler(log_name)
    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    fh.setFormatter(formatter)
    logger.addHandler(fh)
    logger.error(message)


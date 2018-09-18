#!/usr/local/bin/python3
# -*- coding: UTF-8 -*-

import requests

r = requests.get('https://github.com/timeline.json')

print(r.text)

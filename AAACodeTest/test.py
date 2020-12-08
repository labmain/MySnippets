import time
import hmac
import hashlib
import base64
import urllib.request

timestamp = 1600404500544
secret = 'SEC88f83cd41a22393c6cc2efb1e26d8240'
secret_enc = secret.encode('utf-8')
string_to_sign = '{}\n{}'.format(timestamp, secret)
string_to_sign_enc = string_to_sign.encode('utf-8')
hmac_code = hmac.new(secret_enc, string_to_sign_enc, digestmod=hashlib.sha256).digest()
sign = urllib.request.quote(base64.b64encode(hmac_code))
print(base64.b64encode(hmac_code))
print(timestamp)
print(sign)
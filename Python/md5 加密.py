def md5Encode(str):
    import hashlib
    #参数必须是byte类型，否则报Unicode-objects must be encoded before hashing错误  
    m = hashlib.md5(str.encode(encoding='utf-8'))
    return m.hexdigest()

a = md5Encode("dfdf")
print a
import zlib,base64
# message = 'witch which has which witches wrist watch'
# compressed = zlib.compress(message)
# decompressed = zlib.decompress(compressed)
# print 'original:', repr(message)
# print 'compressed:', str(base64.decode('eNozNDJOTEpOebJj7bNp7c82dj5dOx0AWlcKtg=='))
# print 'decompressed:', repr(decompressed)

print zlib.decompress(base64.decodestring('eNozNDJOTEpOebJj7bNp7c82dj5dOx0AWlcKtg=='))

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-a', '--arg', nargs='+', type=int)
print parser.parse_args()

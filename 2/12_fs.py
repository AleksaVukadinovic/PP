import sys
import os

print(sys.argv)

print(os.curdir)
print(os.pardir)
print(os.curdir, os.path.abspath(os.curdir))
print(os.curdir, os.path.abspath(os.pardir))
print(os.curdir, os.path.abspath('../../'))
print(os.curdir, os.path.abspath('../../../'))
print(os.sep) # separator za fajlvoe u os-u

print(os.listdir('.'))

data = os.listdir('.')
paths = []

for name in data:
    path = os.path.join(os.path.abspath(os.curdir), name)
    paths += [path]

print(paths)

os.walk('../..')

print('-----------------------')

for (current_dir, sub_dir, sub_file) in os.walk('../..'):
    print(current_dir)
    print(sub_dir)
    print(sub_file)
    input()

os.path.isfile('putanja')
os.path.isdir('putanja')
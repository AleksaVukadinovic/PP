# basic biblioteke

import sys
import os
import math
import random
import time

print(sys.argv)


print(os.listdir('.'))
os.system('ls -lt')
os.system('ls -lht')
os.system('ls -lhat')

print(math.factorial(5))
print(math.log(1000, 10))

print(random.random())
print(random.randint(0, 10))
print(random.randint(0, 1))

sys.exit(1)

# promenljiva bez imena

n0 = 0
n1 = 1

start_time = time.time()
for _ in range(1000):
  i = random.randint(0, 1)
  if i == 0:
    n0 += 1
  elif i == 1:
    n1 += 1
  else:
    print('Fatal error\n')
    sys.exit(1)

  print('0: {}\n'.format(n0))
  print('1: {}\n'.format(n1))
end_time = time.time()

print('Time consumption: {}s\n'.format(end_time-start_time))

a = time.time()
b = time.time()
print(b-a)

time.sleep(1)

# selektivni import + alias
from re import search as re_search
print(re_search(r'[0-9]+', input('Unesi string: ')))

# Komentar

"""
Viselinijski komentar
Viselinijski komentar
Viselinijski komentar
"""

# Ispis

print("Hello World!\n")
print('Hello World!\n')
print('Hello World!', end="\n")
print("Hello World!", end=".")
print('Hello', 'World', '!', sep='<-->', end='\n')

# Unos

print('Unesi ceo broj: ')
x = input()
print(x)
print(type(x))
y = int(input())
z = int(input('Unesi ceo broj: '))

a = 3.4
b = 5
s = a + b
print(s)

print('{} + {} = {}', a, b, s)
print('{} + {} = {}'.format(a, b, s))
print('{0:f} + {1:d} = {2:f}'.format(a, b, s))
print('{0:10.2f} + {1:d} = {2:f}'.format(a, b, s))

# try-except

import sys

try:
    a = int(input('Unesi int: '))
except ValueError as e:
    print('Error: cannot cast')
    print(e)
    sys.exit(1)
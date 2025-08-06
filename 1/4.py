# Funkcija

def square(x):
  """Racuna kvadrat broj"""
  return x*x;

print(help(square))

def square2(x):
  return x**2

print('Functions')

a = square(-23.3)

print(a)


def empty(x, y, z):
  pass

print(empty(1, 2, 3))

b= 10
print('id in main: ', id(b))
def translate(x):
  x = x-1
  return x

print(translate(square(10)))

def translate_l(x):
  x = x[:-1]
  print(x)

l = [1, 2, 3]
l1 = translate_l(l)
print(l, id(l))
print(l1, id(l1))


# u pyythonu su objekti prenose preko reference

def translate_2(x):
  x[0] = 9999
  x = x + [8888] # ne menja original
  x += [8888] # menja original
  return x

# nested funkcije

def avg(x, y, z):
  def sum(x, y, z): # moguce je pristupiti samo unutar avg funkcije
    return x + y + z
  return sum(x, y, z) / 3
print(avg(10, 3, 5))

# lambda funkcije

sum = lambda x, y, z: x + y + z
avg_cpy = avg
print(avg)
print(avg_cpy)
print(sum)
print(sum(1, 2, 4))


# pravi "recnik" od argumenata - kupi sve neimenovano argumente fje
def ex(**x):
  print(x)

ex(a=1, b=2)

# pravi tuple od argumenata
def ex1(*x):
  print(x)

ex1()
ex1(1,2)
ex1([1,2,3], 'sdsds', 1)

def ex3(a,b,c):
  print(a, b, c)

ex3(1, 2, 3) # radi
ex3(1, 2, c=3) # radi
ex3(1, b = 2, c = 3) # da nismo imenovali C, ne bi radilo

def ex4(a, b, c, *y, **x):
  print(a, b, c)
  print(y)
  print(x)

ex4(1,2,3,4,5, d=10, e=50)
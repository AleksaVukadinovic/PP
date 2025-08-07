l = list(range(20))
print(l)

"""
map(funkcija, kolekcija) - ne modifikuje orginalnu kolekciju, vraca novu
funkcija jednog argumenta, gde svaki argument pripada kolekciji
kolekcija je nesto iterabilno
"""
def kvadriraj(x):
    return x*x

l1 = list(map(kvadriraj, l))
print(l)
print(l1)

l2 = list(map(lambda x: x**2, l))
print(l2)

l3 = [elem**2 for elem in l]
print(l3)

"""
filter(funkcija, kolekcija) - ne modifikuje orginalnu kolekciju, vraca novu
vraca elemente za kolekcije za koje funkcinja vrati true
"""

l4 = list(filter(lambda elem: True, l1))
print(l4)

l5 = list(filter(lambda elem: elem%2==0, l1))
print(l5)

l6 = [elem**2 for elem in l if elem % 2 == 0]
print(l6)

# Provera iterabilnosti
for elem in filter(lambda elem: elem%2 == 0, map(lambda elem: elem**2, l)):
    print(elem)

# Zip - spaja elemnte iz prve kolekcije sa elemntima iz druge
z = list(zip([1, 2, 3], ['Ana', 'Aca', 'Aleksa']))

# reduce
from functools import reduce
l = [i for i in range(10)]
print(reduce(lambda x, y: x + y, l))
print(sum(l))

# partial
from functools import partial
import math
def stepen(x, n):
    return math.pow(x, n)
kvadriraj = partial(stepen, n = 2)
print(kvadriraj(5))
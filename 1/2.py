# Grananje

a = int(input("Unesi a:"))
b = int(input("Unesi b:"))
if a > b:
    print('a je vece')
elif a==b:
    print('a==b')
else:
    print('a je manje')

# Petlje

i = 0
l = []
while i <= 10:
    print(i, end='')
    i = i + 1 # i++ ne moze, nije podrzana sintaksa
    l.append(i)

print(l)

for i in range(10):
    print(l, end='')
print()

# Stringove
# Stringovi su imutabilni

s = 'Danas je 23 feb'
s1 = 'Danas je 23 feb'
print(s, id(s))
print(s1, id(s1))

# s[0] = 'A' daje gresku - stringovi su imutabilni

# bitno je samo da je iterabilno i moze da se loopuje
for elem in [1,2,3,4]:
    print(elem)
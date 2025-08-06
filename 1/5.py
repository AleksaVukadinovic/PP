# strukture podataka

if __name__ == '__main__':
  print('Collections...')

  # Liste
  l = [1, 2, 3]

  l.append(1)
  l += [1]
  l += [2, 2, 2]

  print(l, sum(l), len(l))

  l.pop()
  print(l)

  l = list(range(10))
  print(l)

  l = 10 * list(range(10))
  print(l)

  l = list(range(0, 100, 10))
  print(l)

  l += ['Matf', 'bg', 'ac', 'rs']
  l += [1.2, 34.34]
  l += [[1, 2, 3]]
  l += [[[1, 2], [3, 4]]]

  for i, elem in enumerate(l):
    print(i, elem)

  print(l[0:3])
  print(l[-1])
  print(l[-3:])
  print(max(l)) # Vraca gresku jer ne moze da poredi sa stringovima

  # Skupovi

  imena = set()
  for ime in ['ana', 'aca', 'pera', 'aca', 'aca']:
    imena.add(ime)
  print(imena)
  print(len(imena))
  print(set(['ana', 'aca', 'pera', 'aca', 'aca']))

  # Stek ?

  stack = []
  stack.append(1)
  stack.append(2)
  stack.append(3)
  stack.append(4)
  print(stack)
  print(stack.pop())
  print(stack)

  # Mapa
  prosecna_ocena = {'1l': 8.7, '2l': 8.6, '3l':9.4, '2L':9.5}
  print(prosecna_ocena)
  print(prosecna_ocena.keys)
  print(prosecna_ocena.values)
  for elem in prosecna_ocena:
    print(elem)
  for elem in prosecna_ocena:
    print(elem, prosecna_ocena[elem])

  # Torka (imutabilne su)

  l = [1, 2, 3, 4] # lista
  t = (1, 2, 3, 4) # torka
  l.append(1)
  # t.append(1) ne moze da se menja
  prosecna_ocena[t] = 10.0 # tuple moze ovde jer je imutabilan, 
  #ali lista ne moze jer moze da se menja pa nije hashable
  print(prosecna_ocena)

  def f():
    return 1, 2, [1, 2, 3]
  print(f())

  # Heap

  import heapq

  H = [21, 1, 45, 78, 3, 5]
  heapq.heapify(H)
  print(H)
  heapq.heappush(H, 8)
  print(H)

  def hips(iterable):
    h = []
    for value in iterable:
      heapq.heappush(h, value)
    return [heapq.heappop(h) for _ in range(len(h))]
  
  print(hips([2, 3, -2, 12, -23, 5, 9, 0]))
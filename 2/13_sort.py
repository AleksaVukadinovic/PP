import math
tacke = [(1, 2), (32, 2), (-1, -1), (100, 2000)]

print(tacke)
print(sorted(tacke))
print(sorted(tacke, reverse=True))


def l2(t):
  return math.sqrt(t[0]**2 + t[1]**2)
print(sorted(tacke, key = l2))
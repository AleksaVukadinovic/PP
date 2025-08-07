import constraint

"""
Ovaj tip problema uvek prati isti sablon:

1. Instanciranje problema
2. Dodavanje promenljivih
3. Dodavanje organicenja
4. resavanaje
"""

# Instanciranje problema
problem = constraint.Problem()

# Dodavanje promenljivih
problem.addVariable('x', ['a', 'b', 'c'])
problem.addVariable('y', [1, 2])
problem.addVariable('z', [0.1, 0.2, 0.3])

def condition(y, z):
    if y / 10 == z:
        return True
    else:
        return False

# Dodavanje ogranicenja
problem.addConstraint(condition, ['y', 'z'])

# resavanje
results = problem.getSolutions()
print(results)
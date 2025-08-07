"""
A B C
D E F
G H I
suma == 15
"""

import constraint

problem = constraint.Problem()

problem.addVariables('ABCDEFGHI', range(1, 10))
problem.addConstraint(constraint.AllDifferentConstraint())

def sum_constraint(x, y, z):
    return x + y + z == 15

problem.addConstraint(sum_constraint, 'ABC')
problem.addConstraint(sum_constraint, 'DEF')
problem.addConstraint(sum_constraint, 'GHI')
problem.addConstraint(sum_constraint, 'ADG')
problem.addConstraint(sum_constraint, 'BEH')
problem.addConstraint(sum_constraint, 'CFI')
problem.addConstraint(sum_constraint, 'AEI')
problem.addConstraint(sum_constraint, 'CEG')


solutions = problem.getSolutions()
for solution in solutions:
  print('{} {} {}'.format(solution['A'], solution['B'], solution['C']))
  print('{} {} {}'.format(solution['D'], solution['E'], solution['F']))
  print('{} {} {}\n\n'.format(solution['G'], solution['H'], solution['I']))

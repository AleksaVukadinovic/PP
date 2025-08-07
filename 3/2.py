import constraint

problem = constraint.Problem()

problem.addVariable('duzina', range(10))
problem.addVariable('sirina', range(10))
problem.addVariable('visina', range(10))

def constraints_dims(d, s, v):
    if d!=s and d!=v and s!=v:
        return True
    
problem.addConstraint(constraints_dims, ['duzina', 'sirina', 'visina'])

# Umesto da sami definisemo, mogli smo i ovako

problem.addConstraint(constraint.AllDifferentConstraint())

# Mozemo i ovu varijatnu

problem.addConstraint(constraint.AllEqualConstraint)

"""
Od ovih ugradjenih constraintova imamo:
    constraint.AllDifferentConstraint()
    constraint.AllEqualConstraing()
    constraint.MaxSumConstraint()
    constraint.MinSumConstraint()
    constraint.ExactSumConstraint()
    constraint.InSetConstraint()
    ...
"""

solutions = problem.getSolutions()
for solution in solutions:
    print(solution)

print('--------------------------------------')
print(help(constraint))
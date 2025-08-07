"""
Naci trocifreni ABC
gde su A, B, C razliciti brojevi
tako da je min ABC/(A+B+C)
"""

import constraint

problem = constraint.Problem()

problem.addVariable('A', range(1, 10))
problem.addVariables('BC', range(10))

problem.addConstraint(constraint.AllDifferentConstraint())

def evaluate(solution):
    assert isinstance(solution, dict) and \
    'A' in solution and \
    'B' in solution and \
    'C' in solution, 'Fatal Error: invalid argument'
    A, B, C =  solution['A'], solution['B'], solution['C']
    return (100*A + 10*B + C) / (A + B + C)

solutions = problem.getSolutions()
best_solution = solutions[0]
for solution in solutions[1:]:
    if evaluate(solution) < evaluate(best_solution):
        best_solution = solution;

print(best_solution)
# print(solutions)
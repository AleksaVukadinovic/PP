# novcic: 1d, 2d, 5d, 10d, 20d
# kako do 50 din?

import constraint

problem = constraint.Problem()

problem.addVariable('1din', range(0, 51))
problem.addVariable('2din', range(0, 26))
problem.addVariable('5din', range(0, 11))
problem.addVariable('10din', range(0, 6))
problem.addVariable('20din', range(0, 3))

def ogr(kd1, kd2, kd5, kd10, kd20):
    if kd1 + 2*kd2 + 5*kd5 + 10*kd10 + 20*kd20 == 50:
        return True
    else:
        return False
    
problem.addConstraint(ogr, ['1din', '2din', '5din', '10din', '20din'])

solutions = problem.getSolutions()
for solution in solutions:
    print(solution)

# Moglo je i ovako:

problem.addConstraint(constraint.ExactSumConstraint(50, [1, 2, 5, 10, 20]), ['1din', '2din', '5din', '10din', '20din'])
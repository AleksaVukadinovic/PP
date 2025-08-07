"""
Pekar proizvodi hleb i kifle
hleb: 10min
kifla: 12min
hleb: 300g
kifla: 120gr
hleb: 7din
kifla; 9din
Pekara ima 20h vremena, i 10kg brasna
Pod pretpostavkom da ce se sve prodati, kako ostvariti maksimalnu zaradu
"""

import constraint

problem = constraint.Problem()

problem.addVariable('h', range(int(min(20*60/10, 10*1000/300)+1)))
problem.addVariable('k', range(int(min(20*60/12, 10*1000/120)+1)))

def constraint_time(h, k):
    if 10 * h + 12 * k <= 20 * 60:
        return True
    else:
        return False

def constraint_size(h, k):
    if 300 * h + 120 * k <= 10 * 1000:
        return True
    else:
        return False
    
problem.addConstraint(constraint_time, ['h', 'k'])
problem.addConstraint(constraint_size, ['h', 'k'])

solutions = problem.getSolutions()
max_solution = solutions[0]
for solution in solutions[1:]:
    if 7*solution['h'] + 12*solution['k'] > 7*max_solution['h'] + 12*max_solution['k']:
        max_solution = solution

print(max_solution)
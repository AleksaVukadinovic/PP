% suma (N, S) - u S upisuje sumu prvih N prirodnih brojeva

suma(1, 1):- !.
suma(N, S):- N>1, N1 is N - 1, suma(N1, S1), S is N + S1.

dummy(1):- !.
dummy(N):- write(N), nl, dummy(N-1).
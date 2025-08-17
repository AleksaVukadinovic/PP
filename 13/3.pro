/*

1) generisanje promenljivih i njihovih domena
2) generisanje organicenja nad promenljivim
3) instanciranje promenljivih ili obelezavanje (labeling)

definisanje domena:
    X in D ili X :: D - X uzima vrednosti iz konacnog domena D
    Vars in D ili Vars :: D - sve promenljive iz liste Vars uzimaju vrednosti iz D
    D - interval u obliku pocetak..korak..kraj

organicenja:
    1) opsta
        alldifferent(Vars) ili alldistinct(Vars)
        atmost(N, L, V)
        atleast(N, L, V)
        exactly(N, L, V)
    2) aritmeticka
        I1 R I1     R <- { #=, #\=, #>=, #>, #=<, ...}
        min(L)
        max(L)
        sum(L)

instanciranje:
    labeling(Vars)
    labeling(Options, Vars)
    opcije:
        minimize(E)
        maximize(E)
*/

% X, Y, Z
% X <- 1, 2, 3
% Y <- 2, 4, 6, 8, 10
% Z <- 5, 6, 7, 8
% Z >= Y

primer(Vars) :- Vars = [X, Y, Z],   % definisanje promenljivih
    X :: 1..3,                      % definisanje domena 
    Y :: 2..2..10,                  % definisanje domena
    Z :: 5..8,                      % definisanje domena
    Z #>= Y,                        % definisanje ogranicenja
    labeling(Vars).

kvadrati(Vars) :- Vars = [X],
    X :: 1..100,
    Y*Y #= X,
    labeling(Vars).

magic(Vars) :- Vars = [X1, X2, X3, X4, X5, X6, X7, X8, X9],
    Vars :: 1..9,
    alldifferent(Vars),
    X1 + X2 + X3 #= 15,
    X4 + X5 + X6 #= 15,
    X7 + X8 + X9 #= 15,
    X1 + X4 + X7 #= 15,
    X2 + X5 + X8 #= 15,
    X3 + X6 + X9 #= 15,
    X1 + X5 + X9 #= 15,
    X3 + X5 + X7 #= 15,
    labeling(Vars),
    write(X1), write(' '), write(X2), write(' '), write(X3), nl,
    write(X4), write(' '), write(X5), write(' '), write(X6), nl,
    write(X7), write(' '), write(X8), write(' '), write(X9), nl.
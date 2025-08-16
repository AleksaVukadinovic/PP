% X = [1, 2, 3].
% X = [1, 2, [1, 2, 3]].
% X = [1, 2, [1, 2, 3], term].
% [X, Y, Z] = [1, 2, [1, 2, 3]].
% [G|R] = [1, 2, 3, 4, t, t, t, s].
% [G0, G1, G2, G3 | R] = [1, 2, 3, 4, t, t, t, s].

% sadrzi (X, L)
sadrzi(X, [X|_]).
sadrzi(X, [_|R]):- sadrzi(X, R).

sadrzi1(X, [G|R]):- X==G; sadrzi(X, R).

% suma(L, S)
suma([], 0).
suma([G|R], S):- suma(R, S1), S is G + S1.

% duzina(L, S)
duzina([], 0).
duzina([_|R], S):- duzina(R, S1), S is 1 + S1.

% as(L, AS)
as([], 0).
as([G|R], S):- duzina([G|R], D), suma([G|R], Z), S is Z/D.

as2([], 0):- !.
as(L, S):- duzina(L, D), suma(L, Z), S is Z/D.

% ucitaj (N, L) - u L ucitava listu od N elemenata
ucitaj(N, _):- N<0, !.
ucitaj(0, []).
ucitaj(N, [G|R]):- N>0, write('elem: '), read(G), N1 is N-1, ucitaj(N1, R).
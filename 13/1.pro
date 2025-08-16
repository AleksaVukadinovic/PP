% dodajPocetak(E, L, L1) dodaje element E na pocetak liste L i smesta to u listu L1
dodajPocetak(E, L, L1):- L1 = [E|L].

dodajPocetak2(E, L, [E|L]).

% dodajKraj(E, L, L1)
dodajKraj(E, [], [E]).
dodajKraj(E, [G|R], L):- dodajKraj(E, R, L1), L = [G|L1].

% obrisiPrvi(L, L1)
obrisiPrvi([], _):- fail.
obrisiPrvi([_|R], R).

% obrisiPoslednji(L, L1)
obrisiPoslednji([], _):- fail.
obrisiPoslednji([_], []):- !.
obrisiPoslednji([G|R], [G|L1]):- obrisiPoslednji(R, L1).

% maksimum(L, M)
maksimum([], _): - fail.
maksimum([G], G):- !.
maksimum([G|R], M):- maksimum(R, M1), G >= M1, M is G, !.
maksimum([G|R], M):- maksimum(R, M1), G < M1, M is M1.

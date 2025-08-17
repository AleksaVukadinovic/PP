% Napisati program koji rešava sledeću zagonetku. 
% Postoji pet kuća, svaka
% različite boje u kojoj žive ljudi različitih nacionalnosti
% koji piju različita pića, jedu različita jela i
% imaju različite kućne ljubimce. Važi sledeće:
% • Englez živi u crvenoj kući
% • Španac ima psa
% • kafa se pije u zelenoj kući
% • Ukrajinac pije čaj
% • zelena kuća je odmah desno uz belu
% • onaj koji jede špagete ima puža
% • pica se jede u žutoj kući
% • Norvežanin živi u prvoj kuci s leva
% • onaj koji jede piletinu živi pored onoga koji ima lisicu
% • pica se jede u kući koja je pored kuće u kojoj je konj
% • onaj koji jede brokoli pije sok od narandze
% • Japanac jede suši
% • Norvežanin živi pored plave kuće
% Čija je zebra, a ko pije vodu?

clan(X, [X|_]).
clan(X, [_|R]) :- clan(X, R).

desno(X, Y, [Y,X|_]).
desno(X, Y, [_|R]) :- desno(X, Y, R).

pored(X, Y, [X,Y|_]).
pored(X, Y, [Y,X|_]).
pored(X, Y, [_|R]):-pored(X, Y, R).


% k(boja, nacionalnost, jelo, pice, ljubimac)

kuce(L):- 
    L = [
      k(_, norvezanin, _, _, _),
      k(plava, _, _, _,_),
      k(_, _, _, mleko, _),
      k(_, _, _, _, _),
      k(_, _, _, _, _)
    ],
    clan(k(crvena, englez, _, _, _), L),
    clan(k(_, spanac, _, _, pas), L),
    clan(k(zelena, _, _, kafa, _), L),
    clan(k(_, ukrajinac, _, caj, _), L),
    desno(k(zelena, _, _, kafa, _), k(bela, _, _, _, _), L),
    clan(k(_, _, spagete, _, puz), L),
    clan(k(zuta, _, pizza, _, _), L),
    pored(k(_, _, piletina, _, _), k(_,_,_,_,lisica), L),
    pored(k(_, _, pizza, _, _), k(_,_,_,_,konj), L),
    clan(k(_, _, brokoli, sok, _), L),
    clan(k(_, japanac, sushi, _, _), L),
    clan(k(_, _, _, _, zebra), L),
    clan(k(_, _, _, voda, _), L).

zagonetka(X, Y) :- kuce(L), clan(k(_, X, _, _, zebra), L), clan(k(_, Y, _, voda, _), L).
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

% k(boja, nacionalnost, jelo, pice, ljubimac)

% Da li je element E u listi L
clan(E, [E|_]).
clan(E, [_|R]):- clan(E, R).



kuce(L):- 
    L = [
      k(_,norvezanin,_,_,_),
      k(plava,_,_,_,_),
      k(_,_,_,mleko,_),
      k(_,_,_,_,_),
      k(_,_,_,_,_),
    ],
    clan(k(crvena, englez,_,_,_), L),
    clan(k(_, spanac,_,_,pas), L),
    clan(k(zelena, _,_,kafa,_), L),
    clan(k(_, ukrajinac,_,caj,_), L).


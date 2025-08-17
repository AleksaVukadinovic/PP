clan(X,[X|_]).
clan(X,[_|R]) :- clan(X,R).


rodjendan(L) :-
    L = [
        g(_, ivanovic, narukvica),
        g(marija, markovic, P2),
        g(milan, _, knjiga),
        g(I4, jankovic, P4)
    ],

    \+ clan(g(stefan, _, cvece), L),
    \+ clan(g(_, aleksic, cvece), L),
    P4 = torta, I4 \= jana,
    permutation([narukvica, knjiga, torta, cvece],
                [narukvica, P2, knjiga, P4]).

% pitanje 2:
odgovori(X,Y) :-
    rodjendan(L),
    clan(g(X, _, cvece), L),           % X je ime osobe sa cvećem
    clan(g(_, markovic, Y), L).        % Y je poklon koji donosi Marković

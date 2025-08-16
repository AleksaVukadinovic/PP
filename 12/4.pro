/*
Godina je prestupna ako:
  - deljiva je sa 400
  - deljiva je sa 4 i nije deljiva sa 100
*/

prestupna(X):- X mod 400 =:= 0.
prestupna(X):- X mod 4 =:= 0, X mod 100 =\= 0.

brdana(januar, _, 31).
brdana(februar, X, 28):- not(prestupna(X)), !.
brdana(februar, X, 29):- prestupna(X). % moze i bez prestupna(x)
brdana(mart, _, 31).
brdana(april, _, 30).
brdana(maj, _, 31).
brdana(jun, _, 31).
brdana(jul, _, 31).
brdana(avgust, _, 31).
brdana(septembar, _, 30).
brdana(oktobar, _, 31).
brdana(novembar, _, 30).
brdana(decembar, _, 31).

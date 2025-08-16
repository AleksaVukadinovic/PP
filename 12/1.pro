% jednolinijski komentar

/*
Vise
linijski
komentar
*/


% cinjenice
zivotinja(slon).
zivotinja(vuk).
zivotinja(zec).
zivotinja(zebra).
zivotinja(mrav).

veci(slon, vuk).
veci(vuk, zec).
veci(zec, mrav).

% pravila
je_veci(X, Y):- veci(X, Y).
je_veci(X, Y):- veci(X, Z), je_veci(Z, Y).


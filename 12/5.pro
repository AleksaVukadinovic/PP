musko(mihajilo).
musko(stevan).
musko(petar).
musko(mladen).
musko(rajko).

zensko(milena).
zensko(milica).
zensko(jelena).
zensko(senka).
zensko(mina).
zensko(maja).

roditelj(mihajilo, milica).
roditelj(mihajilo, senka).
roditelj(milena, rajko).
roditelj(maja, petar).
roditelj(maja, mina).
roditelj(stevan, mladen).
roditelj(stevan, jelena).
roditelj(milica, mladen).
roditelj(milica, jelena).

% X je majka od Y
majka(X, Y):- zensko(X), roditelj(X, Y).

% X je brat od Y
brat(X, Y):- musko(X), roditelj(Z, X), roditelj(Z, Y).

% X je predak od Y
predak(X, Y):- roditelj(X, Y).
predak(X, Y):- roditelj(X, Z), predak(Z, Y).
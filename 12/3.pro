abs(X, Y):- X>=0, Y is X.
abs(X, Y):- X<0, Y is -X.

abs1(X, X):- X>=0.
abs1(X, Y):- X<0, Y is -X.

abs2(X, X):- X>=0.
abs2(X, Y):- Y is -X.

% cutoff - ako dodje do matcha ne ulazi u drugu granu
abs3(X, X):- X>=0, !.
abs3(X, Y):- Y is -X.

abs4(X, X):- X>=0, !.
abs4(X, -X).
% USING SUCCESSOR ARITHMETICS

plus(X, 0, X).
plus(X, s(Y), s(Z)):- plus(X, Y, Z).

minus(X, 0, X).
minus(X, s(Y), Z):- minus(X, Y, s(Z)). 

multiply1(_, 0, 0).	
multiply1(X, s(Y), M):- multiply1(X, Y, Z), plus(X, Z, M).

divide1(X, Y, Q, R):- multiply1(Y, Q, M), plus(M, R, X), less_than(R, Y).

less_than(0, 0):- !, fail.
less_than(0, _).
less_than(s(X), s(Y)):- less_than(X, Y).

square_root(A, X):- multiply1(X, X, A).

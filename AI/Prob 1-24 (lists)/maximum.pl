% 17: Maximum of 2 numbers

maximum(X, Y, X):- X >= Y.
maximum(X, Y, Y):- Y > X.

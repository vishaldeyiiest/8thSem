% 16: GCD of 2 numbers

gcd(X, X, X).
gcd(X, Y, Z):- X > Y, X1 is X-Y, gcd(X1, Y, Z).
gcd(X, Y, Z):- X < Y, gcd(Y, X, Z).

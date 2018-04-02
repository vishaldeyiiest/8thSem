% Prime Factors
/*
is_prime(N):- 
	N1 is N-1, 
	is_prime(N1), 
	no_divisor(N, N1).

no_divisor(_, 1).
no_divisor(N, D):- R is N mod D, R =\= 0, DN = D-1, no_divisor(N, DN).

factors([], 1).
factors([H|Rest], N):- Q*H is N, is_prime(H). */

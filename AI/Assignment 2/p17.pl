% ACKERMAN NO.

ackerman(0, N, N1):- N1 is N+1, !.
ackerman(M, 0, A):- M1 is M-1, ackerman(M1, 1, A), !.
ackerman(M, N, A):- N1 is N-1, ackerman(M, N1, X), M1 is M-1, ackerman(M1, X, A).  

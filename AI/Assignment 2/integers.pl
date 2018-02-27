% recursive programs to add, subtract, multiply and divide

add(A, 0, A):- !.
add(A, B, S):- B > 0, !, B1 is B-1, add(A, B1, S1), S is S1+1.
add(A, B, S):- B1 is B+1, add(A, B1, S1), S is S1-1.

subtract(A, 0, A):- !.
subtract(A, B, Diff):- B > 0, !, B1 is B-1, subtract(A, B1, D), Diff is D-1.
subtract(A, B, Diff):- B1 is B+1, subtract(A, B1, D), Diff is D+1.

multiply(_, 0, 0):- !.
multiply(A, B, M):- B > 0, !, B1 is B-1, multiply(A, B1, M1), add(A, M1, M).
multiply(A, B, M):- B1 is B+1, multiply(A, B1, M1), subtract(M1, A, M).

divide(0, A, 0, 0):- A =\= 0, !.
divide(_, 0, 0, 0):- write('Division by 0 not permitted'), !.
divide(A, B, Q, M):- A < 0, A1 is -A, !, divide(A1, B, Q1, M), Q is -Q1.
divide(A, B, Q, M):- B < 0, B1 is -B, !, divide(A, B1, Q1, M), Q is -Q1.
divide(A, B, Q, M):- A < 0, B < 0, A1 is -A, B1 is -B, !, divide(A1, B1, Q, M).
divide(A, B, 0, A):- A < B, !.
divide(A, B, Q, M):- A1 is A-B, divide(A1, B, Q1, M), Q is Q1+1.

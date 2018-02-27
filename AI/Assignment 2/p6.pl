% calculate factorial

factorial(0, 1).
factorial(N, X):- N > 0, N1 is N-1, factorial(N1, X1), X is N*X1.

factorial1(N, X):- fact_acc(N, 1, X).

fact_acc(0, F, F).
fact_acc(N, A, F):- N > 0, A1 is A*N, N1 is N-1, fact_acc(N1, A1, F).

% reverse a list

reverse_list([], []).
reverse_list([H|T], RevL):- reverse_list(T, Rev), append(Rev, [H], RevL).  

reverse1(L, L1):- reverse_acc(L, [], L1).

reverse_acc([], L, L).
reverse_acc([H|T], A, L):- reverse_acc(T, [H|A], L).

% remove duplicate

rem_duplicate([], []).
rem_duplicate([H|T], L1):- member(H, T), !, rem_duplicate(T, L1).
rem_duplicate([H|T], [H|L1]):- rem_duplicate(T, L1). 

rem_duplicate1(L, L1):- duplicate_acc(L, [], L1).

duplicate_acc([], A, A).
duplicate_acc([H|T], A, L1):- member(H, A), !, duplicate_acc(T, A, L1).
duplicate_acc([H|T], A, L1):- duplicate_acc(T, [H|A], L1).

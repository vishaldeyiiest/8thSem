% Prog 41: Find the next higher permutation of a list

next_higher_permutation(L, L1):- higher_permutation(L, L1), not(far_higher(L1, L)).

higher_permutation(L, L1):- permutation(L, L1), higher(L1, L).

higher([H1|T1], [H|T]):- H1 > H, !.
higher([H|T1], [H|T]):- higher(T1, T).

far_higher(L1, L):- higher_permutation(L, L2), higher(L1, L2).

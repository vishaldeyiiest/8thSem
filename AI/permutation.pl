% 37: Permutation of list

permutation([], []).
permutation(L, [H|R]):- select(H, L, T), permutation(T, R).

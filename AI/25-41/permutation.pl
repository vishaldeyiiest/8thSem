% 37: Permutation of list

permutation([], []).
permutation(L, [H|R]):- select_list(H, L, T), permutation(T, R).

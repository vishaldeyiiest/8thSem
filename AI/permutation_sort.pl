% 38: Permuatation Sort

permutation_sort([], []).
permutation_sort(L, L1):- permutation(L, L1), ordered(L1), !.

ordered([]).
ordered([X]).
ordered([X|[Y|Rest]]):- X =< Y, ordered([Y|Rest]).

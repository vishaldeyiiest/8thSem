% 35: Merge Sort

mergesort([], []).
mergesort([X], [X]):- !.
mergesort(U, SortedL):- divide(U, L1, L2), mergesort(L1, S1), mergesort(L2, S2), merge(S1, S2, SortedL).

divide([], [], []).
divide([X], [X], []).
divide([X|[Y|Rest]], [X|L1], [Y|L2]):- divide(Rest, L1, L2).

merge([], [], []).
merge(X, [], X).
merge([], X, X).
merge([X|Rest1], [Y|Rest2], [X|Rest3]):- X < Y, merge(Rest1, [Y|Rest2], Rest3).
merge([X|Rest1], [Y|Rest2], [Y|Rest3]):- X > Y, merge([X|Rest1], Rest2, Rest3).
merge([X|Rest1], [Y|Rest2], [X|[Y|Rest3]]):- X = Y, merge(Rest1, Rest2, Rest3).

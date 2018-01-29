% 39: Selection Sort

selection_sort([], []).
selection_sort(L, [H|T]):- least(H, L, R), selection_sort(R, T).

least(H, L, R):- select(H, L, R), smaller(H, R).

smaller(_, []).
smaller(X, [H|T]):- H >= X, smaller(X, T).

% 24: Determine whether first list is a sublist of List

subList([], _).
subList([X|A], [X|B]):- prefix(A, B), !.
subList([X|A], [Y|B]):- subList([X|A], B).

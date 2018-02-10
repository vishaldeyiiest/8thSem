% 24: Determine whether first list is a sublist of List

subList([], _).
subList([X|A], [X|B]):- my_prefix(A, B), !.
subList([X|A], [Y|B]):- subList([X|A], B).

my_prefix([], _).
my_prefix([X|L], [X|M]):- my_prefix(L, M).

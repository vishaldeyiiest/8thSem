% 20: add an element in list of not already present

our_add(A, [], [A]).
our_add(A, L, L):- our_member(A, L), !.		% Red cut
our_add(A, L, [A|L]).

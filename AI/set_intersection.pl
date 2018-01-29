%  26: Set intersection

set_intersection([], L, []).
set_intersection([X|L1], L2, [X|L3]):- our_member1(X, L2), !, set_intersection(L1, L2, L3).
set_intersection([X|L1], L2, L3):- set_intersection(L1, L2, L3).

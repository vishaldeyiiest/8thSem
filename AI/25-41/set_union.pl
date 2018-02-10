% 27: Set Union

set_union([], L, L).
set_union([X|L1], L2, L3):- our_member1(X, L2), !, union(L1, L2, L3).
set_union([X|L1], L2, [X|L3]):- union(L1, L2, L3).

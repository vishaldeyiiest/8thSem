% 28: Set Difference (A, B, C):- C = A - B

set_diff([], L, []).
set_diff([X|L1], L2, L3):- our_member1(X, L2), !, set_diff(L1, L2, L3).
set_diff([X|L1], L2, [X|L3]):- set_diff(L1, L2, L3).

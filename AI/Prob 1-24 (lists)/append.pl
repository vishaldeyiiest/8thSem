% Prog 8: To append two list into third list

append1([], X, X).
append1([X|L1], L2, [X|L3]):- append1(L1, L2, L3).

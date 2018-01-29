% 29: Symmetric set diff

symm_diff(L1, L2, L3):- set_union(L1, L2, X), set_intersection(L1, L2, Y), set_diff(X, Y, L3).

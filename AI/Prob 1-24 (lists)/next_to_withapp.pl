% Prog 12: Check if two elements are next to each other using append

next_to_withapp(X, Y, L):- append(L1, [X|[Y|Rest]], L).

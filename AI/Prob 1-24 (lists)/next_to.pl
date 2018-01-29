% Prog 11: Check if two elements are next to each other

next_to(X, Y, L).
next_to(X, Y, [X|[Y|Rest]]).
next_to(X, Y, [Z|Rest]):- next_to(X, Y, Rest).


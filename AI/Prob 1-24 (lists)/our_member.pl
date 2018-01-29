% Prog 7: Determine whether an element is a member of list

our_member(X, [X|Rest]).
our_member(X, [Y|Rest]):- our_member(X, Rest).

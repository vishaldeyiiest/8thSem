% 25: Set membership

our_member1(X, [X|_]):- !.
our_member1(X, [_|Rest]):- our_member1(X, Rest).

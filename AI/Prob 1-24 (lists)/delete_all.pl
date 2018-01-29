% 22: delete all occurences of an element from list

delete_all(_, [], []).
delete_all(X, [X|Rest], S):- !, delete_all(X, Rest, S).
delete_all(X, [Y|Rest], [Y|S]):- delete_all(X, Rest, S).

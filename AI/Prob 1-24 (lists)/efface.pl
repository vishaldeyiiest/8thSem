% 21: delete first occurrence of a specific element from a list

efface(_, [], []).
efface(A, [A|L], L):- !.
efface(X, [Y|Rest], [Y|L]):- efface(X, Rest, L).

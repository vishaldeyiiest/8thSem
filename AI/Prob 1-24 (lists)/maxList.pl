% 18: find the largest element from a list

maxList([X], X).
maxList([X|Rest], Y):- maxList(Rest, Z), maximum(X, Z, Y).

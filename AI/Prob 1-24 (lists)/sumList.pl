% 15: Sum of all elements in list

sumList([], 0).
sumList([X|Rest], N):- sumList(Rest, N1), N is N1+X.

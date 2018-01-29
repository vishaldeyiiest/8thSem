% Prog 6: Determine last element of a list 

last([X], X).
last([X|Rest], N):- last(Rest, N).

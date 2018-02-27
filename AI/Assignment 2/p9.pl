% 

sum([H], H):- !.
sum([H|T], S):- sum(T, S1), S is S1+H. 

mean(L, X):- length1(L, N), sum(L, S), X is S/N.

length1([], 0).
length1([_|T], N):- length1(T, N1), N is N1+1.	

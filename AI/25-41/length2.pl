% 30: Length of a list without using accumulator

length2([], 0).
length2([H|T], N):- length2(T, N1), N is N1+1.

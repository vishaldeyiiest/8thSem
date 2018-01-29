% 31: Length of a list using accumulator

length3(L, N):- lengthacc(L, 0, N).

lengthacc([], N, N).
lengthacc([H|T], A, N):- A1 is A+1, lengthacc(T, A1, N).


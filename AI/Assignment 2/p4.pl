% Cutlast

cutlast([_], []):- !.
cutlast([X|Rest], [X|R1]):- cutlast(Rest, R1).

% Trim 

trim(0, L, L):- !.
trim(_, [], _):- write('N is larger than length'), !.
trim(N, [_|L], L1):- N1 is N-1, trim(N1, L, L1). 

% another method for trim

trim_1(N, L, L):- length(L, N1), N1 < N, write('N is larger than length'), !. 
trim_1(N, L, L1):- length(Head, N), append(Head, L1, L).

% Trim last

trim_last(N, L, L):- length(L, N1), N1 < N, write('N is larger than length'), !. 
trim_last(N, L, L1):- length(Tail, N), append(L1, Tail, L).

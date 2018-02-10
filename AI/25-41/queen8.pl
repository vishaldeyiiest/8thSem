template([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).

solution([]).
solution([X/Y|Others]):- our_member(Y, [1, 2, 3, 4, 5, 6, 7, 8]),
			solution(Others),
			no_attack(X/Y, Others).

no_attack(_, []).
no_attack(X/Y, [X1/Y1|Others]):- Y=\=Y1, (X-X1)=\=(Y-Y1), (X-X1)=\=(Y1-Y), no_attack(X/Y, Others). 

our_member(X, [X|Rest]).
our_member(X, [Y|Rest]):- our_member(X, Rest).

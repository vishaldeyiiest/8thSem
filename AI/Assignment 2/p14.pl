% TOWER OF HANOI

tower_hanoi(1, X, Y, _):- write('Move top disk from '), 
			write(X), write(' to '), 
			write(Y), nl.

tower_hanoi(N, X, Y, Z):- N > 1, M is N-1, 
			tower_hanoi(M, X, Z, Y), 
			tower_hanoi(1, X, Y, _), 
			tower_hanoi(M, Z, Y, X). 

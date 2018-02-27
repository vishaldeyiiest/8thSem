% DELETE MIDDLE ELEMENT

/*
delete_mid(L, L1):- append(Left, [_|Right], L), 
		same_length(Left, Right), 
		length(L, N), N1 is N-1, N2 is N1/2, 
		length(Left, N2), 
		append(Left, Right, L1).
*/

delete_mid(L, L1):- length(L, N), N1 is N-1, N2 is N1/2, remove_ith(L, N2, L1).
remove_ith([], _, []).
remove_ith([_|T], 0, T):- !.
remove_ith([H|T], N, [H|L]):- N1 is N-1, remove_ith(T, N1, L).


% DELETE two elements
/*
delete_two([_, _], []):- !.
delete_two(L, L1):- append(Left, [_, _|Right], L), 
			same_length(Left, Right), 
			length(L, N), N1 is N/2, N2 is N1-1, 
			length(Left, N2),			
			append(Left, Right, L1).
*/

delete_two(L, L1):- length(L, N), N1 is N/2, N2 is N1-1, remove_two(L, N2, L1).

remove_two([], _, []).
remove_two([_,_|T], 0, T):- !.
remove_two([H|T], N, [H|L]):- N1 is N-1, remove_two(T, N1, L).

% Reverse part ways

reverse_part(L, R):-  append(Left, [X|Right], L), 
			same_length(Left, Right),
			reverse(Left, Lr), reverse(Right, Rr), 
			append(Lr, [X|Rr], R).

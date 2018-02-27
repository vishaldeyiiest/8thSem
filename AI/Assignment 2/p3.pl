% replace first occurence of X with Y

replace_first([], _, _, _).
replace_first([X|Rest], X, Y, [Y|Rest]):- !.
replace_first([H|Rest], X, Y, [H|R1]):- replace_first(Rest, X, Y, R1).


% delete nth element in L, keeping rest in L1.

delete_nth([], 0, _).
delete_nth([], _, []):- write('Length of list is smaller than N'), !.
delete_nth([_|Rest], 0, Rest):- !.
delete_nth([X|Rest], N, [X|R1]):- N1 is N-1, delete_nth(Rest, N1, R1).

% replace nth element in L

replace_nth([], 0, _, _).
replace_nth([], _, _, []):-  write('Length of list is smaller than N'), !.
replace_nth([_|Rest], 0, X, [X|Rest]):- !.
replace_nth([H|Rest], N, X, [H|R1]):- N1 is N-1, replace_nth(Rest, N1, X, R1).


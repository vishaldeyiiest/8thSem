% Finding Path

path([X], [X]):- !.
path(L, [arc(X, Y), arc(Y, Z)| Rest]):- 
	member(arc(X, Y), L), 
	select(arc(X, Y), L, R), 
	member(arc(Y, Z), R),
	path(R, [arc(Y, Z)|Rest]).

% Check cycle

cycle(L, L1):- path(L, L1), L1 = [arc(X, _)|Rest], last_element(Rest, arc(_, X)).

last_element([X], X).
last_element([_|T], X):- last_element(T, X). 

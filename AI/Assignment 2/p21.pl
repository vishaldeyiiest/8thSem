
pre_from_in_post([], [], []).
pre_from_in_post(In, Post, Pre):-
	last_element(Post, X, P),
	divide_subtree_in(X, In, L1, L2),
	length(L1, N),
	divide_subtrees(N, P, L3, L4),
	pre_from_in_post(L1, L3, Left),
	pre_from_in_post(L2, L4, Right),
	append([X|Left], Right, Pre).


last_element([X], X, []).
last_element([H|Rest], X, [H|T]):- last_element(Rest, X, T).

divide_subtree_in(X, [X|L], [], L).
divide_subtree_in(X, [H|L], [H|L1], L2):- divide_subtree_in(X, L, L1, L2).

divide_subtrees(0, L, [], L).
divide_subtrees(N, [H|T1], [H|T2], L):- N1 is N-1, divide_subtrees(N1, T1, T2, L).

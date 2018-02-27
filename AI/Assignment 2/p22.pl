% insert element in BST

insert_BST(X, nil, bst(nil, X, nil)):- !.
insert_BST(X, bst(Left, Root, Right), bst(Left1, Root, Right)):- X =< Root, !, insert_BST(X, Left, Left1).
insert_BST(X, bst(Left, Root, Right), bst(Left, Root, Right1)):- insert_BST(X, Right, Right1).

% Find minimum element

minimum(bst(nil, X, _), X):- !.
minimum(bst(Left, _, _), X):- minimum(Left, X).

% Delete leaf node

delete_leaf(Tree, X, NewTree):- insert_BST(X, NewTree, Tree).

% Linearize

linearize(nil, []).
linearize(bst(Left, Root, Right), L):- linearize(Left, L1), linearize(Right, R1), append(L1, [Root|R1], L).

% SORT

tree_sort(L, L1):- sort_acc(L, nil, T), linearize(T, L1).

sort_acc([], T, T).
sort_acc([H|R], T1, T2):- insert_BST(H, T1, T3), sort_acc(R, T3, T2).

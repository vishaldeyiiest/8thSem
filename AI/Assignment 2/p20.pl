% POSTORDER from INORDER and PREORDER

postorder_from_in_pre([], [], []).
postorder_from_in_pre(In, [X|P], Post):- 
	divide_subtree_in(X, In, L1, L2),
	length(L1, N),
	divide_subtrees(N, P, L3, L4),
	postorder_from_in_pre(L1, L3, Left),
	postorder_from_in_pre(L2, L4, Right),
	append(Left, Right, Post1),
	append(Post1, [X], Post). 			


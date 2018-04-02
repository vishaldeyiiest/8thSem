% 4.01

istree(nil).
istree(t(Left, _, Right)):- istree(Left), istree(Right).

% 4.02

cbal_tree(0, nil):- !.
cbal_tree(N, t(Left, x, Right)):- 
	N > 0, N0 is N-1,
	N2 is N0//2, N1 is N0-N2,
	distr(N1, N2, NL, NR),
	cbal_tree(NL, Left), 
	cbal_tree(NR, Right).

distr(N, N, N, N):- !.
distr(N1, N2, N1, N2).
distr(N1, N2, N2, N1).

% 4.03

mirror(nil, nil).
mirror(t(L1, _, R1), t(L2, _, R2)):- mirror(L1, L2), mirror(R1, R2).

symmetric(nil).
symmetric(t(Left, _, Right)):- mirror(Left, Right).

% 4.04 - construct binary search trees from list

insert_bst(X, nil, bst(nil, X, nil)).
insert_bst(X, bst(Left, Root, Right), bst(Left1, Root, Right)):- 
	X =< Root, !,
	insert_bst(X, Left, Left1).
insert_bst(X, bst(Left, Root, Right), bst(Left, Root, Right1)):- insert_bst(X, Right, Right1).

construct_bst([X], T):- insert_bst(X, nil, T).
construct_bst([H|L], Tree):- construct_bst(L, T), insert_bst(H, T, Tree). 

delete_leaf(Tree, X, NT):- insert_bst(X, NT, Tree).

delete_node(bst(L, H, R), X, bst(LM, H, R)):- X < H, !, delete_node(L, X, LM).
delete_node(bst(L, H, R), X, bst(L, H, RM)):- delete_node(R, X, RM). 


delete_node(bst(nil, X, nil), X, nil):- !.
delete_node(bst(L, X, nil), X, L):- !.
delete_node(bst(nil, X, R), X, R):- !.
delete_node(bst(L, X, R), X, bst(L, M, Aux)):- remove_min(R, M, Aux).

remove_min(bst(nil, X, R), X, R):- !.
remove_min(bst(L, X, R), M, bst(Aux, X, R)):- remove_min(L, M, Aux).
/*
linearize([], nil).
linearize(L1, bst(Left, Root, Right)):- 
	linearize(L, Left), 
	linearize(R, Right),
	append(L, [Root|R], L1).
*/

sym_cbal_tree(N, Tree):- cbal_tree(N, Tree), symmetric(Tree).
sym_cbal_trees(N,Ts) :- setof(T,sym_cbal_tree(N,T),Ts).

investigate(A,B) :-
	between(A,B,N),
	sym_cbal_trees(N,Ts), length(Ts,L),
	writef('%w   %w',[N,L]), nl,
    fail.
investigate(_,_).	

hbal_tree(0, nil):- !.
hbal_tree(1, bt(nil, x, nil)):- !.
hbal_tree(N, bt(Left, x, Right)):- 
	N > 1, N1 is N-1, N2 is N-2,
	distr(N1, N2, NL, NR),
	hbal_tree(NL, Left),
	hbal_tree(NR, Right).

% 4.07

minNodes(1, 1):- !.
minNodes(2, 2):- !.
minNodes(H, N):- H > 2,
	H1 is H-1, H2 is H-2, 
	minNodes(H1, N1), minNodes(H2, N2),
	N is N1+N2+1.

minHeight(1, 1):- !.
minHeight(N, H):- N1 is N//2, maxHeight(N1, H1), H is H1+1.

maxNodes(H, N):- N1 is 2**H, N is N1-1.

maxHeight(N, H):- maxH(N, H, 1, 1).

maxH(N, H, H1, N1):- N1 > N, !, H is H1-1.
maxH(N, H, H1, _):- H2 is H1+1, minNodes(H2, N2), maxH(N, H, H2, N2).

hbal_tree_nodes(N, Tree):- 
	minHeight(N, H1), maxHeight(N, H2),
	between(H1, H2, H),	
	hbal_tree(H, Tree).
		
count_leaves(nil, 0):- !.
count_leaves(bt(nil, _, nil), 1):- !.
count_leaves(bt(L, _, R), N):- count_leaves(L, NL), count_leaves(R, NR), N is NL + NR.

leaves(nil, []):- !.
leaves(bt(nil, X, nil), [X]):- !.
leaves(bt(L, _, R), T):- leaves(L, NL), leaves(R, NR), append(NL, NR, T).

internals(nil, []):- !.
internals(bt(nil, _, nil), []):- !.
internals(bt(L, X, R), [X|T]):- internals(L, NL), internals(R, NR), append(NL, NR, T).

atlevel(nil, _, []):- !.
atlevel(bt(_, X, _), 0, [X]):- !.
atlevel(bt(Left, _, Right), L, S):- 
	L1 is L-1, 
	atlevel(Left, L1, LT), atlevel(Right, L1, RT),
	append(LT, RT, S).

level_order(T, S):- height(T, H), level_traverse(T, H-1, S).

level_traverse(bt(_, X, _), 0, [X]):- !.
level_traverse(T, L, S):- 
	L > 0,
	L1 is L-1,
	atlevel(T, L, List),	
	level_traverse(T, L1, Tail),
	append(Tail, List, S).


height(nil, 0):- !.
height(bt(Left, _, Right), N):- 
	height(Left, LH), 
	height(Right, RH), 
	LH >= RH, !, 
	N is LH+1;
	N is RH + 1. 
/*
tostring(nil, ' ').
tostring(bt(L, X, nil), X(T)):- tostring(L, T).
tostring(bt(nil, X, R), X(T)):- tostring(R, T).
tostring(bt(Left, Root, Right), Root(T)):-  tostring(Left, L), tostring(Right, R), T = L, R.
*/


inorder(nil, []):- !.
inorder(bt(L, X, R), A):- inorder(L, Lt), inorder(R, Rt), append(Lt, [X|Rt], A).

preorder(nil, []):- !.
preorder(bt(L, X, R), [X|A]):- preorder(L, Lt), preorder(R, Rt), append(Lt, Rt, A).

postorder(nil, []):- !.
postorder(bt(L, X, R), A):- postorder(L, Lt), postorder(R, Rt), append(Lt, Rt, A1), append(A1, [X], A).

pre_from_in_post([], [], []):- !.
pre_from_in_post(In, Post, Pre):- 
	last_element(Post, H, P),
	divide_in(In, H, L1, L2),
	length(L1, N),
	divide(P, N, LP, RP),
	pre_from_in_post(L1, LP, Left),
	pre_from_in_post(L2, RP, Right),
	append([H|Left], Right, Pre).

last_element([X], X, []):- !.
last_element([H|Rest], X, [H|T]):- last_element(Rest, X, T).

divide_in([H|L], H, [], L):- !.
divide_in([X|In], H, [X|L1], L2):- divide_in(In, H, L1, L2).

divide(P, 0, _, P):- !.
divide([X|Post], N, [X|L], R):- N1 is N-1, divide(Post, N1, L, R).
 

post_from_in_pre([], [], []):- !.
post_from_in_pre(In, [H|Rest], Post):-
	divide_in(In, H, L1, L2),
	length(L1, N),
	divide(Rest, N, L, R),
	post_from_in_pre(L1, L, LT),
	post_from_in_pre(L2, R, RT),
	append(LT, RT, T),
	append(T, [H], Post).

pre_from_in_post_tree([], [], nil):- !.
pre_from_in_post_tree(In, Post, bst(Left, H, Right)):- 
	last_element(Post, H, P),
	divide_in(In, H, L1, L2),
	length(L1, N),
	divide(P, N, LP, RP),
	pre_from_in_post_tree(L1, LP, Left),
	pre_from_in_post_tree(L2, RP, Right).


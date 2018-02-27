% PRE-ORDER
% e.g  preorder(bt(bt(bt(nil, 3, nil), 2, bt(bt(nil, 4, nil), 6, bt(nil, 8, nil))), 1, bt(bt(nil, 7, nil), 5, bt(nil, 9, nil))), L).

preorder(nil, []).
preorder(bt(Left, Root, Right), T):- preorder(Left, L), preorder(Right, R), append([Root|L], R, T).

% IN-ORDER

inorder(nil, []).
inorder(bt(Left, Root, Right), T):- inorder(Left, L), inorder(Right, R), append(L, [Root|R], T).

% POST-ORDER

postorder(nil, []).
postorder(bt(Left, Root, Right), T):- postorder(Left, L), postorder(Right, R), 
					append(R, [Root], RT), append(L, RT, T).

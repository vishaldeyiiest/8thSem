% PRE-ORDER

preorder1(nil, []).
preorder1(bt(Left, Root, Right), L):- preorder1(Left, L1), preorder1(Right, R1), append([Root|L1], R1, L).	

% IN-ORDER

inorder(nil, []).
inorder(bt(Left, Root, Right), L):- inorder(Left, L1), inorder(Right, R1), append(L1, [Root|R1], L).

% POST-ORDER

postorder(nil, []).
postorder(bt(Left, Root, [X|L]):- postorder(Left, L1), postorder(Right, R1), append(L1, R1, L).

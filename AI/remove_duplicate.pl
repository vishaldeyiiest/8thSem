% 32: remove duplicate from a list

remove_duplicate(L, L1):- duplicate_acc(L, [], L1).

duplicate_acc([], A, A).
duplicate_acc([H|T], A, L1):- our_member1(H, A), !, duplicate_acc(T, A, L1).
duplicate_acc([H|T], A, L1):- duplicate_acc(T, [H|A], L1).

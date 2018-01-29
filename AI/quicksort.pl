% 33: Quick Sort

quicksort(L, L1):- quick_acc(L, [], L1).

quick_acc([], A, A).
quick_acc([H|T], A, L1):- partition(T, Lt, H, Gt), quick_acc(Gt, A, Gtsr), quick_acc(Lt, [H|Gtsr], L1).

partition([], [], _, []).
partition([X|T], [X|Tlt], H, TGt):- X =< H, !, partition(T, Tlt, H, TGt).
partition([X|T], Tlt, H, [X|TGt]):- partition(T, Tlt, H, TGt). 

% BUBBLE SORT

bubblesort(L, S):- bubble_acc(L, [], S).

bubble_acc([], A, A).
bubble_acc([H|T], A, S):- bubble(H, T, L, M), bubble_acc(L, [M|A], S).

bubble(X, [], [], X).
bubble(X, [H|T], [H|T1], M):- X > H, !, bubble(X, T, T1, M).
bubble(X, [H|T], [X|T1], M):- bubble(H, T, T1, M).

% HEAP SORT- to be done

heap_sort(L, LSr):-
	buildheap(L, H),
	write(H),nl,
	heapsortacc(H, [], LSr).

buildheap([], nil).
buildheap([X | Rest], H):-
	split(Rest, L, R),
	buildheap(L, LHeap),
	buildheap(R, RHeap),
	heapify(heap(LHeap, X, RHeap), H).

split([], [], []).
split([X], [X], []). 
split([X|[Y|Rest]], [X|L], [Y|R]):-
	split(Rest, L,R).


heapsortacc(heap(_,nil,_), L, L).
heapsortacc(heap(LHeap, Val, RHeap), L, LSr):-
	 heapify(heap(LHeap, nil, RHeap), H),
	 heapsortacc(H, [Val | L], LSr).
	 
	 
gt(nil,nil):- !, false.
gt(_, nil):- !.
gt(X,Y):- X > Y, !;
		!, false.

% left and right are still max heaps, val is out of order
heapify(heap(nil, Val, heap(RL, RVal, RR)), heap(nil, RVal, RHeap)):-
	gt(RVal, Val), !,
	heapify(heap(RL, Val, RR), RHeap).

heapify(heap(heap(LL, LVal, LR), Val, nil), heap(LHeap, LVal, nil)):-
	gt(LVal, Val), !,
	heapify(heap(LL, Val, LR), LHeap).

heapify(heap(heap(LL, LVal,LR), Val, heap(RL, RVal, RR)), heap(LHeap, LVal, heap(RL, RVal, RR))):-
	gt(LVal, Val),
	gt(LVal, RVal), !,
	heapify(heap(LL, Val, LR), LHeap).
heapify(heap(heap(LL, LVal,LR), Val, heap(RL, RVal, RR)), heap(heap(LL, LVal, LR), RVal, RHeap)):-
	gt(RVal, Val),
	gt(RVal, LVal), !,
	heapify(heap(RL, Val, RR), RHeap).
heapify(H, H).


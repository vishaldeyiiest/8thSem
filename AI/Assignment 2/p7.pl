% BUBBLE SORT

bubblesort(L, S):- bubble_acc(L, [], S).

bubble_acc([], A, A).
bubble_acc([H|T], A, S):- bubble(H, T, L, M), bubble_acc(L, [M|A], S).

bubble(X, [], [], X).
bubble(X, [H|T], [H|T1], M):- X > H, !, bubble(X, T, T1, M).
bubble(X, [H|T], [X|T1], M):- bubble(H, T, T1, M).

% HEAP SORT- to be done

heap_sort(L, LS):- list_toheap(L, H), heap_tolist(H, LS).

list_toheap(L, H):- list_heap_acc(L, nil, H).

list_heap_acc([], H, H).
list_heap_acc([H|Rest], Heap, HR):- insert_heap(H, Heap, Heap1), list_heap_acc(Rest, Heap1, HR).

heap_tolist(nil, []):- !.
heap_tolist(Heap, [H|Rest]):- remove_heap(H, Heap, Heap1), heap_tolist(Heap1, Rest).

insert_heap(X, nil, heap(nil, X, nil)):- !.
insert_heap(X, heap(L, T, R), heap(R, T, L1)):- X > T, !, insert_heap(X, L, L1).
insert_heap(X, heap(L, T, R), heap(R, X, L1)):- insert_heap(T, L, L1).

remove_heap(T, heap(nil, T, R), R):- !.
remove_heap(T, heap(L, T, R), NewHeap):- remove_heap_1(V, R, R1),
  					heapify(heap(R1, V, L), NewHeap).

remove_heap_1(T, heap(nil, T, R), R):- !.
remove_heap_1(V, heap(L, T, R), heap(L1, T, L)):- remove_heap_1(V, R, L1).

% heapify(H1, H2) is true if H1 is derived from H2 : heapify

heapify(heap(heap(LeftLeft, LeftV, LeftRight), T, heap(RightLeft, RightV, RightRight)),
     heap(Left, LeftV, heap(RightLeft, RightV, RightRight))):-	RightV > LeftV, T > LeftV, !,
  								heapify(heap(LeftLeft, T, LeftRight), Left).

heapify(heap(Left, T, heap(RightLeft, RightV, RightRight)), heap(Left, RightV, Right)):- T > RightV, !,
										  heapify(heap(RightLeft, T, RightRight), Right).

heapify(Heap, Heap).

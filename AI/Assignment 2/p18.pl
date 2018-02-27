% Declarative: Find the next higher permutation of a list

next_higher_permutation(L, L1):- higher_permutation(L, L1), not(far_higher(L1, L)).

higher_permutation(L, L1):- permutation(L, L1), higher(L1, L).

higher([H1|_], [H|_]):- H1 > H, !.
higher([H|T1], [H|T]):- higher(T1, T).

far_higher(L1, L):- higher_permutation(L, L2), higher(L1, L2).

% Efficient:- find from right digit Y such that it is smaller than the right neighbour digit and find rightmost X greater than Y. 
% Swap X and Y. Reverse digits to the right of Y.

next_higher_permutation1(L, L1):- 
	find_Y(L, INY), 
	cut_list(L, INY+1, _, Right),
	nth0(INY, L, Y),
	find_X(Right, Y, INX_1),
	INX is INX_1+INY+1, 
	swap(L, INX, INY, Lt), 
	cut_list(Lt, INY+1, LL, LR), 
	sort(LR, L2), append(LL, L2, L1).

find_Y([X, Y], 0):- X < Y, !.
find_Y([X|Rest], N):- find_Y(Rest, NY), !, N is NY+1.
find_Y([X, Y|Rest], 0):- X < Y.

find_X([X], Y, 0):- X > Y, !.
find_X([X|Rest], Y, INX):- 
	X > Y, !,
	find_X(Rest, Y, Ind), 
	nth0(Ind, Rest, X1),
	X1 < X,
	INX is Ind + 1.
	
find_X([X|Rest], Y, INX):- find_X(Rest, Y, INX1), INX is INX1+1.
  

swap(As,I,J,Cs) :-
	same_length(As, Cs),
	append(BeforeI, [AtI|PastI],As),
	append(BeforeI, [AtJ|PastI],Bs),
	append(BeforeJ, [AtJ|PastJ],Bs),
	append(BeforeJ, [AtI|PastJ],Cs),
	length(BeforeI, I),
	length(BeforeJ, J).

cut_list(L, 0, [], L):- !.
cut_list([X|L], N, [X|Left], Right):- N1 is N-1, cut_list(L, N1, Left, Right).

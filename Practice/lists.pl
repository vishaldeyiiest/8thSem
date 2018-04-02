% last element

myast_element([X], X):- !.
mylast_element([_|Rest], X):- mylast_element(Rest, X).

% last but one element
%
last_butone([X, _], X):- !.
last_butone([_|Rest], X):- last_butone(Rest, X).

% kth element in list

mykth_element([X|_], 0, X):- !.
mykth_element([_|Rest], K, X):- K1 is K-1, kth_element(Rest, K1, X).

% length of list

mylength([], 0).
mylength([_|Rest], N):- mylength(Rest, N1), N is N1+1.

% Reverse a list

myreverse([X], [X]).
myreverse([X|Rest], L):- myreverse(Rest, L1), append(L1, [X], L).

% Using accumulator
reverse_list(L, LR):- reverse_acc(L, [], LR).

reverse_acc([], A, A).
reverse_acc([X|Rest], A, L):- reverse_acc(Rest, [X|A], L).

% find whether palindrome

palindrome(L):- myreverse(L, L).

% Flatten a nested list

flatten_list([], []):- !.
flatten_list([Left|Right], L):- !,
	flatten_list(Left, Lf),
	flatten_list(Right, Rf),
	append(Lf, Rf, L).
flatten_list(L, [L]).

% substitute only first

substitute_1(_, [], _, []).
substitute_1(X, [X|L], Y, [Y|L]):- !.
substitute_1(X, [B|L], Y, [B|M]):- substitute_1(X, L, Y, M).

% Eliminate consecutive elements 

compress([], []).
compress([X, X|L], [X|L1]):- !, compress(L, L1).
compress([X, Y|L], [X|L1]):- compress([Y|L], L1).

% remove all

remove_all([], _, []).
remove_all([X|Rest], X, L):- !, remove_all(Rest, X, L).
remove_all([H|Rest], X, [H|L]):- remove_all(Rest, X, L). 

% Check sublist

sublist([], _).
sublist([X|Rest], [X|L]):- prefix(Rest, L), !.
sublist([X|Rest], [_|L]):- sublist([X|Rest], L).

prefix([], _).
prefix([X|L], [X|M]):- prefix(L, M).

% check subsequence
subsequence([], _).
subsequence([X|Rest], [X|L]):- subsequence(Rest, L), !.
subsequence([X|Rest], [_|L]):- subsequence([X|Rest], L).


% Pack consecutive elements

pack_duplicate([X], [[X]]):- !.
pack_duplicate([X|[X|Rest]], [[X|L]|T]):- !, pack_duplicate([X|Rest], [L|T]).
pack_duplicate([X|[Y|Rest]], [[X]|T]):- pack_duplicate([Y|Rest], T).

% Run length encoding

run_length_enc([X], [[1, X]]):- !.
run_length_enc([X|[X|Rest]], [[N, X]|T]):- 
	!, run_length_enc([X|Rest], [[N1, X]| T]), 
	N is N1+1.
run_length_enc([X|[Y|Rest]], [[1, X]|T]):- run_length_enc([Y|Rest], T).

% Modified run length

run_length2([X], [X]):- !.
run_length2([X, X|R], [[N, X]|T]):- 
	!, skip([X, X|R], X, N, Rest),
	run_length2(Rest, T).
run_length2([X|[Y|Rest]], [X|T]):- run_length2([Y|Rest], T).

skip([X|Rest], X, N, L):- !, skip(Rest, X, N1, L), N is N1+1.
skip([Y|Rest], _, 0, [Y|Rest]).

% Drop every kth element of list

drop(L, K, L1):- drop_kth(L, K, K, L1).

drop_kth([], _, _, []).
drop_kth([_|L], 1, K, L1):- !, drop_kth(L, K, K, L1).
drop_kth([H|T], K, N, [H|L]):- K > 1, K1 is K-1, drop_kth(T, K1, N, L).  

% Extract a slice from list

extract([X|_], 0, 0, [X]):- !.
extract([H|T], 0, K, [H|L]):- !, K1 is K-1, extract(T, 0, K1, L).
extract([_|T], S, E, L):- S1 is S-1, E1 is E-1, extract(T, S1, E1, L).

% insert element at pos

insert_at(X, L, 1, [X|L]):- !.
insert_at(X, [H|L], Ind, [H|L1]):- Ind1 is Ind-1, insert_at(X, L, Ind1, L1).

% Lotto: Draw N different random numbers from the set 1..M.

range(E, E, [E]):- !.
range(S, E, [S|L]):- S < E, S1 is S+1, range(S1, E, L).

rnd_select(_, 0, []):- !. 
rnd_select(L, N, [X|A]):- 
	random_select(X, L, Rest), 
	N1 is N-1, 
	rnd_select(Rest, N1, A). 

lotto(N, E, L):- range(1, E, List), rnd_select(List, N, L).

% find all possible combination 

combination(_, 0, []).
combination(L, K, [X|A]):- 
	select_el(X, L, Rest), 
	K > 0, K1 is K-1, 
	combination(Rest, K1, A).

select_el(X, [X|L], L).
select_el(X, [_|L], R):- select_el(X, L, R).

% Group the elements in disjoint subsets

group(L, G1, G2, G3):- 
	selectN(L, 2, G1, R1),
	selectN(R1, 2, G2, R2),
	selectN(R2, 5, G3, []).

selectN(L, 0, [], L).
selectN(L, N, [X|T], R):- 
	select_el(X, L, Rest),
	N > 0, N1 is N-1, 
	selectN(Rest, N1, T, R). 		

% Sorting a list of lists based on length


lsort(L, L1):- map_length(L, LK), key_sort(LK, LTemp), rem_key(LTemp, L1).

map_length([], []).
map_length([X|L], [(X, N)|L1]):- length(X, N), map_length(L, L1).

key_sort([], []).
key_sort([(H, N)|Tail], L):- key_sort(Tail, L1), insert((H, N), L1, L).

insert(X, [], [X]).
insert((X, N), [(H, N1)|T], [(X, N), (H, N1)|T]):- 
	N =< N1, !.
insert((X, N), [(H, N1)|T], [(H, N1)|T1]):-
	insert((X, N), T, T1).

rem_key([], []).
rem_key([(H, _)|Tail], [H|T]):- rem_key(Tail, T).

% Sorting on sublists length frequency

lfsort(L, L1):- 
	map_length(L, LKey),
	map_frequency(LKey, LFreq),
	key_sort(LFreq, LTemp),
	rem_key(LTemp, L1).

map_frequency([], []).
map_frequency([(H, N)|Tail], [(H, F)|Ans]):- 
	freq_length(Tail, N, F), 
	update_map(Tail, N, F, T1, Rest), 
	map_frequency(Rest, T),
	append(T, T1, Ans).

freq_length([], _, 0).
freq_length([(_, N)|T], N, F):- !, freq_length(T, N, F1), F is F1+1.
freq_length([_|T], N, F):- freq_length(T, N, F).

update_map([], _, _, [], []).
update_map([(H, N)|Tail], N, F, [(H, F)|T], Rest):- !, update_map(Tail, N, F, T, Rest).
update_map([(H, M)|Tail], N, F, T, [(H, M)|Rest]):- update_map(Tail, N, F, T, Rest).



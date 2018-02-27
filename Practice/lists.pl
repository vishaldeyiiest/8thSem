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


% Eliminate consecutive elements 

compress([], []).
compress([X, X|L], [X|L1]):- !, compress(L, L1).
compress([X, Y|L], [X|L1]):- compress([Y|L], L1).

% remove all

remove_all([], _, []).
remove_all([X|Rest], X, L):- !, remove_all(Rest, X, L).
remove_all([H|Rest], X, [H|L]):- remove_all(Rest, X, L). 

% Pack consecutive elements

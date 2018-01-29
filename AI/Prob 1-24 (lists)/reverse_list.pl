% 13: Reverse a list

reverse_list([], []).
reverse_list([X|Rest], Z):- reverse(Rest, L), append(L, [X], Z).

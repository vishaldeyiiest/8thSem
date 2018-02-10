% 36: Select an element x from a list and rest in another list

select_list(X, [X|R], R).
select_list(X, [H|R], [H|R1]):- select_list(X, R, R1).

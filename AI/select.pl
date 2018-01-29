% 36: Select an element x from a list and rest in another list

select(X, [X|R], R).
select(X, [H|R], [H|R1]):- select(X, R, R1).

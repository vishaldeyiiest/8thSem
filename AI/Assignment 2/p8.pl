% Flatten a list

flatten_list([], []):- !.
flatten_list([H|T], F):- !, flatten_list(H, Hf), flatten_list(T, Tf), append(Hf, Tf, F).
flatten_list(L, [L]).

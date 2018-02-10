% a- Split list into positive and negative

split([], [], []).
split([X], [X], []):- X >= 0, !.
split([X], [], [X]):- !.
split([X|Rest], [X|R1], R2):- X >= 0, !, split(Rest, R1, R2).
split([X|Rest], R1, [X|R2]):- split(Rest, R1, R2).

%

count_100([], 0).
count_100([X|Rest], C):- X > 100, !, count_100(Rest, C1), C is C1+1.
count_100([X|Rest], C):- count_100(Rest, C).


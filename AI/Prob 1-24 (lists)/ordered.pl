% 19: Check is list is ordered

ordered([]).
ordered([X]).
ordered([X|[Y|Rest]]):- X < Y, ordered([Y|Rest]).

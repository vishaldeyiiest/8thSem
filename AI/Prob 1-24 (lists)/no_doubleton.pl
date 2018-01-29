% Prog 2: Check if list is not a two element list

no_doubleton([]).
no_doubleton([X]).
no_doubleton([X|[Y|[Z|Rest]]]).

% 23: substitute an element X in list by Y

substitute(_, [], _, []).
substitute(A, [A|L], B, [B|M]):- !, substitute(A, L, B, M).
substitute(A, [X|L], B, [X|M]):- substitute(A, L, B, M).

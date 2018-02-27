% double list to ListList

double_list([], []).
double_list([X|L], [X|[X|L1]]):- double_list(L, L1).



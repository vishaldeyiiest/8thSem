% INTERLEAVE

interleave([], [], []).
interleave([], [X], [X]).
interleave([X], [], [X]).
interleave([X|L1], [Y|L2], [X, Y|L]):- interleave(L1, L2, L). 

% TRANSPOSE
transpose([], [], []).
transpose([], _, []):- write('Lists are of unequal length'), !. 
transpose(_, [], []):- write('Lists are of unequal length'), !. 
transpose([X|L1], [Y|L2], [(X, Y)|L]):- transpose(L1, L2, L). 



% INNER PRODUCT

dotproduct([X], [Y], P):- multiply(X, Y, P), !.
dotproduct([X|L1], [Y|L2], M):- multiply(X, Y, P), dotproduct(L1, L2, M1), M is M1+P.

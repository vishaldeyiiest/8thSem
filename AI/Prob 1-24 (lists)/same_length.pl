% Prog 3: Check whether two lists are of same length

same_length([], []).
same_length([A|X], [B|Y]):- same_length(X, Y).


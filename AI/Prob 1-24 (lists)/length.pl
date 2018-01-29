% Prog 4: Determine length of a list

my_length([], 0).
my_length([A|Rest], s(M)):- my_length(Rest, M).

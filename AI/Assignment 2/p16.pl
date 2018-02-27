% Musicians

musician_solution(S):- band_soloist(S),
			first(X, S), plays(X, piano), ordered_member(Y, Z, S),
			named(Y, john), plays(Y, saxophone), country(Z, australia),
			ordered_member(X1, Z1, S), named(X1, mark),
			country(X1, us), plays(Z1, violin),
			member1(X2, S), country(X2, japan), 
			member1(Y2, S), named(Y2, sam).

band_soloist(band(soloist(_, _, _), soloist(_, _, _), soloist(_, _, _))).

first(X, band(X, _, _)).

named(soloist(N, _, _), N).

country(soloist(_, C, _), C).

plays(soloist(_, _, I), I).

ordered_member(X, Y, band(X, Y, _)).
ordered_member(X, Z, band(X, _, Z)).
ordered_member(Y, Z, band(_, Y, Z)).

member1(X, band(X, _, _)).
member1(Y, band(_, Y, _)).
member1(Z, band(_, _, Z)).

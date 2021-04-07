% swipl
% consult('exams/2018-sett.pl').

foglie(empty,[]).
foglie(t(X,empty,empty),[X]) :- !.
foglie(t(_,L,R),[SL|RL]) :- foglie(L,SL), foglie(R,RL).

albero(
	t(
		a,
		t(b,
			t(c,empty,empty),
			t(d,empty,empty)
		),
		t(c,
			empty,
			t(d,empty,empty)
		)
	)
).

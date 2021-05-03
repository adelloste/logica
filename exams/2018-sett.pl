% swipl
% consult('exams/2018-sett.pl').

% foglie(+Tree,-Foglie)
% ha successo quando Tree è un albero binario e Foglie è una lista delle foglie di Tree (in qualsiasi ordine ed eventualmente con ripetizioni).

% example
% foglie(t(a,t(b,empty,empty),t(e,empty,empty)),X).

foglie(empty, []).
foglie(t(X, empty, empty), [X]) :- !.
foglie(t(_, L, R), F) :- foglie(L, F_L), foglie(R, F_R), append(F_L, F_R, F).

% leaves(+Tree,-Foglie,+Leaf)
% ha successo quando Tree è un albero binario e Foglie è una lista delle foglie di Tree che Leaf come etichetta (in qualsiasi ordine ed eventualmente con ripetizioni).

leaves(empty, []).
leaves(t(X, empty, empty), [X], X) :- !.
leaves(t(_, empty, empty), [], _) :- !.
leaves(t(_, L, R), F, X) :- leaves(L, F_L, X), leaves(R, F_R, X), append(F_L, F_R, F).

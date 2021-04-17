% swipl
% consult('exams/2018-sett.pl').

% foglie(+Tree,-Foglie)
% ha successo quando Tree è un albero binario e Foglie è una lista delle foglie di Tree (in qualsiasi ordine ed eventualmente con ripetizioni).

% example
% foglie(t(a,t(b,empty,empty),t(e,empty,empty)),X).

foglie(empty, []).
foglie(t(X, empty, empty), [X]) :- !.
foglie(t(_, L, R), F) :- foglie(L, F_L), foglie(R, F_R), append(F_L, F_R, F).

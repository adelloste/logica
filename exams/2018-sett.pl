% swipl
% consult('exams/2018-sett.pl').

% foglie(+Tree,-Foglie)
% ha successo quando Tree è un albero binario e Foglie è una lista delle foglie di Tree (in qualsiasi ordine ed eventualmente con ripetizioni).

foglie(empty, []).
foglie(t(X, empty, empty), [X]) :- !.
foglie(t(_, T_sx, T_dx), F) :- foglie(T_sx, F_sx), foglie(T_dx, F_dx), append(F_sx,F_dx,F).

% example
% foglie(t(a,t(b,empty,empty),t(e,empty,empty)),X).
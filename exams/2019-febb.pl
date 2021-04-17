% swipl
% consult('exams/2019-febb.pl').

% assoc(?X,+Lista,?V)
% vero se il valore di X secondo la funzione parziale rappresentata da Lista `e V. Se X e/o V non sono istanziati, il backtracking fornirà tutti i valori che rendono vero il predicato

% example
% assoc(X,[(b,2),(a,1),(c,3),(d,2)],2).
% assoc(X,[(b,2),(a,1)],V).

assoc(X, [(X,V)|_], V).
assoc(X, [_|Rest], V) :- assoc(X, Rest, V).

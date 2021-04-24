% swipl
% consult('exams/2015-febb.pl').

% Definire un predicato Prolog del first(+X,+L,?Resto), vero se Resto è la lista che
% si ottiene da L cancellando la prima occorrenza di X. Fallisce se X non occorre in L.
% Attenzione: se L contiene più occorrenze di X, il backtracking non deve fornire altre
% soluzioni (cancellando la seconda occorrenza, la terza ecc.). Usare quindi opportunamente il cut o il not.

del_first(A,[A],[]).
del_first(A,[A|Coda],Coda) :- !.
del_first(A,[T|Coda],[T|C]) :- del_first(A,Coda,C).

% oppure
del_first(X,[X|Rest],Rest) :- !.
del_first(X,[Y|Ys],[Y|Rest]) :- del_first(X,Ys,Rest).

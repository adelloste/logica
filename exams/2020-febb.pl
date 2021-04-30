% swipl
% consult('exams/2020-febb.pl').

% Definire (senza utilizzare il predicato predefinito select) un predicato
% Prolog cancella(+X,+L,?Resto), vero se Resto è la lista che si ottiene
% da L cancellando la prima occorrenza di X. Fallisce se X non occorre in L.
% Attenzione: se L contiene più occorrenze di X, il backtracking non deve
% fornire altre soluzioni (cancellando la seconda occconsult('exams/2020-febb.pl').orrenza, la terza ecc.).
% Usare quindi opportunamente il cut o il not

% example
% cancella(1,[2,4,5,1,6,7,1,8,9],X).

cancella(X,[X|Rest],Rest) :- !.
cancella(X,[Y|Ys],[Y|Rest]) :- cancella(X,Ys,Rest).

% swipl
% consult('exams/2016-febb.pl').

% actions(+Start,+Goal,?Arcs)
% vero se Arcs è la lista delle etichette degli archi di un cammino senza ripetizioni di nodi da Start a Goal nel grafo definito dalla procedura arc (attenzione ai cicli!).

arc(1,a,2).
arc(1,b,3).
arc(1,c,4).
arc(2,a,6).
arc(3,b,5).
arc(3,c,5).
arc(4,b,1).
arc(4,c,6).
arc(5,c,4).
arc(6,b,5).

actions(Start,Goal,Arcs) :- actions(Start,Goal,Arcs,[]).

actions(X,X,[],Visited) :- \+ member(X,Visited).
actions(X,Y,[H|Rest],Visited) :- \+ member(X,Visited), arc(X,H,Z), actions(Z,Y,Rest,[X|Visited]).

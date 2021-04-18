% swipl
% consult('exams/2013-sett.pl').

% Assumendo di avere un insieme di fatti che definiscono il predicato connects(D,Loc1,Loc2),
% come nell'esercizio precedente, definire un predicato Prolog percorso(+Start,+Dest,-Porte),
% che ha successo quando Start e Dest sono due locali e Porte è una lista di porte da attraversare per andare da Start a Dest.
% La lista di porte non deve avere ripetizioni (cioè il percorso deve essere senza cicli).

connects(a,1,2).
connects(b,1,3).
connects(c,1,4).
connects(a,2,6).
connects(b,3,5).
connects(c,3,5).
connects(b,4,1).
connects(c,4,6).
connects(c,5,4).
connects(b,6,5).

percorso(Start,Goal,Arcs) :- percorso(Start,Goal,Arcs,[]).

percorso(X,X,[],Visited) :- \+ member(X,Visited).
percorso(X,Y,[H|Rest],Visited) :- \+ member(X,Visited), connects(H,X,Z), percorso(Z,Y,Rest,[X|Visited]).

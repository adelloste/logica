% swipl
% consult('exams/2013-lugl.pl').

% assocmin(+L,?E)
% ha successo quando L è una lista di coppie L = [(n1,e1),(n2,e2),...], dove i primi elmenti delle coppie ni sono numeri, ed E è uno degli ei associati al minimo valore ni.

% example
% assocmin([(3,a),(2,b),(4,c),(2,d)],E)

% Predicato ausiliare min(+L,?X) che ha succeso se X è il minimo della lista L
min([(X,_)],X) :- !.
min([(X,_)|Rest],X) :- min(Rest,N), X =< N, !.
min([_|Rest],N) :- min(Rest,N).

% Predicato ausiliare assoc(+L,?E,?X) che ha successo se il valore E e X sono associati alla lista L
assoc([(X,E)|_],E,X).
assoc([_|Rest],E,X) :- assoc(Rest,E,X).

assocmin(L,E) :- min(L,X), assoc(L,E,X).
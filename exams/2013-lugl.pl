% swipl
% consult('exams/2013-lugl.pl').

% assocmin(+L,?E)
% ha successo quando L è una lista di coppie L = [(n1,e1),(n2,e2),...], dove i primi elmenti delle coppie ni sono numeri, ed E è uno degli ei associati al minimo valore ni.

% example
% assocmin([(3,a),(2,b),(4,c),(2,d)],E)

min([],_).
min([(X,_)|Coda], L) :- (L =< X), min(Coda,L).

assocmin([(N,E)|Coda],E) :- min(Coda,N).
assocmin([(_,_)|Coda],E) :- assocmin(Coda,E).

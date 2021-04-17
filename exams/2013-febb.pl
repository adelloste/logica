% swipl
% consult('exams/2013-febb.pl').

% branch(+Tree,?Leaf,-Branch)
% Possiamo rappresentare gli alberi binari in Prolog mediante strutture che hanno una di queste forme: leaf(X) (foglia etichettata da X), one(X,T) (albero con radice X e T come unico sottoalbero), two(X,T1,T2) (albero con radice X e due sottoalberi, T1 e T2).
% Scrivere un predicato branch(+Tree,?Leaf,-Branch) che ha successo quando Tree è un albero binario (rappresentato come descritto sopra), e Branch è una lista che rappresenta un ramo dalla radice a una foglia etichettata da Leaf
% Se vi sono più foglie etichettate da Leaf, il predicato genererà (mediante backtracking) tutti i rami dalla radice a Leaf. Richiamato con Leaf e Branch variabili, il predicato genererà (mediante backtracking) tutti i rami dell'albero.

% example
% branch(two(10,one(20,two(50,leaf(5),leaf(8))),one(30,two(2,one(3,leaf(100)),two(4,leaf(6),leaf(8))))),100)

branch(leaf(X),X,[X]).
branch(one(X,T),L,[X|F]) :- branch(T,L,F).
branch(two(X,T1,T2),L,[X|F]) :- branch(T1,L,F); branch(T2,L,F).

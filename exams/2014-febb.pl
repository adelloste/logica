% swipl
% consult('exams/2014-febb.pl').

% ordered(+Tree,-Branch)
% ha successo quando Tree è un albero binario, e Branch è una lista che rappresenta un ramo ordinato in senso non decrescente dalla radice a una foglia dell'albero.

% radice(+T,?X) = X è la radice di T

% example
% ordered(two(10,one(20,two(50,leaf(5),leaf(8))),one(30,two(30,one(35,leaf(100)),two(40,leaf(6),leaf(48))))),X).

radice(leaf(X),X).
radice(one(X,_),X).
radice(two(X,_,_),X).

ordered(leaf(X),[X]).
ordered(one(X,T),[X|R]) :- radice(T,N), X =< N, ordered(T,R).
ordered(two(X,T1,T2),[X|R]) :- radice(T1,N1), X =< N1, ordered(T1,R) ; radice(T2,N2), X =< N2, ordered(T2,R).

% swipl
% consult('examples/all.pl').

% Es 4
% Definire un predicato maxlist(+L,?N) (dove L è una lista di numeri),
% vero se N è il massimo elemento della lista L. Fallisce se L è vuota.

maxlist([X],X).
maxlist([X,Y|Rest],Result) :- X >= Y, !, maxlist([X|Rest],Result).
maxlist([_,Y|Rest],Result) :- maxlist([Y|Rest],Result).

% Es 5
% Avendo definito pari(X) :- 0 is X mod 2.
% definire il predicato split(+L,?P,?D) = se L è una lista di interi, P è la
% lista contenente tutti gli elementi pari di L e D tutti quelli dispari (nello
% stesso ordine in cui occorrono in L).

pari(X) :- 0 is X mod 2.

split([],[],[]).
split([X|Rest],[X|E],O) :- pari(X), !, split(Rest,E,O).
split([X|Rest],E,[X|O]) :- split(Rest,E,O).

% Es 7
% Definire un predicato prefisso(Pre,L) = la lista Pre è un prefisso della
% lista L. Ad esempio, i prefissi della lista [1,2,3] sono: la lista vuota [] e
% le liste [1], [1,2] e [1,2,3] stessa.

prefisso([],_).
prefisso([X|Pre],[X|L]) :- prefisso(Pre,L).

% Es 8
% Definire un predicato suffisso(Suf,L) = la lista Suf è un suffisso della
% lista L. Ad esempio, i suffissi della lista [1,2,3] sono: la lista vuota [] e
% le liste [3], [2,3] e [1,2,3] stessa.

suffisso(X,X).
suffisso(Suff,[_|Rest]) :- suffisso(Suff,Rest).

% Es 9
% Definire un predicato sublist(S,L) = S è una sottolista di L costituita da
% elementi contigui in L. Ad esempio, le sottoliste di [1,2,3] sono: la lista
% vuota [] e le liste [1], [2], [3], [1,2], [2,3] e [1,2,3] stessa.

sublist(Sub,L) :- append(_,Suffisso,L), append(Sub,_,Suffisso).

% Es 10.a
% subset(+Sub,?Set) = tutti gli elementi di Sub sono anche elementi di Set.

subset([],_).
subset([X|Rest],Set) :- member(X,Set), subset(Rest,Set).

% Es 10.b
% rev(+X,?Y) = Y è la lista che contiene gli stessi elementi di X, ma in ordine inverso.

rev([],[]).
rev([X|Rest],Rev) :- rev(Rest,RevRest), append(RevRest,[X],Rev).

% Ex 10c
% del_first(+X,+L,?Resto) = Resto è la lista che si ottiene da L
% cancellando la prima occorrenza di X. Fallisce se X non occorre in L.
% Attenzione: se L contiene più occorrenze di X, il backtracking non
% deve fornire altre soluzioni (cancellando la seconda occorrenza, la
% terza ecc.). Usare quindi opportunamente il cut o il not.

del_first(X,[X|L],L) :- !.
del_first(X,[Y|L],[Y|Resto]) :- del_first(X,L,Resto).

% Ex 10d
% del(+X,+L,?Resto) = Resto è la lista che si ottiene da L cancellando tutte le occorrenze di X.
% Se X non occorre in L, Resto è uguale a L stessa.
% Attenzione: il backtracking non deve generare altre soluzioni, in cui alcune occorrenze X rimangono nella soluzione.

del(_,[],[]).
del(X,[X|L],Rest) :- !, del(X,L,Rest).
del(X,[Y|L],[Y|Rest]) :- del(X,L,Rest).

% Ex 10f
% mkset(+L,-Set) = Set è una lista senza ripetizioni che contiene
% tutti e solo gli elementi di L (senza utilizzare il predicato predefinito
% list to set/2).

mkset([],[]).
mkset([X|Rest],S) :- member(X,Rest), !, mkset(Rest,S).
mkset([X|Rest],[X|S]) :- mkset(Rest,S).

% Ex 10g
% union(+A,+B,-Union) = Union è una lista (senza ripetizioni, se
% anche A e B sono senza ripetizioni) che rappresenta l’unione di A e B.
union([],B,B).
union([X|Xs],B,U) :- member(X,B), !, union(Xs,B,U).
union([X|Xs],B,[X|U]) :- union(Xs,B,U).

% Ex 12
% Definire un predicato insert(X,L1,L2), vero se L2 si ottiene inserendo X
% in L1 (in qualsiasi posizione). Almeno una delle due liste L1 e L2 devono
% essere istanziate. Ad esempio:
% 
% ?- insert(a,[1,2],X).
% X = [a, 1, 2] ;
% X = [1, a, 2] ;
% X = [1, 2, a] ;
% false.
% 
% ?- insert(a,X,[1,a,2]).
% X = [1, 2] ;
% false.

insert(X,L1,[X|L1]).
insert(X,[Y|Ys],[Y|N]) :- insert(X,Ys,N).


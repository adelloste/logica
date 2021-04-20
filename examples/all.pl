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

% del(+X,+L,?Resto) = Resto è la lista che si ottiene da L cancellando tutte le occorrenze di X.
% Se X non occorre in L, Resto è uguale a L stessa.
% Attenzione: il backtracking non deve generare altre soluzioni, in cui alcune occorrenze X rimangono nella soluzione.

del(_,[],[]).
del(X,[X|L],Rest) :- !, del(X,L,Rest).
del(X,[Y|L],[Y|Rest]) :- del(X,L,Rest).

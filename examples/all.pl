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

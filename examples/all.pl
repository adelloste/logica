% swipl
% consult('examples/all.pl').

% Es 3
% Definire il predicato palindroma(X), vero se X è una lista palindroma
% (se la lista viene letta in un verso o nell'altro si ottiene la stessa sequenza
% di elementi). Ad esempio [a,b,c,b,a] è palindroma, [a,b,c,a] non lo è.

palindroma([]).
palindroma([_]).
palindroma([X|Rest]) :- append(Middle,[X],Rest), palindroma(Middle). % utilizzando append rimuovo l'ultimo elemento di Rest

% Es 4
% Definire un predicato maxlist(+L,?N) (dove L è una lista di numeri),
% vero se N è il massimo elemento della lista L. Fallisce se L è vuota.

maxlist([X],X).
maxlist([X,Y|Rest],Result) :- X >= Y, !, maxlist([X|Rest],Result).
maxlist([_,Y|Rest],Result) :- maxlist([Y|Rest],Result).

% oppure

maxlist([X],[X]).
maxlist([X|Rest],X) :- maxlist(Rest,MX), X >= MX, !.
maxlist([_|Rest],X) :- maxlist(Rest,X).

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

sublist([],_).
sublist([X|Xs],[X|Ys]) :- sublist(Xs,Ys).
sublist([X|Xs],[_|Ys]) :- sublist([X|Xs],Ys).

% oppure

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

% oppure

mkset([],[]).
mkset([X|Rest],[X|Result]) :- mkset(Rest,Result), \+ member(X,Result), !.
mkset([_|Rest],Result) :- mkset(Rest,Result).


% Ex 10g
% union(+A,+B,-Union) = Union è una lista (senza ripetizioni, se
% anche A e B sono senza ripetizioni) che rappresenta l’unione di A e B.
union([],B,B).
union([X|Xs],B,U) :- member(X,B), !, union(Xs,B,U).
union([X|Xs],B,[X|U]) :- union(Xs,B,U).

% oppure

union([],U,U).
union([X|Rest],L,[X|Result]) :- union(Rest,L,Result), \+ member(X,L), !.
union([_|Rest],L,Result) :- union(Rest,L,Result).

% Ex 11
% Definire un predicato cartprod(+A,+B,-Set), vero se A e B sono liste
% e Set una lista di coppie che rappresenta il prodotto cartesiano di A e B.
% Ad esempio:
% 
% ?- cartprod([a,b,c],[1,2],Set).
% Set = [ (a, 1), (a, 2), (b, 1), (b, 2), (c, 1), (c, 2)].

couple(_,[],[]) :- !.
couple(X,[Y|Ys],[(X,Y)|Rest]) :- couple(X,Ys,Rest).

cartprod(_,[],[]) :- !.
cartprod([],_,[]) :- !.
cartprod([X|Xs],Y,A) :- couple(X,Y,C), cartprod(Xs,Y,R), append(C,R,A).

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

% Ex 14
% Definire un predicato search subset(+IntList,+N,?Set), dove IntList
% è una lista di interi positivi e N un intero positivo, che sia vero se Set
% è una lista rappresentante un sottoinsieme di IntList, tale che la somma
% degli elementi in Set è uguale a N. Si può assumere che IntList sia senza
% ripetizioni. Ad esempio:
% 
% ?- search_subset([4,8,5,3,9,6,7],9,Subset).
% Subset = [4, 5] ;
% Subset = [3, 6] ;
% Subset = [9] ;
% false.

search_subset(_,0,[]) :- !.
search_subset([X|Xs],T,[X|Rest]) :- X =< T, N is T - X, search_subset(Xs,N,Rest).
search_subset([_|Xs],T,Rest) :-  search_subset(Xs,T,Rest).

% Ex 15
% Conveniamo di rappresentare gli alberi binari usando l’atomo empty per
% l’albero vuoto e strutture della forma t(Root,Left,Right) per alberi con
% radice Root, sottoalbero sinistro Left e sottoalbero destro Right. Definire
% i predicati:

% Ex 15.a
% height(+T,?N) = N è l’altezza dell’albero T. Il predicato fallisce
% se T è l’albero vuoto.

height(t(_,empty,empty),0).
height(t(_,L,empty),H) :- height(L,H_L), H is H_L + 1.
height(t(_,empty,R),H) :- height(R,H_R), H is H_R + 1.
height(t(_,L,R),H) :- height(L,H_L), height(R,H_R), (H_L >= H_R, H is H_L + 1; H is H_R + 1).

% Ex 15.b
% reflect(T,T1) = T è l’immagine riflessa di T1. Almeno uno tra T e T1 devono essere completamente istanziati.
reflect(empty,empty).
reflect(t(X,Left,Right),t(X,R,L)) :- reflect(Left,L), reflect(Right,R).

% Ex 15.c
% size(+T,?N) = N `e il numero di nodi dell’albero T.

size(empty, 0).
size(t(_,Left,Right),N) :- size(Left,L), size(Right,R), N is L + R + 1.

% Ex 15.d
% labels(+T,-L) = L è una lista di tutte le etichette dei nodi di T.
% Se diversi nodi di T hanno la stessa etichetta, la lista L conterrà
% ripetizioni dello stesso elemento. Gli elementi di L possono occorrere
% in qualsiasi ordine.

labels(empty,[]).
labels(t(X,Left,Right),[X|Rest]) :- labels(Left,L), labels(Right,R), append(L,R,Rest).

% oppure

labels(empty,[]) :- !.
labels(t(X,L,empty),[X|Y]) :- labels(L,Y), !.
labels(t(X,empty,R),[X|Y]) :- labels(R,Y), !.
labels(t(X,Left,Right),[X|Rest]) :- labels(Left,L), labels(Right,R), append(L,R,Rest).

% Ex 15.e
% branch(+T,?Leaf,?Path) = Path è una lista che rappresenta un
% ramo dalla radice di T fino a una foglia etichettata da Leaf.

branch(t(X,empty,empty),X,[X]).
branch(t(X,Left,Right),Y,[X|P]) :- branch(Left,Y,P); branch(Right,Y,P).

% Ex 16
% Un grafo si può rappresentare mediante un insieme di fatti della forma
% arc(X,Y), che definiscono la relazione binaria "esiste un arco da X a Y".
% Definire un predicato path(?Start,?Goal,?Path) = Path è una lista che
% rappresenta un cammino da Start a Goal nel grafo definito nel programma.
% Suggerimento: utilizzare un predicato ausiliario a quattro argomenti
% path(?Start,?Goal,?Path,+Visited) = Path è una lista che rappresenta un cammino da Start a Goal che non passa per nessuno dei nodi
% della lista Visited.

arc(a,b).
arc(a,e).
arc(b,a).
arc(b,c).
arc(c,c).
arc(c,d).
arc(d,c).
arc(d,b).
arc(e,c).
path(S,G,P) :- path(S,G,P,[]).
path(X,X,[X],Visited) :- \+ member(X,Visited).
path(S,G,[S|P],Visited) :- \+ member(S,Visited), arc(S,Z), path(Z,G,P,[S|Visited]).

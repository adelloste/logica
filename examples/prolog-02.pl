% swipl
% consult('examples/prolog-02.pl').

% append(?List1, ?List2, ?ListaAndList2): List1AndList2 is the concatenation of List1 and List2
% conc = append
conc([],X,X).
conc([X|L1],L2,[X|L3]) :- conc(L1,L2,L3).

% appen3(L1,L2,L3,Result) = Result è la concatenazione di L1, L2, L3
append3(L1,L2,L3,Result) :- append(L1,L2,L), append(L,L3,Result).

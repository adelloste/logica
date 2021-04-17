% swipl
% consult('exams/2019-sett.pl').

% complemento(+Set,+Subset,-C)
% Assumendo che Set e Subset siano liste senza ripetizioni – abbia successo quando C è una lista che rappresenta il complemento di Subset rispetto a Set.
% Il predicato fallisce se Subset contiene qualche elemento che non appartiene a Set.

% example
% complemento([1,2,3,4,5,6],[2,4,6],C)
% complemento([1,2,3,4,5,6],[2,4,7],C)

complemento(L,[],L).
complemento(L,[X|Rest],C) :- select(X,L,N), !, complemento(N,Rest,C).

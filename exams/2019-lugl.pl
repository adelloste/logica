% swipl
% consult('exams/2019-lugl.pl').

% disordinati(+L,?D)
% ha successo se e solo se L è una lista di interi e D è una lista che contiene gli elementi di L che sono minori dell'elemento precedente.
% Gli elementi di D devono occorrere nello stesso ordine in cui occorrono in L. Ovviamente, se L è ordinata, D sarà vuota.

% example
% disordinati([1,10,5,6,7,4,9],Result)

disordinati([],[]).
disordinati([X,Y|Rest],[Y|Result]) :- Y < X, disordinati([Y|Rest],Result), !.
disordinati([_,Rest],Result) :- disordinati(Rest,Result).

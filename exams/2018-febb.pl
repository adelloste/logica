% swipl
% consult('exams/2018-febb.pl').

sublist([],_).
sublist([T|Xs],[T|Ys]) :- sublist(Xs,Ys).
sublist([T|Xs],[_|Ys]) :- sublist([T|Xs],Ys).

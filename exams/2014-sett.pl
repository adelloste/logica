% swipl
% consult('exams/2014-sett.pl').


% Siano date le seguenti dichiarazioni di operatori in Prolog:
% :- op(800, yfx, &).
% :- op(850, yfx, v).
% :- op(870, yfx, =>).
% per rappresentare formule della logica proposizionale (& rappresenta la congiunzione, v la disgiunzione, => l’implicazione, e la negazione è rappresentata dall’operatore predefinito -).
% Una sostituzione è una funzione parziale che associa formule (qualsiasi) a formule atomiche.
% Conveniamo di rappresentare la sostituzione che associa all'atomo P1 la formula F1, . . . , all’atomo Pn la formula Fn mediante una lista associativa della forma [(P1,F1),...,(Pn,Fn)].
% Applicando la sostituzione [(P1,F1),...,(Pn,Fn)] a una formula si ottiene la formula in cui ogni occorrenza di P1 è sostituita dalla formula F1, . . . , ogni occorrenza di Pn è sostituita dalla formula Fn.
% Scrivere un predicato Prolog applica sost(+F,+Sost,?G) che ha successo quando G è il risultato dell'applicazione della sostituzione Sost a F.

% example
% applica_sost(p & (q => r v p), [(p,-(r & q)), (r,s => p)], Result).
% Result = (-(r&q) & (q => (s=>p) v -(r&q)))

:- op(800, yfx, &).    % Congiunzione
:- op(850, yfx, v).    % Disgiunzione
:- op(870, yfx, =>).   % Implicazione

applica_sost(A, Sost, G) :- member((A, G), Sost), !.
applica_sost(-A ,Sost, -G) :- applica_sost(A, Sost, G), !.
applica_sost(A & B, Sost, G1 & G2) :- applica_sost(A, Sost, G1), applica_sost(B, Sost, G2), !.
applica_sost(A v B, Sost, G1 v G2) :- applica_sost(A, Sost, G1), applica_sost(B, Sost, G2), !.
applica_sost(A => B, Sost, G1 => G2) :- applica_sost(A, Sost, G1), applica_sost(B, Sost, G2), !.
applica_sost(A, _, A).

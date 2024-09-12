burger(X) :- big_mac(X).
burger(X) :- little_mac(X).
burger(X) :- big_kahuna_burger(X).
burger(X) :- whopper(X).

big_mac(a).
big_kahuna_burger(b).
little_mac(c).
whopper(d). 

enjoys(vincent,X)  :-  burger(X),
   not(big_kahuna_burger(X)).

p(1).
p(2)  :-  !.
p(3).

class(Number,positive)  :-  Number  >  0, !.
class(0,zero) :- !.
class(Number,negative)  :-  Number  <  0.

split(L, P, N) :- acc_split(L, [], [], P, N).
acc_split([], Pacc, Nacc, Pacc, Nacc):- !.
acc_split([H|L], Pacc, Nacc, P, N) :- 
    class(H, positive), !, acc_split(L, [H|Pacc], Nacc, P, N).
acc_split([H|L], Pacc, Nacc, P, N) :-
    class(H, negative), !, acc_split(L, Pacc, [H|Nacc], P, N).
acc_split([H|L], Pacc, Nacc, P, N) :-
    class(H, zero), !, acc_split(L, Pacc, Nacc, P, N).

directTrainInt(saarbruecken,dudweiler).
directTrainInt(forbach,saarbruecken).
directTrainInt(freyming,forbach).
directTrainInt(stAvold,freyming).
directTrainInt(fahlquemont,stAvold).
directTrainInt(metz,fahlquemont).
directTrainInt(nancy,metz). 
directTrainInt(freyming, metz).
directTrain(X, Y):- directTrainInt(X, Y); directTrainInt(Y, X).

route(X, Y, R):- acc_route(X, Y, [], R).
acc_route(X, Y, Acc, [X, Y|Acc]):- directTrain(Y, X).
acc_route(X, Y, Acc, R) :- 
    directTrain(Y, Z), not(member(Z, Acc)), 
    acc_route(X, Z, [Y|Acc], R).

loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

jealous(X,Y):- dif(X, Y), loves(X,Z),  loves(Y,Z). 

nu(X, X):- !, fail.
nu(_, _).

nu1(X, Y):- \+(X = Y).

%I don't know how to do it with = but without \+ 

unifiable(L1, T, L2):- acc_unifiable(L1, T, [], L2).
acc_unifiable([], _, L2Acc, L2Acc).
acc_unifiable([X|L], T, L2Acc, L2):- 
    nu(X, T), !, 
    acc_unifiable(L, T, L2Acc, L2).
acc_unifiable([X|L], T, L2Acc, L2):- 
    acc_unifiable(L, T, [X|L2Acc], L2).

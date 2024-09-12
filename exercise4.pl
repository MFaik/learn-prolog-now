a2b([], []).
a2b([a|A], [b|B]):- a2b(A, B).

second(X, [_, X|_]).

swap12([X, Y|L], [Y, X|L]).

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine). 

listtran([], []).
listtran([G|GL], [E|EL]):- tran(G, E), listtran(GL, EL).

twice([], []).
twice([X|L], [X, X|LD]):- twice(L, LD).

combine1(X, [], X):- !.
combine1([], X, X):- !.
combine1([X|L1], [Y|L2], [X, Y|Lcomb]):- combine1(L1, L2, Lcomb).

combine2([], [], []).
combine2([X|L1], [Y|L2], [[X, Y]|Lcomb]):- combine2(L1, L2, Lcomb).

combine3([], [], []).
combine3([X|L1], [Y|L2], [j(X, Y)|Lcomb]):- combine3(L1, L2, Lcomb).

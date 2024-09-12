accMax([], A, A).
accMax([H|L], A, Max):-
    H > A, accMax(L, H, Max).
accMax([H|L], A, Max):- 
    H =< A, accMax(L, A, Max).

max([H|L], Max):-
    accMax(L, H, Max).

increment(X, Y):- Y is X+1.
sum(X, Y, Sum):- Sum is X+Y.

addone([], []).
addone([X|L1], [Y|L2]):-
    Y is X+1, addone(L1, L2).

accMin([], A, A).
accMin([H|L], A, Min):-
    H < A, accMin(L, H, Min).
accMin([H|L], A, Min):-
    H >= A, accMin(L, A, Min).
min([H|L], Min):-
    accMin(L, H, Min).
    
scalarMult(_, [], []).
scalarMult(S, [H1|L1], [H2|L2]):- 
    H2 is S*H1, scalarMult(S, L1, L2).

accDot([], [], A, A).
accDot([H1|L1], [H2|L2], A, Dot):-
    Anew is H1*H2+A, accDot(L1, L2, Anew, Dot).
dot(L1, L2, Dot):- accDot(L1, L2, 0, Dot).

dotBad([], [], 0).
dotBad([H1|L1], [H2|L2], Dot):- dotBad(L1, L2, DotNew), Dot is H1*H2+DotNew.

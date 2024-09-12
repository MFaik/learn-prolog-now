half(L, X):- accHalf(L, L, X).
accHalf([], L, L).
accHalf([_, _|L1], [_|L2], Acc):- accHalf(L1, L2, Acc).
halfeq(_, []):-!.
halfeq([H|L1], [H|L2]):- halfeq(L1, L2).
doubled(L):- half(L, Half), halfeq(L, Half).

palindrome(L):- reverse(L, L).

toptail([_|L], Ret):- append(Ret, [_], L).

last_rec([X], X):-!.
last_rec([_|L], X):- last_rec(L, X).

last_rev(L, X):- reverse(L, [X|_]).

lasteq([X], X, [Y], Y).
lasteq([X|L1], H1, [X|L2], H2):- lasteq(L1, H1, L2, H2).
swapfl([H1|L1], [H2|L2]):- lasteq(L1, H2, L2, H1).

swapfl_app([F1|L1], [F2|L2]):- append(L,[F2],L1), append(L,[F1], L2).

% I couldn't really do it :/
house([Color, Nationality, Pet]):-
    (Color = red; Color = blue; Color = green),
    known_people([Color, Nationality, Pet]).
known_people([Color, Nationality, Pet]):-
    (Color = red, Nationality = english);
    (Nationality = spanish, Pet = jaguar).
neighbourhood([House1, House2, House3]):- 
    ((House1 = [_, _, snail], House2 = [_, japanese, _]);
    ( House2 = [_, _, snail], House3 = [_, japanese, _])),
    ((House1 = [_, _, snail], House2 = [blue, _, _]);
    ( House2 = [_, _, snail], House3 = [blue, _, _])).
zebra(Who):- neighbourhood(L1), member([_, Who, zebra], L1).

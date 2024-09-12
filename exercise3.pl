p :- p.

numeral(0).
numeral(succ(X)) :- numeral(X).

add(X, 0, X).
add(X, succ(Y), succ(Z)) :- add(X, Y, Z).

sub(X, 0, X).
sub(succ(X), succ(Y), Z) :- sub(X, Y, Z).

directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

in(X, Y) :- directlyIn(X, Y), !.
in(X, Y) :- directlyIn(X, Z), in(Z, Y).

greater_than(_, 0).
greater_than(succ(X), succ(Y)) :- greater_than(X, Y).

swap(leaf(X), leaf(X)).
swap(tree(X, Y), tree(Y1, X1)) :- swap(Y, Y1), swap(X, X1).

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X, Y):- connected(X, Y).
path(X, Y):- connected(X, Z), path(Z, Y).

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

travelDirect(X, Y, go_plane(X, Y, Path), Path) :- 
    byPlane(X, Y).
travelDirect(X, Y, go_train(X, Y, Path), Path) :-
    byTrain(X, Y). 
travelDirect(X, Y, go_car(X, Y, Path), Path) :-
    byCar(X, Y).

travel(X, Y, Path):- travelDirect(X, Y, Path, _).
travel(X, Y, Path):- travelDirect(X, Z, Path, Rest), travel(Z, Y, Rest).

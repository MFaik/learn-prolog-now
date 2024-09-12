killer(butch).
married(mia, marsellus).
dead(zed).
kill(marsellus, X):- footmassage(X, mia).
love(mia, X):- goodDancer(X).
eat(jules, X):- nutritious(X); tasty(X).

nutritious(eggplant).
nutritious(pepper).
tasty(pizza).
tasty(potato).
tasty(tomato).

goodDancer(marsellus).
goodDancer(zed).
goodDancer(jules).

footmassage(marsellus, mia).
footmassage(zed, mia).

wizard(ron).
hasWand(harry).
quidditchPlayer(harry).
wizard(X):-  hasBroom(X),  hasWand(X).
hasBroom(X):-  quidditchPlayer(X).

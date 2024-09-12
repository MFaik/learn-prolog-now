:- dynamic sigma_lookup/2.

sigma(N, Sum):-
    sigma_lookup(N, Sum).

sigma(1, 1):- !.
sigma(N, S):-
    N1 is N-1, sigma(N1, S1), S is S1+N,
    assert(sigma_lookup(N, S)).

%subset1 can generate and check subsets
%but subset1 relies on inputs being "sets"
%meaning that every element should be unique and the list needs to be ordered
subset1([], []).
subset1([H|S1], [H|S]):-
    subset1(S1, S).
subset1(S1, [_|S]):-
    subset1(S1, S).

%subset2 can't generate subsets
%but can properly checks unorderd sets
subset2([], _).
subset2([H|S1], S):-
    member(H, S), subset2(S1, S).

%in the end I just combined these two
subset(X, Y):- 
    var(X), !, subset1(X, Y).
subset(X, Y):-
    %nonvar(X), % this line is unnecessary because of the red cut above
    subset2(X, Y), !.

powerset(X, P):-
    findall(List, subset(List, X), P).

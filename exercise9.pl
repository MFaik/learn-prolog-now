:- module(pptree, [pptree/2]).

complex_term(X) :-
    nonvar(X),
    functor(X, _, A),
    A > 0.

termtype(X, atom) :- atom(X).
termtype(X, integer) :- integer(X).
termtype(X, float) :- float(X).
termtype(X, number) :- number(X).
termtype(X, constant) :- atomic(X).
termtype(X, variable) :- var(X).
%termtype(X, nonvar) :- nonvar(X).
termtype(X, complex_term) :- complex_term(X).
termtype(X, simple_term) :- \+complex_term(X).
termtype(_, term).

groundterm(X) :- 
    nonvar(X), functor(X, _, A), A = 0.
groundterm(X) :- 
    nonvar(X), functor(X, _, A), A > 0, 
    X =.. [_| Arglist], groundterm_list(Arglist).
groundterm_list([]).
groundterm_list([H|L]) :-
    groundterm(H), groundterm_list(L).

pptree(Stream, T):-
    pptree_list(Stream, [T], 0), !.
pptree_list(_, [], _).
pptree_list(S, [H|L], Scnt):-
    complex_term(H), H =.. [Name|Args],
    ((Scnt == 0, !);nl(S)), tab(S, Scnt), write(S, Name), write(S, '('),
    NewScnt is Scnt+2,
    pptree_list(S, Args, NewScnt),
    write(S, ')'),
    ((L = [], !); write(S, ', ')),
    pptree_list(S, L, Scnt).
pptree_list(S, [H|L], Scnt):-
    \+complex_term(H), 
    ((H = [], !); write(S, H),
    ((L = [], !); write(S, ', '))),
    pptree_list(S, L, Scnt).


:- op(300, xfx, implies).
:- op(200, xfx, and).
:- op(200, xfx, or).
:- op(100, fx, not).

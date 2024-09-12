s --> np(X),vp(X).

np(X) --> det(X),n(X).

vp(X) --> v(X),np(_).
vp(X) --> v(X).

det(_) --> [the].
det(single) --> [a].

n(single) --> [woman].
n(plural) --> [women].
n(single) --> [man].
n(plural) --> [men].
n(single) --> [apple].
n(plural) --> [apples].
n(single) --> [pear].
n(plural) --> [pears].

v(single) --> [eats]. 
v(plural) --> [eat].
v(single) --> [knows].
v(plural) --> [know].

kanga(V,R,Q) --> roo(V,R),jumps(Q,Q),{marsupial(V,R,Q)}.
% kanga(V, R, Q, A, B):-
%     roo(V, R, A, _1),
%     jumps(Q, Q, _1, B),
%     marsupial(V, R, Q).

% these are needed because swiple gives error
roo(_, _) --> [a].
jumps(_, _) --> [b].
marsupial(_, _, _).

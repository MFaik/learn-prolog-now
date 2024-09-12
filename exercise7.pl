s  -->  foo,bar,wiggle.
foo  -->  [choo].
foo  -->  foo,foo.
bar  -->  mar,zar.
mar  -->  me,my.
me  -->  [i].
my  -->  [am].
zar  -->  blar,car.
blar  -->  [a].
car  -->  [train].
wiggle  -->  [toot].
wiggle  -->  wiggle,wiggle. 
% % the above code translates into this
% s(A, B):- foo(A, C), bar(C, D), wiggle(D, B).
% foo([choo|W], W).
% foo(A, B):- foo(A, C), foo(C, B).
% bar(A, B):- mar(A, C), zar(C, B).
% mar(A, B):- me(A, C), my(C, B).
% me([i|W], W).
% my([am|W], W).
% zar(A, B):- blar(A, C), car(C, B).
% blar([a|W], W).
% car([train|W], W).
% wiggle([toot|W], W).
% wiggle(A, B):- wiggle(A, C), wiggle(C, B).

lang --> a,sab,b.
sab --> [].
sab --> a,sab,b.
a --> [a].
b --> [b].

sabb --> [].
sabb --> [a],sabb,[b,b].

even --> [].
even --> [a, a], even.

sabcd --> sbc.
sabcd --> [a], sabcd, [d].
sbc --> [].
sbc --> [b,b], sbc, [c,c].

prop --> [p].
prop --> [q].
prop --> [r].
prop --> [not], prop.
prop --> ['('], prop, op, prop, [')'].
op --> [implies].
op --> [or].
op --> [and].

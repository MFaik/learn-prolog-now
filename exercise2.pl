horizontal(line(X, Y), line(Z, Y)).
vertical(line(X, Y), (X, Z)).

house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
magic(X):-  house_elf(X).
magic(X):-  wizard(X).
magic(X):-  witch(X).

wizard(djvndsjkvnds).

word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun,'big  kahuna  burger').
word(verb,eats).
word(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5):-
     word(determiner,Word1),
     word(noun,Word2),
     word(verb,Word3),
     word(determiner,Word4),
     word(noun,Word5).

word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e).

crossword(V1, V2, V3, H1, H2, H3):-
    dif(V1, V2), dif(V1, V3), dif(V1, H1), dif(V1, H2), dif(V1, H3),
    dif(V2, V3), dif(V2, H1), dif(V2, H2), dif(V2, H3),
    dif(V3, H1), dif(V3, H2), dif(V3, H3),
    dif(H1, H2), dif(H1, H2), dif(H2, H3),
    word(V1, _, V1H1, _, V1H2, _, V1H3, _),
    word(V2, _, V2H1, _, V2H2, _, V2H3, _),
    word(V3, _, V3H1, _, V3H2, _, V3H3, _),
    word(H1, _, V1H1, _, V2H1, _, V3H1, _),
    word(H2, _, V1H2, _, V2H2, _, V3H2, _),
    word(H3, _, V1H3, _, V2H3, _, V3H3, _).

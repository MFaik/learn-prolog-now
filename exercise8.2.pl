:- module(english, [s/3]).

s_single(s(NP, VP)) --> np(subject, P, NP), vp(P, VP).

s(S) --> s_single(S).
s(s(S1, CONJ, S2)) --> s_single(S1), conj(CONJ), s(S2).

np(S_O, P, np(DET, AL, N, PREP)) --> 
    det(P, DET), al(S_O, AL), n(S_O, P, N), prep(PREP).
np(S_O, P, np(PRO)) --> pro(S_O, P, PRO).

al(_, []) --> [].
al(S_O, al(ADJ, AL)) --> adj(S_O, ADJ), al(S_O, AL).

prep([]) --> [].
prep(prep(PRE, NP)) --> pre(PRE), np(object, _, NP).

vp(P, vp(V, NP, PREP)) --> v(P, V), np(object, _, NP), prep(PREP).
vp(P, vp(V, PREP)) --> v(P, V), prep(PREP).

det(P, det(Word)) --> [Word], {lex(Word, det, P)}.
n(S_O, P, n(Word)) --> [Word], {lex(Word, noun, S_O, P)}.
pro(S_O, P, pro(Word)) --> [Word], {lex(Word, pronoun, S_O, P)}.
v(P, v(Word)) --> [Word], {lex(Word, verb, P)}.
conj(conj(Word)) --> [Word], {lex(Word, conj)}.
adj(S_O, adj(Word)) --> [Word], {lex(Word, adj, S_O)}.
pre(pre(Word)) --> [Word], {lex(Word, pre)}.

:- discontiguous lex/2.
:- discontiguous lex/3.

lex(the, det, _).
lex(a, det, single).
lex([], det, plural).

lex(woman, noun, _, single).
lex(women, noun, _, plural).
lex(man, noun, _, single).
lex(men, noun, _, plural).
lex(cow, noun, _, single).
lex(cows, noun, _, single).
lex(apple, noun, object, single).
lex(apples, noun, object, plural).
lex(pear, noun, object, single).
lex(pears, noun, object, plural).
lex(table, noun, object, single).
lex(tables, noun, object, plural).
lex(shower, noun, object, single).
lex(showers, noun, object, plural).
lex(bed, noun, object, single).
lex(beds, noun, object, plural).
lex(chair, noun, object, single).
lex(chairs, noun, object, plural).
lex(future, noun, object, single).
lex(futures, noun, object, plural).

lex(he, pronoun, subject, single).
lex(him, pronoun, object, single).
lex(she, pronoun, subject, single).
lex(her, pronoun, object, single).
lex(it, pronoun, _, single).
lex(i, pronoun, subject, plural).
lex(me, pronoun, object, single).
lex(you, pronoun, _, plural).
lex(we, pronoun, subject, plural).
lex(us, pronoun, object, plural).
lex(they, pronoun, subject, plural).
lex(them, pronoun, object, plural).

lex(eats, verb, single).
lex(eat, verb, plural).
lex(knows, verb, single).
lex(know, verb, plural).
lex(thinks, verb, single).
lex(think, verb, plural).
lex(imagines, verb, single).
lex(imagine, verb, plural).
lex(cries, verb, single).
lex(cry, verb, plural).
lex(sees, verb, single).
lex(see, verb, plural).
lex(sleeps, verb, single).
lex(sleep, verb, plural).

lex(and, conj).
lex(or, conj).
lex(but, conj).
lex(as, conj).
lex(when, conj).

lex(small, adj, _).
lex(big, adj, _).
lex(fat, adj, _).
lex(clean, adj, _).
lex(dirty, adj, _).
lex(frightened, adj, subject).
lex(brave, adj, subject).
lex(smart, adj, subject).
lex(dumb, adj, _).
lex(red, adj, _).
lex(black, adj, _).
lex(white, adj, _).
lex(blue, adj, _).
lex(green, adj, _).
lex(yellow, adj, _).
lex(beautiful, adj, _).
lex(cute, adj, _).
lex(angry, adj, subject).
lex(sad, adj, _).
lex(better, adj, _).
lex(worse, adj, _).
lex(comfortable, adj, _).
lex(naked, adj, _).

lex(under, pre).
lex(over, pre).
lex(behind, pre).
lex(in, pre).
lex(inside, pre).
lex(beneath, pre).
lex(on, pre).

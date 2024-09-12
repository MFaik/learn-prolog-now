:- module(file_op, [read_word/2]).

hogwart_houses:-
    open('hogwarts.houses', write, Stream),
    tab(Stream, 12), write(Stream, gryffindor), nl(Stream),
    write(Stream, hufflepuff), tab(Stream, 8), write(Stream, ravenclaw), nl(Stream),
    tab(Stream, 12), write(Stream, slytherin),
    close(Stream).

get_code_skip_space(InStream, Char):-
    get_code_skip_space(InStream, 32, Char).
get_code_skip_space(InStream, LastChar, Char):-
    LastChar \= -1, \+is_alnum(LastChar),
    get_code(InStream, Temp), !, 
    get_code_skip_space(InStream, Temp, Char).
get_code_skip_space(_, Char, Char):- !.

read_word(InStream,W):-
     get_code_skip_space(InStream, Char),
     check_char_and_read_rest(Char,Chars,InStream),
     atom_codes(W,Chars).

check_char_and_read_rest(X,[],_):- \+is_alnum(X), !.
check_char_and_read_rest(Char,[Char|Chars],InStream):-
     get_code(InStream,NextChar),
     check_char_and_read_rest(NextChar,Chars,InStream). 

:- dynamic word/2.

freq_file(FileName):-
    open(FileName, read, Stream),
    freq_read_until(Stream).

freq_read_until(Stream):-
    \+ at_end_of_stream(Stream),
    read_word(Stream, Word), !,
    ((word(Word, Cnt), !, retract(word(Word, Cnt)));Cnt = 0),
    NewCnt is Cnt+1,
    ((Word = '', !);assert(word(Word, NewCnt))),
    freq_read_until(Stream).
freq_read_until(Stream):-
    at_end_of_stream(Stream).

:- ensure_loaded(['exercise8.2', exercise9]).

%?- test('test.txt').

test_file(F):-
    open(F, read, ReadStream),
    atom_codes(F, Code), atom_codes('.out', OutCode), 
    append(Code, OutCode, WriteFCode), atom_codes(WriteF, WriteFCode),
    open(WriteF, write, WriteStream),
    test_stream(ReadStream, WriteStream),
    close(WriteStream), close(ReadStream).

test_stream(ReadStream, _):-
    at_end_of_stream(ReadStream), !.
test_stream(ReadStream, WriteStream):-
    read_sentence(ReadStream, S),
    test_sentence(WriteStream, S), nl(WriteStream),
    test_stream(ReadStream, WriteStream).

test_sentence(Stream, L):-
    s(T, L, []), pptree(Stream, T), !; 
    write(Stream, 'no').

read_sentence(Stream, S):-
    read_word(Stream, W),
    read_sentence(Stream, W, S).

read_sentence(_, '', []):- !.
read_sentence(_, '.', []):- !.
read_sentence(Stream, W, [W|S]):- 
    read_word(Stream, NewW),
    read_sentence(Stream, NewW, S).

%how we read words is different than how we read words in exercise12
%I didn't want to change the original exercise
%thus the repetition
not_alnum_or_dot(X):-
    \+is_alnum(X), X \= 46. 

get_code_skip_space(InStream, Char):-
    get_code_skip_space(InStream, 32, Char).
get_code_skip_space(InStream, LastChar, Char):-
    LastChar \= -1, not_alnum_or_dot(LastChar),
    get_code(InStream, Temp), !, 
    get_code_skip_space(InStream, Temp, Char).
get_code_skip_space(_, Char, Char):- !.

read_word(InStream,W):-
     get_code_skip_space(InStream, Char),
     check_char_and_read_rest(Char,Chars,InStream),
     atom_codes(W,Chars).

check_char_and_read_rest(X,[],_):- not_alnum_or_dot(X), !.
check_char_and_read_rest(Char,[Char|Chars],InStream):-
     get_code(InStream,NextChar),
     check_char_and_read_rest(NextChar,Chars,InStream). 

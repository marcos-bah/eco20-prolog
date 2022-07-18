% UNIFEI - Universidade Federal de Itajuba
% ECOM11 - Prolog – Lista de Exercícios
% Professor JOAO PAULO REUS RODRIGUES LEITE - joaopaulo@unifei.edu.br
% Trabalho de Implementação – Prolog

% Nome: Marcos Vinicius Barbosa
% Matricula: 2020016324

%Lista de Exercicios
%1)

%facts
parent(carl, john).
parent(mary, john).
parent(john, lisa).
parent(susan, lisa).
parent(joe, carl).
parent(gertie, carl).
parent(joe, allan).
parent(allan, mike).
parent(judith, joe).

male(carl).
male(john).
male(joe).
male(allan).
female(mary).
female(lisa).
female(susan).
female(judith).
female(gertie).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
ancestor(X, Y) :- parent(X, Y); (parent(X, Z), ancestor(Z, Y)).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
spouse(X, Y) :- mother(Y, Z), father(X, Z).
aunt(Y, X) :- sibling(Y, Z), parent(Z, X), Y \= Z, female(Y).
uncle(Y, X) :- sibling(Y, Z), parent(Z, X), Y \= Z, male(Y).
cousin(Z, A) :- sibling(X, Y), parent(Y, A), parent(X, Z), X \= Y.

%2)
fibo(0, 0).
fibo(1, 0).
fibo(2, 1).

fiboSuc(X,Y) :- Y is X-1.
fibonacci(X,Y) :- fibo(X, Y), !; 

(fiboSuc(X,Z), fiboSuc(Z,C), fibonacci(Z,A), fibonacci(C,B), Y is A + B ).

%3)
fatorial(0, 1) :- !.
fatorial(X, Y) :- X > 0,
            Z is X - 1,
            fatorial(Z, A),
            Y is X * A.

%4)
verifica(X, Y) :- X mod Y =:= 0.
verifica(X, Y) :- Y * Y < X, Z is Y + 2, verifica(X, Z).

is_prime(2).
is_prime(3).
is_prime(A) :- integer(A), A > 3, A mod 2 =\= 0, \+verifica(A, 3).

%lists

%5)
insert([], X, [X]) :- !.
insert([Y|Z], X, [Y|A]) :- insert(Z, X, A).

%6)
insertAt([], _, Y, [Y]) :- !.
insertAt(X, 1, Y, [Y|X]) :- !.
insertAt([Z|A], N, Y, [Z|B]) :- N1 is N - 1, insertAt(A, N1, Y, B).

%7)
insertSort(X, [], [X]).
insertSort(X, [Y|Z], [X,Y|Z]) :- X @< Y, !.
insertSort(X, [Y|Z0], [Y|Z]) :- insertSort(X, Z0, Z).

%8)
del(X, [X|Y], Y).
del(X, [Z|Y], [Z|A]) :- del(X, Y, A).

%9)
conc([], X, X).
conc([Y|Z], X, [Y|A]) :- conc(Z, X, A).

inverse([], []).
inverse([Y|Z], L) :- inverse(Z, X), conc(X, [Y], L).

%10)
is_equal([], []).
is_equal([Z|Y], A) :- is_equal(Y, X), del(Z, A, X).

%more

%11)
palindrome([], []).
palindrome(X, Y) :- inverse(X, Y).

%12)
replace_all([], _, _, []) :- !.
replace_all([X|Y], X, Z, [Z|A]) :- !, replace_all(Y, X, Z, A).
replace_all([H1|Y], X, Z, [H1|A]) :- replace_all(Y, X, Z, A).

%13)
sum([], 0) :- !.
sum([X|Y], Z) :- sum(Y, A),
                 Z is A + X.

%end-file
%stable version (8.2.3-1 for Windows 64 Bits)
% -> https://www.swi-prolog.org/download/stable

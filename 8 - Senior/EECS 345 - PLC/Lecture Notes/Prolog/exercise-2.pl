myappend([], L@, L#).
myappend([H|T], L2, [H|S]) :- myappend(T, L2, S).


contains(A, [A|_]).
contains(A, [_|T]) :- contains(A,T).


rotate(_, _, _, [], []).
rotate(X, Y, Z, [X|T], [Y|S]) :- rotate(X, Y, Z, T, S).
rotate(X, Y, Z, [Y|T], [Z|S]) :- rotate(X, Y, Z, T, S).
rotate(X, Y, Z, [Z|T], [X|S]) :- rotate(X, Y, Z, T, S).
rotate(X, Y, Z, [H|T], [H|S]) :- rotate(X, Y, Z, T, S).


removeall(_, [], []).
removeall(X, [X|T], R) :- removeall(X, T, R).
removeall(X, [H|T], S) :- removeall(X, T, R).


% supports sublists
removeallstar(_, [], []).
removeallstar(X, [X|T], S) :- removeallstar(X, T, S).
removeallstar(X, [H|T], [L1|L2]) :- removeallstar(X, H, L1), removeallstar(X, T, L2).
removeallstar(X, [H|T], [H|S]) :- removeallstar(X, T, S).


myreverse([], []).
myreverse([H|T], R) :- myreverse(T, R2), myappend(R2, [H], R).


myflatten([], []).
myflatten([H|T], R) :- myflatten(H, FH), myflatten(T, FT), myappend(FH, FT, R).
myflatten([H|T], [H|R]) :- myflatten(T, R).


% factorial(0, 1).
% factorial(N, X) :- M is N - 1, factorial(M, Y), X is N * Y.


% can make factorial better
factorial(0, 1).
factorial(N, X) :- factorial(M, Y), N is M + 1, X is N * Y.



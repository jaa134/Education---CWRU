% Facts about the Weasley family. A fact ens in a period.

% FACTS
male(ron).
male(fred).
male(george).
male(percy).
male(bill).
male(charlie).
male(arthur).
male(harry).
male(albus).
male(james).

female(ginny).
female(molly).
female(fleur).
female(hermoine).
female(lily).

parentof(arthur, ron).
parentof(arthur, george).
parentof(arthur, fred).
parentof(arthur, percy).
parentof(arthur, ginny).
parentof(arthur, charlie).

parentof(molly, ron).
parentof(molly, george).
parentof(molly, fred).
parentof(molly, percy).
parentof(molly, ginny).
parentof(molly, charlie).

parentof(harry, lily).
parentof(harry, james).
parentof(harry, albus).

parentof(ginny, lily).
parentof(ginny, james).
parentof(ginny, albus).

married(ginny, harry).

% query to see who is the parentof ron
% will search the database in order and find the first match
% if it ends in a question mark it means it didnt finish searching the database
%?- parentof(X, ron).

% A rule in the database is of the form A :- B, C, D.
% translates to B and C and D implies A

grandparentof(X, Y) :- parentof(X,Z), parentof(Z,Y).
% ?- grandparentof(arthur, X).
% X = james ?

sibling(X, Y) :- parentof(Z, X), parentof(Z, Y), X \= Y.



aunt(X, Y) :- parentof(Z,Y), sibling(X,Z), female(X)
aunt(X, Y) :- parentof(Z,Y), sibling(W,Z), married(X,W), female(X)
aunt(X, Y) :- parentof(Z,Y), sibling(W,Z), married(W,X), female(X)

uncle(X, Y) :- parentof(Z,Y), sibling(X,Z), male(X)
uncle(X, Y) :- parentof(Z,Y), sibling(W,Z), married(X,W), male(X)
uncle(X, Y) :- parentof(Z,Y), sibling(W,Z), married(W,X), male(X)
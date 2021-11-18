
% partition(Elements,Ss1, Ss2, Ss3) : - partition the set of elements into 3 subsets
partition([], [], [], []).
partition([H|T], [H|S1], S2, S3) :- partition(T, S1, S2, S3).
partition([H|T], S1, [H|S2], S3) :- partition(T, S1, S2, S3).
partition([H|T], S1, S2, [H|S3]) :- partition(T, S1, S2, S3).

% valid(Room) :- the room has at least 1 and no more than 3 sculptures
valid([_]).
valid([_, _]).
valid([_, _, _]).

% sameroom(A, B, Room1, Room2, Room3) :- return true if A and B are in the same room
contains(A, [A|_]).
contains(A, [_|R]) :- contains(A,R).

sameroom(A, B, R1, _, _) :- contains(A, R1), contains(B, R1).
sameroom(A, B, _, R2, _) :- contains(A, R2), contains(B, R2).
sameroom(A, B, _, _, R3) :- contains(A, R3), contains(B, R3).

notsameroom(A, B, R1, R2, _) :- contains(A, R1), contains(B, R2).
notsameroom(A, B, R1, _, R3) :- contains(A, R1), contains(B, R3).
notsameroom(A, B, R1, R2, _) :- contains(A, R2), contains(B, R1).
notsameroom(A, B, _, R2, R3) :- contains(A, R2), contains(B, R3).
notsameroom(A, B, R1, _, R3) :- contains(A, R3), contains(B, R1).
notsameroom(A, B, _, R2, R3) :- contains(A, R3), contains(B, R2).

limitto(A, B, Room1, Room2, Room3) :- if A and B are both in the room, then they must be the only ones in the room
limitto(A, B, [A,B], _, _).
limitto(A, B, _, [A,B], _).
limitto(A, B, _, _, [A,B]).
limitto(A, B, R1, R2, R3) :- notsameroom(A, B, R1, R2, R3).

exhibit(Statues, Room1, Room2, Room3) :- 
  partition(Statues, Room1, Room2, Room3), 
  valid(Room1), valid(Room2), valid(Room3), 
  sameroom(d, g, Room1, Room2, Room3),
  notsameroom(c, e, Room1, Room2, Room3),
  limitto(e, f, Room1, Room2, Room3).
count(nil, 0).
count(t(nil, _, nil), 1).
count(t(L,_,R), Count):-
  count(L, CountL),
  count(R, CountR),
  Count is CountL+CountR+1.

max(X,Y,Z):-
  X>=Y,
  Z is X.

max(X,Y,Z):-
  Y>X,
  Z is Y.

depth(nil, 0).
depth(t(nil, _, nil), 1).
depth(t(L,_,R), D):-
  depth(L, D1),
  depth(R, D2),
  max(D1,D2, D3),
  D is D3+1.

linearize(nil,[]).
linearize(t(nil,X,nil),[X]).
linearize(t(L,X,R),List):-
  linearize(L, ListL),
  List1 = [X|ListL],
  linearize(R, ListR),
  append(List1, ListR, List).

is_tree(nil).
is_tree(t(nil, X, nil)).
is_tree(t(L,X,R)):-
  is_tree(L),
  is_tree(R).

close_t(nil).
close_t(t(L,X,R)):-
  is_tree(L),
  close_t(L),
  is_tree(R),!,
  close_t(R).
close_t(t(L,X,R)):-
  L = nil,!,
  is_tree(R),!,
  close_t(R).
close_t(t(L,X,R)):-
  is_tree(L),
  close_t(L),
  R = nil.

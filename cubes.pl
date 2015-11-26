cube(1, [c, t, t, s, t, r]).
cube(2, [s, c, t, r, r, s]).
cube(3, [t, s, s, c, c, r]).
cube(4, [c, t, r, s, c, r]).

orientation([6,3,1,2,5,4]).

transform(right, [T, Bo, F, L, Ba, R], [T, Bo, R, F, L, Ba]).
transform(left, [T, Bo, F, L, Ba, R], [T, Bo, L, Ba, R, F]).
transform(clockwise, [T, Bo, F, L, Ba, R], [L, R, F, Bo, Ba, T]).
transform(cclockwise, [T, Bo, F, L, Ba, R], [R, L, F, T, Ba, Bo]).
transform(up, [T, Bo, F, L, Ba, R], [F, Ba, Bo, L, T, R]).
transform(down, [T, Bo, F, L, Ba, R], [Ba, F, T, L, Bo, R]).

is_orientation(A):-orientation(A).
is_orientation(A):-
  transform(_, B, A),
  is_orientation(B).

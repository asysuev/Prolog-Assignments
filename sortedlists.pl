occur(X, [Head|_]):-
  X == Head, !.
occur(X, [Head|Tail]):-
  X>Head,!,
  occur(X, Tail).


occurthree(X, [_,_,C|Tail]):-
  X>C,!,
  occurthree(X, Tail).
occurthree(X, [A,_,_|_]):-
  X==A,!.
occurthree(X, [_,B,_|_]):-
  X==B,!.
occurthree(X, [_,_,C|_]):-
  X==C,!.

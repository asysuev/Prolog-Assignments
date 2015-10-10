eval (tru, tru).
eval (fal, fal).

eval(not(tru), Y) :-
    Y = fal.
eval(not(fal), Y) :-
    Y = tru.

eval(and(tru, tru), Y):-
    Y = tru.
eval(and(tru, fal), Y):-
    Y = fal.
eval(and(fal, tru), Y):-
    Y = fal.
eval(and(fal, fal), Y):-
    Y = fal.

eval(or(tru, tru), Y):-
    Y = tru.
eval(or(tru, fal), Y):-
    Y = tru.
eval(or(fal, tru), Y):-
    Y = tru.
eval(or(fal, fal), Y):-
    Y = fal.

peano_plus(zero,X,X).
peano_plus(s(X),Y,s(Z)) :- 
    peano_plus(X,Y,Z).

min(X, zero, X).
min(s(X), s(Y), Z):-
    min(X, Y, Z).
    
greater_than(s(X), zero).
greater_than(s(Z), s(Y)):-
    greater_than(Z,Y).
    
maximum(X,zero,X).
maximum(zero,s(X),s(X)).
maximum(s(X),s(Y),s(Z)):-
    maximum(X,Y,Z).
    



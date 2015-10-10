split_number(Number, Digit, NewNumber) :-
    Digit is Number mod 10,
    NewNumber is Number//10.

all_even(Number):-
    Number<10,
    _G is Number mod 2,
    _G = 0.
all_even(Number):-
    Number>=10,
    split_number(Number, Digit, NewNumber),
    all_even(Digit),
    all_even(NewNumber).
    
count_even(X,A):-
    X<10,
    _G is X mod 2,
    _G = 0,
    A = 1.
count_even(X,A):-
    X<10,
    _G is X mod 2,
    _G = 1,
    A = 0.    
count_even(X,A):-
    X>10,
    split_number(X, D, NN),
    count_even(D, Z1),
    count_even(NN, Z2),
    A is Z1+Z2.
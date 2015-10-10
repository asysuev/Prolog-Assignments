receive().
receive(X):-
    split_string(X, First_X, Rest_X),
    write(First_X),
    receive(Rest_X).
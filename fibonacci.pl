fib(1, 1).
fib(2, 1).
fib(X, A):-
    Z1 is X-1,
    Z2 is X-2,
    fib(Z1, A1),
    fib(Z2, A2),
    A is A1+A2.
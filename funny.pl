even(N):-
	A is mod(N,2),
	A = 0.
odd(N):-
	A is mod(N,2),
	A = 1.

funny(1):-
	write('I will quit'),nl.
funny(N):-
	write(N), nl,  % <-----
    even(N),
	
	NewN is N / 2,
	funny(NewN).
funny(N):-
    write(N), nl,  % <-----
	odd(N),
	
	N>1,
	NewN is 3 * N + 1,
	funny(NewN).
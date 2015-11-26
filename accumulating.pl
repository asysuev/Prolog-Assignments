reverse(List, Reversed):-
  reverse_acc(List, Reversed, []).

reverse_acc([], Result, Result).
reverse_acc([Head|Tail], Result, Acc):-
  reverse_acc(Tail, Result, [Head|Acc]).

list_length(List, Length):-
  list_length_acc(List, Length, 0).

list_length_acc([], Result, Result).
list_length_acc([_Head|Tail], Result, Acc):-
  Acc1 is Acc + 1,
  list_length_acc(Tail, Result, Acc1).

split(X, [], [], []).
split(X, [Y|Tail], [Y|Small], Big):-
  X>Y, !,
  split(X, Tail, Small, Big).
split(X, [Y|Tail], Small, [Y|Big]):-
  split(X, Tail, Small, Big).

quicksort(List, SortedList):-
  quicksort_acc(List, [], SortedList).

quicksort_acc([], Sorted, Sorted).
quicksort_acc([Head|Tail], Acc, Sorted):-
  split(Head, Tail, Small, Big),
  quicksort_acc(Big, Acc, NewAcc),
  quicksort_acc(Small, [Head|NewAcc], Sorted).

fib(N, Res):-
  fib_acc(1, N, 0, 1, Res).

fib_acc(N, N, _, Result, Result).
fib_acc(Count, N, PreviousFib, CurrentFib, Result):-
  Count<N,
  NextCount is Count +1,
  NextFib is CurrentFib + PreviousFib,
  fib_acc(NextCount, N, CurrentFib, NextFib, Result).

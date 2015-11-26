first(Head, [Head|_]).

last(B, [_,B]).
last(Element, [_|Tail]):-
    last(Element, Tail).

remove(Head, [Head|Tail], Tail).
remove(T, [Head|Tail], NewList):-
    not(Head=T),
    remove(T, Tail, NewList2),
    NewList = [Head|NewList2].

remove_all(_, [], []).
remove_all(T, [Head|Tail], NewList):-
    Head = T,
    remove_all(T, Tail, PNL2),
    NewList = PNL2.
remove_all(T, [Head|Tail], NewList):-
    not(Head = T),
    remove_all(T, Tail, PNL2),
    NewList = [Head|PNL2].

smaller(0, NL, NNL):-
    remove_all(0, NL, NNL).
smaller(N, NL, NNL):-
    remove_all(N, NL, NNL1),
    A is N-1,
    A >= 0,
    smaller(A, NNL1, NNL2),
    NNL = NNL2.

switch_first_two([],[]).
switch_first_two([A], [A]).
switch_first_two([Head|[Head2|Tail]], [Head2|[Head|Tail]]).

switch_every_two([], []).
switch_every_two([A], [A]).
switch_every_two([A|[B|Tail]], NL):-
    switch_every_two(Tail, NL2),
    NL = [B|[A|NL2]].

switch_unsorted([],[]).
switch_unsorted([A],[A]).
switch_unsorted([A|[B|Tail]], NL):-
    A=<B,
    switch_unsorted([B|Tail], NL2),
    NL = [A|NL2].
switch_unsorted([A|[B|Tail]], NL):-
    A>B,
    NL = [B|[A|Tail]].

switch_unsorted_n_times(N, List, NL):-
    N>0,
    switch_unsorted(List, NL1),
    A is N-1,
    switch_unsorted_n_times(A, NL1, NL).
switch_unsorted_n_times(N, List, NL):-
    N=0,
    switch_unsorted(List, NL).

is_sorted([]).
is_sorted([_]).
is_sorted([A|[B|Tail]]):-
    A=<B,
    is_sorted([B|Tail]).

sort2(List, NewList):-
    not(is_sorted(List)),
    switch_unsorted(List, NL1),
    sort2(NL1, NewList).
sort2(List, NewList):-
    is_sorted(List),
    NewList = List.
flatten([], []).
flatten([A], A).
flatten([Head|[H2|Tail]], Res):-
    append(Head,H2, PRes),
    flatten(Tail, PRes2),
    append(PRes, PRes2, Res).

is_list1([]).
is_list1([_|_]).

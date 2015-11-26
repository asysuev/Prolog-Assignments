reacts(vinegar,salt,25).
reacts(salt,water,3).
reacts('brown soap', water, 10).
reacts('pili pili', milk, 7).
reacts(tonic, bailey, 8).
reacts(A,B, N):-
  reacts(B, A, N).

counter([Head|[Head2|Tail]], PRes):-
  reacts(Head, Head2, A),
  counter([Head|Tail], PRes1),
  counter([Head2|Tail], PRes2),
  PRes is A + PRes1 + PRes2.

counter([], 0).
counter([A], 0).
counter([Head|[Head2|Tail]], PRes):-
  not(reacts(Head, Head2, A)),
  A = 0,
  counter([Head|Tail], PRes1),
  counter([Head2|Tail], PRes2),
  PRes is A + PRes1 + PRes2.

advice(A):-
  counter(A, Res),
  Res =< 5,
  write("It doesn't result in irritation").

advice(A):-
    counter(A, Res),
    Res >5,
    Res=<12,
    write("Warning! Minor irritation can occur").

advice(A):-
    counter(A, Res),
    Res >= 13,
    Res =< 20,
    write("Warning! This mixture could result in minor burning wounds.").
advice(A):-
    counter(A, Res),
    Res >= 21,
    Res =< 30,
    write("Warning! This mixture could result in severe burning wounds.").
advice(A):-
  counter(A,Res),
  Res>30,
  write("Warning!!! This mixture could be lethal!!!").

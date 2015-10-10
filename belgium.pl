direct_road(brugge, ghent).
direct_road(ghent, antwerp).
direct_road(ghent, brussels).
direct_road(antwerp, brussels).
direct_road(hasselt, leuven).
direct_road(brussels, leuven).
direct_road(mons, brussels).
direct_road(mons, hamur).
direct_road(namur, liege).
direct_road(bastogne, liege).

reach(X,Y):-
  direct_road(X,Y).
reach(X,Y):-
  direct_road(Y,X).
reach(X,Y):-
  direct_road(X,Z),
  reach(Z,Y).
reach(X,Y):-
  direct_road(Y,Z),
  reach(Z,X).

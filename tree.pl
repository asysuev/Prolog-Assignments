depth(nil, 0).
depth(node(nil, _, nil), 1).
depth(node(L,V,R), H):-
    depth(L, H1),
    depth(R, H2),
    H is max(H1,H2)+1.

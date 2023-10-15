edge(p(1,1), p(2,2)).
edge(p(1,2), p(2,2)).
edge(p(2,2), p(2,3)).
edge(p(2,2), p(3,1)).
edge(p(2,3), p(3,3)).
edge(p(3,1), p(2,1)).
edge(p(2,1), p(2,2)).

dpath(X, Y) :- 
    dpath(X, Y, [X]).

dpath(X, Y, Visited) :-
    edge(X, Y),
    \+ member(Y, Visited).

dpath(X, Y, Visited) :-
    edge(X, Z),
    \+ member(Z, Visited),
    dpath(Z, Y, [Z|Visited]).
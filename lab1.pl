parent(janina, anna). 
parent(edward, anna). 
parent(wilhelmina, andrzej). 
parent(marian, andrzej). 
parent(anna, magdalena). 
parent(andrzej, magdalena). 
parent(anna, tomasz). 
parent(andrzej, tomasz). 
parent(tomasz, zuzanna). 
parent(karolina, zuzanna). 
% mine
parent(janina, karol). 
parent(karol, kinga). 
parent(anna, marta).

male(edward). 
male(marian). 
male(andrzej). 
male(tomasz).
% mine
male(karol).

female(janina). 
female(anna). 
female(wilhelmina). 
female(magdalena). 
female(karolina). 
female(zuzanna). 
% mine:
female(kinga).
female(marta).



mother(Parent, Child) :- 
    parent(Parent, Child), 
    female(Parent). 

father(Parent, Child) :- 
    parent(Parent, Child), 
    male(Parent). 

son(Son, Parent) :- 
    parent(Parent, Son), male(Son). 

child(Child, Parent) :- 
    parent(Parent, Child). 

grandparent(Grandparent, Child) :- 
    parent(Grandparent, Parent), 
    parent(Parent, Child). 

greatgrandparent(Greatgrandparent, Child) :- 
    parent(Greatgrandparent, Grandparent), 
    parent(Grandparent, Parent), 
    parent(Parent, Child). 

granddaughter(Granddaughter, Grandparent) :- 
    parent(Grandparent, Parent), 
    parent(Parent, Granddaughter), 
    female(Granddaughter). 



% my option
sibling(Sibling1, Sibling2) :- 
    parent(Parent, Sibling1), 
    parent(Parent, Sibling2), 
    Sibling1 \= Sibling2.

aunt(Aunt, Child) :- 
    parent(Parent, Child), 
    sibling(Parent, Aunt), 
    \+ male(Aunt).
% setof(Aunt, aunt(Aunt, Child), Aunts). -> shows data without duplicates 

% class option
ancestor(Ancestor, Child) :- 
    parent(Ancestor, Child).

ancestor(Ancestor, Child) :- 
    parent(Parent, Child), 
    ancestor(Ancestor, Parent). 


descendant(Child, Ancestor) :- 
    child(Child, Ancestor).

descendant(Child, Ancestor) :- 
    child(Child, Parent), 
    descendant(Parent, Ancestor).


aunt(Aunt, Parent, Ancestor, Child) :- 
    female(Aunt),
    parent(Parent, Child),
    sibling(Aunt, Parent),
    descendant(Aunt, Ancestor).

partner(Parent1, Parent2) :- 
    parent(Parent1, Child),
    parent(Parent2, Child),
    Parent1 @< Parent2.
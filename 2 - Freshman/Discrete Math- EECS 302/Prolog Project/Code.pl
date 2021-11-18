/*Jacob Alspaw*/
/*jaa134*/
/*EECS 302 Discrete Mathematics*/
/*Carl Entemann*/

/*==========================================*/
/*==========================================*/
/*||                Objects               ||*/
/*||  Structs dictating related objects.  ||*/
/*==========================================*/
/*==========================================*/

/*declaring soups*/
soup(
	black_bean,
	clam_chowder,
	mushroom,
	split_pea,
	veggie_orzo
	 ).

/*declaring entres*/
entre(
	chicken_tandoori,
	fried_steak,
	italian_sausage,
	roasted_pork,
	turkey_burger
	 ).

/*declaring desserts*/
dessert(
	apple_pie,
	bundt_cake,
	cookies,
	cupcakes,
	pudding_parfait
	    ).



/*=========================================*/
/*=========================================*/
/*||                 Rules               ||*/
/*||  A variety of given project rules.  ||*/
/*=========================================*/
/*=========================================*/

/*A test for soups*/
isSoup(S) :-
   S = black_bean;
   S =  clam_chowder;
   S = mushroom;
   S = split_pea;
   S = veggie_orzo.

/*A test for entres*/
isEntre(E) :-
   E = chicken_tandoori;
   E = fried_steak;
   E = italian_sausage;
   E = roasted_pork;
   E = turkey_burger.

/*A test for desserts*/
isDessert(D) :-
   D = apple_pie;
   D = bundt_cake;
   D = cookies;
   D = cupcakes;
   D = pudding_parfait.

/*A general definition of rule 1.*/
/*This rule is too general to apply in individual cases.*/
rule1(S, E, D) :-
   (
      S \== clam_chowder,
      E \== roasted_pork,
      D \== bundt_cake
    );
   (
    (
      (S \== clam_chowder, E \== roasted_pork, D = bundt_cake);
      (S \== clam_chowder, E = roasted_pork, D \== bundt_cake);
      (S = clam_chowder, E \== roasted_pork, D \== bundt_cake)
      ),
      servedTuesday(clam_chowder, _, _),
      servedThursday(_, _, bundt_cake),
      servedMonday(_, roasted_pork, _)
    );
   (
    (
      (S \== clam_chowder, E \== roasted_pork, D = bundt_cake);
      (S \== clam_chowder, E = roasted_pork, D \== bundt_cake);
      (S = clam_chowder, E \== roasted_pork, D \== bundt_cake)
      ),
      servedWednesday(clam_chowder, _, _),
      servedFriday(_, _, bundt_cake),
      servedTuesday(_, roasted_pork, _)
    ).

/*A special test to denote rule 2.*/
rule2(S, E) :-
   (
    S = veggie_orzo,
    E = turkey_burger
    );
   (
    S \== veggie_orzo,
    E \== turkey_burger
    ).

/*A special test to denote rule 3.*/
rule3(S, E1, E2, D) :-
   (
   	S = black_bean,
    E1 \== italian_sausage,
    E2 \== fried_steak,
    D \== pudding_parfait
    );
   (
   	S \== black_bean,
    E1 = italian_sausage,
    E2 \== fried_steak,
    D \== pudding_parfait
   	);
   (
   	S \== black_bean,
    E1 \== italian_sausage,
    E2 = fried_steak,
    D \== pudding_parfait
    );
   (
   	S \== black_bean,
    E1 \== italian_sausage,
    E2 \== fried_steak,
    D = pudding_parfait
    );
   (
   	S \== black_bean,
    E1 \== italian_sausage,
    E2 \== fried_steak,
    D \== pudding_parfait
    ).

/*A special test to denote rule 4.*/
rule4(S, D) :-
   (
    S = mushroom,
    D \== cookies
    );
   (
    S \== mushroom,
    D = cookies
    );
   (
    S \== mushroom,
    D \== cookies
    ).

/*A general definition of rule 5.*/
/*This rule is too general to apply in individual cases.*/
rule5(S, E, D) :-
   (
      S \== clam_chowder,
      E \== italian_sausage,
      D \== pudding_parfait
    );
   (
     (
      (S \== clam_chowder, E \== italian_sausage, D = pudding_parfait);
      (S \== clam_chowder, E = italian_sausage, D \== pudding_parfait);
      (S = clam_chowder, E \== italian_sausage, D \== pudding_parfait)
      ),
      servedMonday(clam_chowder, _, _),
      servedTuesday(_, _, pudding_parfait),
      servedWednesday(_, italian_sausage, _)
    );
   (
     (
      (S \== clam_chowder, E \== italian_sausage, D = pudding_parfait);
      (S \== clam_chowder, E = italian_sausage, D \== pudding_parfait);
      (S = clam_chowder, E \== italian_sausage, D \== pudding_parfait)
      ),
      servedTuesday(clam_chowder, _, _),
      servedWednesday(_, _, pudding_parfait),
      servedThursday(_, italian_sausage, _)
    );
   (
     (
      (S \== clam_chowder, E \== italian_sausage, D = pudding_parfait);
      (S \== clam_chowder, E = italian_sausage, D \== pudding_parfait);
      (S = clam_chowder, E \== italian_sausage, D \== pudding_parfait)
      ),
      servedWednesday(clam_chowder, _, _),
      servedThursday(_, _, pudding_parfait),
      servedFriday(_, italian_sausage, _)
    ).

/*A special test to denote rule 6.*/
rule6(E, D) :-
   (
    E = chicken_tandoori,
    D \== cupcakes
    );
   (
    E \== chicken_tandoori,
    D = cupcakes
    );
   (
    E \== chicken_tandoori,
    D \== cupcakes
    ).

/*Rules Monday must always abide by.*/
ifMonday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== veggie_orzo,
   S \== clam_chowder,
   S \== split_pea,
   E \== turkey_burger,
   E \== italian_sausage,
   D \== bundt_cake,
   D \== pudding_parfait,
   D == apple_pie,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D).

/*Rules Tuesday must always abide by.*/
ifTuesday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== split_pea,
   E \== italian_sausage,
   D \== apple_pie,
   D \== bundt_cake,
   D \== pudding_parfait,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D).

/*Rules Wednesday must always abide by.*/
ifWednesday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== black_bean,
   S \== split_pea,
   E \== fried_steak,
   E \== italian_sausage,
   E \== roasted_pork,
   D \== apple_pie,
   D \== bundt_cake,
   D \== pudding_parfait,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D).

/*Rules Thursday must always abide by.*/
ifThursday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== clam_chowder,
   S \== split_pea, 
   E \== roasted_pork,
   D \== apple_pie,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D).

/*Rules Friday must always abide by.*/
ifFriday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== clam_chowder,
   S = split_pea,
   E \== roasted_pork,
   D \== apple_pie,
   D \== cookies,
   D \== pudding_parfait,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D).







/*==============================================*/
/*==============================================*/
/*||                 Relations                ||*/
/*||  Rules dictating relations between days. ||*/
/*==============================================*/
/*==============================================*/



/*Declaring the rules for Monday*/
servedMonday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== veggie_orzo,
   S \== clam_chowder,
   S \== split_pea,
   E \== turkey_burger,
   E \== italian_sausage,
   D \== bundt_cake,
   D \== pudding_parfait,
   D == apple_pie,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D),
   /*rule 1 simplified for Monday*/
   (
     ( S \== clam_chowder, E \== roasted_pork, D \== bundt_cake );
     (
      (S \== clam_chowder, E = roasted_pork, D \== bundt_cake), 
       ifTuesday(clam_chowder, _, _), 
       ifThursday(_, _, bundt_cake)
       )
    ),
   /*rule 5 simplified for Monday*/
   (
     ( S \== clam_chowder, E \== italian_sausage, D \== pudding_parfait );
     (
      (S = clam_chowder, E \== italian_sausage, D \== pudding_parfait),
       ifTuesday(_, _, pudding_parfait),
       ifWednesday(_, italian_sausage, _)
       )
    ).




/*Declaring the rules for Tuesday*/
servedTuesday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== split_pea,
   S \== mushroom,
   E \== italian_sausage,
   D \== apple_pie,
   D \== bundt_cake,
   D \== pudding_parfait,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D),
   /*rule 1 simplified for Tuesday*/
   (
     ( S \== clam_chowder, E \== roasted_pork, D \== bundt_cake );
     (
      (S = clam_chowder, E \== roasted_pork, D \== bundt_cake),
       ifThursday(_, _, bundt_cake), 
       ifMonday(_, roasted_pork, _)
       );
     (
      (S \== clam_chowder, E = roasted_pork, D \== bundt_cake),
       ifWednesday(clam_chowder, _, _),
       ifFriday(_, _, bundt_cake)
       )
    ),
   /*rule 5 simplified for Tuesday*/
   (
     ( S \== clam_chowder, E \== italian_sausage, D \== pudding_parfait );
     (
      (S = clam_chowder, E \== italian_sausage, D \== pudding_parfait),
       ifWednesday(_, _, pudding_parfait),
       ifThursday(_, italian_sausage, _)
       )
   ).





/*Declaring the rules for Wednesday*/
servedWednesday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== black_bean,
   S \== split_pea,
   E \== fried_steak,
   E \== italian_sausage,
   E \== roasted_pork,
   D \== apple_pie,
   D \== bundt_cake,
   D \== pudding_parfait,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D),
   /*rule 1 simplified for Wednesday*/
   (
     ( S \== clam_chowder, E \== roasted_pork, D \== bundt_cake );
     (
      (S = clam_chowder, E \== roasted_pork, D \== bundt_cake),
       ifFriday(_, _, bundt_cake), 
       ifTuesday(_, roasted_pork, _)
       )
    ),
   /*rule 5 simplified for Wednesday*/
   (
     ( S \== clam_chowder, E \== italian_sausage, D \== pudding_parfait );
     (
      (S = clam_chowder, E \== italian_sausage, D \== pudding_parfait),
       ifFriday(_, italian_sausage, _),
       ifThursday(_, _, pudding_parfait)
       );
     (
      (S \== clam_chowder, E \== italian_sausage, D = pudding_parfait),
       ifTuesday(clam_chowder, _, _),
       ifThursday(_, italian_sausage, _)
       )
    ).





/*Declaring the rules for Thursday*/
servedThursday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== clam_chowder,
   S \== split_pea, 
   E \== roasted_pork,
   D \== apple_pie,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D),
   /*rule 1 simplified for Thursday*/
   (
     ( S \== clam_chowder, E \== roasted_pork, D \== bundt_cake );
     (
      (S \== clam_chowder, E \== roasted_pork, D = bundt_cake),
       ifTuesday(clam_chowder, _, _), 
       ifMonday(_, roasted_pork, _)
       )
    ),
   /*rule 5 simplified for Thursday*/
   (
     ( S \== clam_chowder, E \== italian_sausage, D \== pudding_parfait );
     (
      (S \== clam_chowder, E = italian_sausage, D \== pudding_parfait),
       ifTuesday(clam_chowder, _, _),
       ifWednesday(_, _, pudding_parfait)
       );
     (
      (S \== clam_chowder, E \== italian_sausage, D = pudding_parfait),
       ifWednesday(clam_chowder, _, _),
       ifFriday(_, italian_sausage, _)
       )
   ).





/*Declaring the rules for Friday*/
servedFriday(S, E, D) :-
   isSoup(S),
   isEntre(E),
   isDessert(D),
   S \== clam_chowder,
   S = split_pea,
   E \== roasted_pork,
   D \== apple_pie,
   D \== cookies,
   D \== pudding_parfait,
   rule6(E, D),
   rule2(S, E),
   rule3(S, E, E, D),
   rule4(S, D),
   /*rule 1 simplified for Friday*/
   (
     ( S \== clam_chowder, E \== roasted_pork, D \== bundt_cake );
     (
      (S \== clam_chowder, E \== roasted_pork, D = bundt_cake),
       ifWednesday(clam_chowder, _, _),
       ifTuesday(_, roasted_pork, _)
       )
    ),
   /*rule 5 simplified for Friday*/
   (
     ( S \== clam_chowder, E \== italian_sausage, D \== pudding_parfait );
     (
      (S \== clam_chowder, E = italian_sausage, D \== pudding_parfait),
       ifWednesday(clam_chowder, _, _),
       ifThursday(_, _, pudding_parfait)
       )
   ).



/*==========================================*/
/*==========================================*/
/*||                Solver                ||*/
/*||  A rule that will solve the system.  ||*/
/*==========================================*/
/*==========================================*/

solve(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O) :-
  /*Testing uniqueness to limit possibilities*/
  dif(A,B),
  dif(A,C),
  dif(A,D),
  dif(A,E),
  dif(B,C),
  dif(B,D),
  dif(B,E),
  dif(C,D),
  dif(C,E),
  dif(D,E),
  dif(F,G),
  dif(F,H),
  dif(F,I),
  dif(F,J),
  dif(G,H),
  dif(G,I),
  dif(G,J),
  dif(H,I),
  dif(H,J),
  dif(I,J),
  dif(K,L),
  dif(K,M),
  dif(K,N),
  dif(K,O),
  dif(L,M),
  dif(L,N),
  dif(L,O),
  dif(M,N),
  dif(M,O),
  dif(N,O),
  /*Testing fits for each meal*/
  servedMonday(A, F, K),
  servedTuesday(B, G, L),
  servedWednesday(C, H, M),
  servedThursday(D, I, N),
  servedFriday(E, J, O),
  /*Writing results*/
  write_ln(''),
  write_ln('Monday'),
  write_ln(A),
  write_ln(F), 
  write_ln(K),
  write_ln(''),
  write_ln('Teusday'),
  write_ln(B),
  write_ln(G), 
  write_ln(L),
  write_ln(''),
  write_ln('Wednesday'),
  write_ln(C),
  write_ln(H),
  write_ln(M),
  write_ln(''),
  write_ln('Thursday'),
  write_ln(D),
  write_ln(I), 
  write_ln(N),
  write_ln(''),
  write_ln('Friday'),
  write_ln(E),
  write_ln(J),
  write_ln(O).






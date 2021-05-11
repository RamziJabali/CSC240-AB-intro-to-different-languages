%quest to go to Quick Trip

start_state(quicktrip).

%finite state machine diagram
next_state(quicktrip, a, redbull).
next_state(quicktrip, b, cigarettes).

next_state(redbull, a, fight).
next_state(redbull, b, redbull).
next_state(redbull, c, surprise).

next_state(fight, a, givesup).
next_state(fight, b, lose).
next_state(fight, c, lose).

next_state(surprise, a, run).
next_state(surprise, b, fight).

next_state(cigarettes, a, agree).
next_state(cigarettes, b, disagree).

next_state(agree, a, free).
next_state(agree, b, double).

display_intro:-
write('You are entering QT'),nl,nl.

show_state(cigarettes):-
write('Will you:'),nl, 
    write('(a) Listen to the cashier'),nl,
    write('(b) Tell him to shut it and give you your cigarettes'),nl,
    write('(q) quit the program'),nl,nl.
  
show_state(agree):-
    write('The cashier is happy so he offers you a free beverage of your choice!'),nl, 
    write('(a) a RedBull Energy drink'),nl,
    write('(b) a Monster Energy drink'),nl,
    write('(q) quit the program'),nl,nl.

show_state(disagree):-
    write('Cashier:"Get out of my store, you are banned!"'),nl,
    ending_bad,nl,nl.

show_state(free):-
    write('The cashier goes to get you a free redbull'),nl,
    write('Sees that a nerd has the last redbull, so he takes it from him'),nl,
    write('and gives it to you!'),nl,nl,
    ending_good,nl,nl.

show_state(double):-
    write('You chose the cashiers least favorite drink'),nl,
    write('So he charges you double for it out of hatred for the drink'),nl,
    write('you pay for it and leave!'),nl,nl,
    ending_bad,nl,nl.

show_state(quicktrip):-
		write('You are unsure of what you want...'),nl,
		write('Do you want...'),nl,
		write('(a) a RedBull Energy drink'),nl,
		write('(b) a pack cigarettes'),nl,
		write('(q) quit the program'),nl,nl.

show_state(redbull):-
		write('Will you..'),nl,
		write('(a) Fight the nerd for the last can'),nl,
		write('(b) Explain to the nerd why you deserve the last can'),nl,
		write('(c) Surprise attack the nerd and run'),nl,
		write('(q) quit the program'),nl,nl.

show_state(fight):-
    write('Nerd fights you with Calculus:'),nl,
    write('Nerd: "what is the limit of sin(x) as x approaches 0?"'),nl,
    write('(a) 0'),nl,
    write('(b) 3.78'),nl,
    write('(c) infinity'),nl,
    write('(q) quit the program'),nl,nl.

show_state(givesup):-
     write('You: "HAH I am the best"'),nl,
     write('You take and enjoy the redbull!'),nl,nl,
     ending_good.

show_state(lose):-
     write('nerd: "I am the calculus GOD!"'),nl,
     write('You go home with nothing!'),nl,nl,
     ending_bad.

show_state(surprise):-
      write('What do you do now!:'),nl,
      write('(a) Run to the exit and throw money at cashier'),nl,
      write('(b) Wait patiently for cashier to finish, so you can pay'),nl,
      write('(q) quit program'),nl,nl.

show_state(run):-
      write('You: "Stupid fool! He thought I would be fooled by his trickery"'),nl,
      ending_good,nl,nl.

get_choice(givesup,q).
get_choice(lose,q). 
get_choice(run,q). 
get_choice(disagree, q).
get_choice(free, q).
get_choice(double,q).

show_transition(quicktrip, a):-
		write('You and a nerd both grab the last redbull...'), nl.

show_transition(quicktrip, b):-
		write('The cashier starts giving you advice on why to quick smoking...'), nl.

show_transition(redbull, a):-
    write('The nerd challenges you to a Calculus quiz for the can...'), nl.

show_transition(redbull, b):-
    write('The nerd does not care and wont budge!'), nl, nl.

show_transition(redbull, c):-
    write('You blinded him with magic sand momentarily!'), nl.

show_transition(fight, a):-
    write('nerd: "NO I HAVE LOST!"'), nl.

show_transition(fight, b):-
    write('nerd: "Youre just dumb!"'), nl.

show_transition(fight, c):-
    write('nerd: "Rookie mistake, I win!"'), nl.

show_transition(surprise, a):-
    write('nerd: "THIS IS UNFAIR! I WILL HAVE MY REVENGE"'), nl.

show_transition(surprise, b):-
    write('nerd: "WHAT A FOOL HE WAITED FOR ME TO RECOVER!"'), nl,
    write('You now have to fight him!'),nl,nl.

show_transition(cigarettes, a):-
    write('You: "You have a point, I quit smoking!"'), nl,
    write('Cashier: "WOW, great!"'), nl, 
    write('Cashier: "Pick a beverage of your choice as a reward for quitting!"'),nl,nl.

show_transition(cigarettes, b):-
    write('You: "Man shut up, and get me my cigarettes!"'), nl,nl.

show_transition(agree, a):-
    write('Cashier: "Good choice, let me go grab it for you!"'),nl,nl.

show_transition(agree, b):-
    write('Cashier: "EW, I will charge you double for having poor taste!"'),nl,nl.


ending_good:-
    write('You went home a winner!'),nl,nl.

ending_bad:-
    write('You went home a loser!'),nl,nl.

end:-
    write('The end'),nl,nl.

go:-
		intro,
		start_state(X),
		show_state(X),
		get_choice(X, Y),
    go_to_next_state(X,Y).

intro :-
      display_intro,
      clear_stored_answers,
      asserta(stored_answer(moves,0)).

go_to_next_state(_,q) :-
      stored_answer(moves,Count),
      write( 'You made this many moves...' ),
      write( Count ), nl,
      end,!.

go_to_next_state(S1,Cin) :-
		next_state(S1,Cin,S2),
      show_transition(S1,Cin),
      show_state(S2),
      stored_answer(moves,K),
      OneMoreMove is K + 1,
      retract(stored_answer(moves,_)),
      		asserta(stored_answer(moves,OneMoreMove)),
      get_choice(S2,Cnew),
      go_to_next_state(S2,Cnew).

go_to_next_state(S1,Cin) :-
      \+ next_state(S1,Cin,_),
      show_transition(S1,fail),
      get_choice(S1,Cnew),
      go_to_next_state(S1,Cnew).

get_choice(_,C) :-
    write('Next entry (letter '),
      write('followed by a period )? '),
    read(C).

:- dynamic(stored_answer/2).

clear_stored_answers
    :- retract(stored_answer(_,_)),fail.
clear_stored_answers.

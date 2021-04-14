% Ramzi Eljabali
% Date 04/13/2021
%Changes from the Author:
%BIG NOTICE, DATES OF PEOPLE LISTED HERE THAT ARE CURRENTLY ALIVE
%HAVE BEEN CHANGED FROM 'alive' to 2021. 'alive' CAUSED PROBLEMS
% WITH THE TESTING.
% purpose: Making predicates that test the knowldge base we have

$PREDICATES
%childOf(<son's name>, <parent's name>)
childOf(Son , Parent):-
    parentOf(Parent, Son).

%grandparentOf(<grandparent's name> <grandchild's name>).
grandparentOf(Grandparent, Grandchild):-
    parentOf(Grandparent, Parent),
    parentOf( Parent, Grandchild).

%siblingOf (<sibling's name>, <person's name>).
siblingOf(Sibling, Person):-
    parentOf(Parent, Sibling),
    parentOf(Parent, Person).

%auntOrUncleOf(<auntOrUncle>, <nieceOrNephew>).
auntOrUncleOf(AU, N):-
    siblingOf(AU,Parent),
    parentOf(Parent, N).

%ancestorOf(<ancestor>, <person>).
ancestorOf(Ancestor, Person):-
    parentOf(Ancestor,Person).

ancestorOf(Ancestor, Person):-
    parentOf(Ancestor, X),
    ancestorOf(X, Person).

%descendentOf(<descendent>, <person>).
descendentOf(Descendent, Person):-
    parentOf(Person, Descendent).

descendentOf(Descendent, Person):-
    parentOf(Person, X),
    descendentOf(Descendent, X).

%contemporaryOf(<person>,<contemporary).
contemporaryOf(Person, Contemporary):-
    lifespan(Person, Birth1, Death1),
    lifespan(Contemporary, Birth2, Death2),
    areTheDatesWithinBound(Birth1, Birth2, Death1, Death2).

%areTheyWithinBounds(<date1>, <date2>).
areTheDatesWithinBound(Start1, Start2, End1, End2):-
    End1=< End2,
    Start2 =< End1;
    End2 =< End1,
    Start1 =< End2.

%successorOf(<ruler>, <successor>).
successorOf(Ruler, Successor) :-
    rulerOf(Ruler, Country, Start1, End1),
    rulerOf(Successor, Country, Start2, End2),
    areTheyEqual(End1, Start2).

%compareDates(<date1>, <date2>).
areTheyEqual(Date1, Date2):-
    Date1 =:= Date2.

%KNOWLEDGE BASE
lifespan(abdulaziz_ibn_saud, 1875, 1953).
lifespan(fahad_saud_bin_abdulaziz_al_saud, 1902, 1969).
lifespan(faisal_bin_abdulaziz_al_saud, 1906, 1975).
lifespan(khaled_bin_abdulaziz_al_saud, 1913, 1982).
lifespan(fahd_bin_abdulaziz_al_saud, 1923, 2005).
lifespan(abdullah_bin_abdulaziz_al_saud, 2005, 2015).
lifespan(salman_bin_abdulaziz_al_saud, 1935, 2021).
lifespan(faisal_bin_salman, 1970, 2021).
lifespan(mohammed_bin_salman, 1940, 2021).
lifespan(sultan_bin_salman_al_saud, 1956, 2021).
lifespan(saud_bin_faisal_al_saud, 1940, 2015).
lifespan(khaled_bin_faisal_al_saud, 1940, 2021).
lifespan(mohammed_bin_fahd_al_saud, 1950, 2021).
lifespan(miteb_bin_abdullah_al_saud, 1952, 2021).
lifespan(sultan_bin_abdulaziz_al_saud, 1928, 2011).
lifespan(khaled_bin_sultan_al_saud, 1949, 2021).
lifespan(bandar_bin_sultan_al_Saud, 1949, 2021).
lifespan(mohammed_bin_fahd_al_saud, 1950, 2021).
lifespan(talal_bin_abdulaziz_al_saud, 1931, 2018).
lifespan(alwaleed_bin_talal_al_saud, 1955, 2021).
lifespan(nayef_bin_abdulaziz_al_saud, 1934, 2012).
lifespan(saud_bin_nayef_al_saud, 1956, 2021).
lifespan(mohammed_bin_nayef_al_saud, 1959, 2021).
lifespan(muqrin_bin_abdulaziz_al_saud, 1945, 2012).

rulerOf(abdulaziz_ibn_saud, saudi_arabia, 1932, 1953).
rulerOf(fahad_saud_bin_abdulaziz_al_saud, saudi_arabia, 1953, 1964).
rulerOf(faisal_bin_abdulaziz_al_saud, saudi_arabia, 1964, 1975).
rulerOf(khaled_bin_abdulaziz_al_saud, saudi_arabia, 1975, 1982).
rulerOf(fahd_bin_abdulaziz_al_saud, saudi_arabia, 1982, 2005).
rulerOf(abdullah_bin_abdulaziz_al_saud, saudi_arabia, 1982, 2005).
rulerOf(salman_bin_abdulaziz_al_saud, saudi_arabia, 2015, current).

parentOf(abdulaziz_ibn_saud, fahad_saud_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, faisal_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, khaled_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, fahd_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, abdullah_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, sultan_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, talal_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, nayef_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, salman_bin_abdulaziz_al_saud).
parentOf(abdulaziz_ibn_saud, muqrin_bin_abdulaziz_al_saud).
parentOf(faisal_bin_abdulaziz_al_saud, saud_bin_faisal_al_saud).
parentOf(faisal_bin_abdulaziz_al_saud, khaled_bin_faisal_al_saud).
parentOf(abdullah_bin_abdulaziz_al_saud, miteb_bin_abdullah_al_saud).
parentOf(fahd_bin_abdulaziz_al_saud, mohammed_bin_fahd_al_saud).
parentOf(salman_bin_abdulaziz_al_saud, faisal_bin_salman).
parentOf(salman_bin_abdulaziz_al_saud, mohammed_bin_salman).
parentOf(salman_bin_abdulaziz_al_saud, sultan_bin_salman_al_saud).
parentOf(sultan_bin_abdulaziz_al_saud, khaled_bin_sultan_al_saud).
parentOf(sultan_bin_abdulaziz_al_saud, bandar_bin_sultan_al_Saud).
parentOf(talal_bin_abdulaziz_al_saud, alwaleed_bin_talal_al_saud).
parentOf(nayef_bin_abdulaziz_al_saud, saud_bin_nayef_al_saud).
parentOf(nayef_bin_abdulaziz_al_saud, mohammed_bin_nayef_al_saud).

% main function that is called
electivesAdvisory :-
	write('Designed By:-'),nl,
	write('Name - Shreya Goel \t\t Roll No. - MT20054'),nl, sleep(0.25),
	nl,
	write('Welcome to M.Tech Electives Advisory System IIITD.'),nl, sleep(0.25),
	write('We will guide you the best electives that can be chosen according to your branch and specialisation along with your career you want to pursue.'),nl, sleep(0.25),
	reset_system,nl,
	consult('electives_Advisory_Fact.txt'),
	namedata(Name),
	cgpa(Y),
	start_introduction(Name,Y),nl,nl,
	findElectives,
	form_list(Electives),nl,	write('----------------------------------------------------------------------------------'),nl,nl,
    	write('The possible Electives according to the prerequisites and Career Choice are' ),nl,nl,
   	printElectives(Electives),
	write('Research --- '), findMTP,nl,nl,
	write('Aptitude --- '),findAptitude, nl, nl,
	write('Communication Skills --- '),findCommunication, nl, nl.

% Taking the name and GPA of the student.
start_introduction(Name,Y) :-
	write('Hello '), write(Name), write('!!'), nl,nl,
	Y>=8 -> write('You have a good GPA! Nice.'); write('Try to improve your GPA!').
	
% It clears the stored user progress.
% reset_system must always return true; because retract all can either return true or false
% we fail the first and succeed with the second.
reset_system :-
	retractall(result(_,_)),
	retractall(prereq(_,_)),
	retractall(electives(_)),
	fail.

reset_system.

% Checking the aptitute skills
findAptitude :-
	chooseAptitude(yes),
	write('You are good at aptitude. Keep Practising.').

findAptitude :-
	chooseAptitude(no),
	write('You need to improve aptitude. Try practising from online websites like indiabix or books like RS Agarwal.').

% Checking the communication skills
findCommunication :-
	chooseCommunication(yes),
	write('You are good at Communication. Keep Practising.').

findCommunication :-
	chooseCommunication(no),
	write('You need to improve at Communication. Try some mock interviews.').

% Finding if any MTP/Thesis is ongoing or not.
findMTP :-
	chooseMTP(research_on),
	write('Try to complete your MTP and publish the paper.').

findMTP :-
	chooseMTP(research_no),
	write('Thesis/MTP :- Try to take a MTP/thesis under a professor.').

% -----------------------------------------------------------------------------------
% Choosing the Respective Careers according to Respective Specialisation and Branch.
% -----------------------------------------------------------------------------------
findCareer(ai,E) :-
	chooseBranch(cse),
	chooseSpecialisation(ai,[ai,de,is]),
	chooseCareer(mle, [mle,aida,rs]),
	E = 'Chosen Career: Artificial Intelligence(AI)/Machine Learning(ML) Engineer.'.

findCareer(ai,E) :-
	chooseBranch(cse),
	chooseSpecialisation(ai,[ai,de,is]),
	chooseCareer(aida, [mle,aida,rs]),
	E = 'Chosen Career: Artifical Intelligence Data Analyst.'.

findCareer(ai,E) :-
	chooseBranch(cse),
	chooseSpecialisation(ai,[ai,de,is]),
	chooseCareer(rs, [mle,aida,rs]),
	E = 'Chosen Career: Research/Data Scientist.'.

findCareer(de1,E) :-
	chooseBranch(cse),
	chooseSpecialisation(de,[ai,de,is]),
	chooseCareer(bde, [bde, swd, dba]),
	E = 'Chosen Career: Big Data Engineer.'.

findCareer(de2,E) :-
	chooseBranch(cse),
	chooseSpecialisation(de,[ai,de,is]),
	chooseCareer(swd, [bde, swd, dba]),
	E = 'Chosen Career: Software Developer/ Full Stack Engineer.'.

findCareer(de3,E) :-
	chooseBranch(cse),
	chooseSpecialisation(de,[ai,de,is]),
	chooseCareer(dba, [bde, swd, dba]),
	E = 'Chosen Career: DataBase Administrator.'.

findCareer(is1,E) :-
	chooseBranch(cse),
	chooseSpecialisation(is,[ai,de,is]),
	chooseCareer(sec, [sec,cyber,cryp]),
	E = 'Chosen Career: Security Engineer.'.

findCareer(is2,E) :-
	chooseBranch(cse),
	chooseSpecialisation(is,[ai,de,is]),
	chooseCareer(cyber, [sec,cyber,cryp]),
	E = 'Chosen Career: CyberSecurity Engineer.'.

findCareer(is2,E) :-
	chooseBranch(cse),
	chooseSpecialisation(is,[ai,de,is]),
	chooseCareer(cryp, [sec,cyber,cryp]),
	E = 'Chosen Career: Cryptographer/Cryptanalysis.'.

findCareer(vlsi1,E) :-
	chooseBranch(ece),
	chooseSpecialisation(vlsi,[vlsi, csp]),
	chooseCareer(vlsid, [vlsid,hwd]),
	E = 'Chosen Career: VLSI Design Engineer Head.'.

findCareer(vlsi2,E) :-
	chooseBranch(ece),
	chooseSpecialisation(vlsi,[vlsi, csp]),
	chooseCareer(hwd, [vlsid,hwd]),
	E = 'Chosen Career: Hardware Engineer.'.

findCareer(csp1,E) :-
	chooseBranch(ece),
	chooseSpecialisation(csp,[vlsi, csp]),
	chooseCareer(eee, [eee,cce]),
	E = 'Chosen Career: Electronics and Electrical Engineer.'.

findCareer(csp2,E) :-
	chooseBranch(ece),
	chooseSpecialisation(csp,[vlsi, csp]),
	chooseCareer(cce, [eee,cce]),
	E = 'Chosen Career: Communication Engineer.'.

findCareer(cb,E) :-
	chooseBranch(cb),
	E = 'Chosen Career: Computational Biologist.'.


% --------------------------------------------------------------------------------------------------
% Checking Respective Prerequisite according to career in Respective Specialisation and Branch.
% --------------------------------------------------------------------------------------------------

% -----------------------------------------------------------------------
% Branch - Specialisation
% -----------------------------------------------------------------------
% CSE - Artificial Intelligence
% Careers - Artificial Intelligence(AI)/Machine Learning(ML) Engineer.
%			Artifical Intelligence Data Analyst.
%			Research/Data Scientist.
% ------------------------------------------------------------------------

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(yes),
	know_maths(yes),
	know_dsa(yes),
	know_ada(yes),
	know_la(yes),
	assert(electives(ml)),assert(electives(ai)),assert(electives(sml)),
	assert(electives(dl)),assert(electives(rl)),assert(electives(nlp)),
	assert(electives(ir)),assert(electives(bml)),assert(electives(cv)),
	assert(electives(mas)),assert(electives(pgm)),assert(electives(dmg)),
	write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(yes),
	know_maths(yes),
	know_dsa(yes),
	know_ada(yes),
	assert(electives(ml)),assert(electives(ai)),assert(electives(sml)),
	assert(electives(dl)),assert(electives(rl)),assert(electives(ir)),
	assert(electives(bml)),assert(electives(mas)),assert(electives(pgm)),
	assert(electives(dmg)),write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(yes),
	know_dsa(yes),
	know_ada(yes),
	know_la(yes),
	assert(electives(ai)),assert(electives(sml)),assert(electives(dl)),
	assert(electives(rl)),assert(electives(nlp)), assert(electives(ir)),
	assert(electives(bml)),assert(electives(cv)),assert(electives(mas)),
	assert(electives(pgm)),write(E).
	

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(yes),
	know_maths(yes),
	know_la(yes),
	assert(electives(ml)),assert(electives(sml)),assert(electives(dl)),
	assert(electives(rl)),assert(electives(bml)),assert(electives(cv)),
	assert(electives(mas)),assert(electives(pgm)),assert(electives(dmg)),
	write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(yes),
	know_maths(yes),
	know_dsa(yes),
	assert(electives(ml)),assert(electives(sml)),assert(electives(dl)),
	assert(electives(rl)),assert(electives(bml)),assert(electives(mas)),
	assert(electives(pgm)),assert(electives(dmg)),assert(electives(ai)),
	assert(electives(ir)),write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(yes),
	know_maths(yes),
	assert(electives(ml)),assert(electives(sml)),assert(electives(dl)),
	assert(electives(rl)),assert(electives(bml)),assert(electives(mas)),
	assert(electives(pgm)),assert(electives(dmg)),write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(yes),
	assert(electives(sml)),assert(electives(dl)),assert(electives(rl)),
	assert(electives(bml)),assert(electives(mas)),assert(electives(pgm)),
	write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(no),
	know_maths(yes),
	know_dsa(yes),
	assert(electives(sml)),assert(electives(dl)),assert(electives(rl)),
	assert(electives(bml)),assert(electives(mas)),assert(electives(pgm)),
	assert(electives(ir)),assert(electives(ai)),write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(no),
	know_maths(yes),
	know_dsa(no),
	assert(electives(sml)),assert(electives(dl)),assert(electives(rl)),
	assert(electives(bml)),assert(electives(mas)),assert(electives(pgm)),
	write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(no),
	know_maths(no),
	know_dsa(no),
	assert(electives(sml)),assert(electives(dl)),assert(electives(rl)),
	assert(electives(bml)),assert(electives(mas)),assert(electives(pgm)),
	write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	know_ip(no),
	know_maths(no),
	know_dsa(no),
	assert(electives(sml)),assert(electives(dl)),assert(electives(rl)),
	assert(electives(bml)),assert(electives(mas)),assert(electives(pgm)),
	assert(electives(ir)),assert(electives(ai)),write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(yes),
	assert(electives(rl)),assert(electives(pgm)),assert(electives(bml)),
	assert(electives(pgm)),write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(no),
	know_ip(yes),
	know_maths(yes),
	know_dsa(yes),
	know_la(yes),
	assert(electives(cv)),assert(electives(mas)),assert(electives(ai)),
	write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(no),
	know_ip(no),
	know_maths(yes),
	know_dsa(yes),
	know_la(yes),
	assert(electives(cv)),assert(electives(mas)),assert(electives(ai)),
	write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(no),
	know_ip(no),
	know_maths(no),
	know_dsa(yes),
	know_la(yes),
	assert(electives(cv)),assert(electives(mas)),assert(electives(ai)),
	write(E).

findElectives :-
	findCareer(ai,E),
	know_pands(no),
	know_ip(no),
	know_maths(no),
	know_dsa(no),
	know_la(yes),
	assert(electives(cv)),assert(electives(mas)),write(E).

findElectives :-
	findCareer(ai,E),
	assert(electives(mas)),write(E).

% -----------------------------------------------------------------------
% Branch - Specialisation
% -----------------------------------------------------------------------
% CSE - Data Engineering
% Careers - Big Data Engineer.
%			Software Developer/ Full Stack Engineer.
%			DataBase Administrator.
% ------------------------------------------------------------------------

findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_dsa(yes),
	know_pands(yes),
	know_ip(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(dmg)),
	assert(electives(ml)),assert(electives(ir)),assert(electives(cf)),
	assert(electives(sw)),assert(electives(mln)),assert(electives(isc)),
	assert(electives(nlp)),write(E).


findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_dsa(yes),
	know_pands(yes),
	know_ip(no),
	assert(electives(bda)),assert(electives(dw)),assert(electives(isc)),
	assert(electives(ir)),assert(electives(cf)),assert(electives(sw)),
	assert(electives(isc)),write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_dsa(yes),
	know_pands(no),
	know_ip(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(ml)),
	assert(electives(cf)),assert(electives(sw)),assert(electives(mln)),
	assert(electives(isc)),write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_dsa(yes),
	know_pands(no),
	know_ip(no),
	assert(electives(bda)),assert(electives(dw)),assert(electives(ml)),
	assert(electives(cf)),assert(electives(isc)),write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_dsa(no),
	know_pands(yes),
	know_ip(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(dmg)),
	assert(electives(ml)),assert(electives(cf)),assert(electives(sw)),
	assert(electives(mln)),assert(electives(nlp)),write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_dsa(no),
	know_pands(no),
	know_ip(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(cf)),
	assert(electives(sw)),assert(electives(mln)),assert(electives(nlp)),
	write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_dsa(no),
	know_pands(no),
	know_ip(no),
	assert(electives(bda)),assert(electives(dw)),assert(electives(cf)),
	write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(no),
	know_dsa(yes),
	know_pands(yes),
	know_ip(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(nlp)),
	assert(electives(ml)),assert(electives(ir)),assert(electives(cf)),
	assert(electives(mln)),assert(electives(isc)),write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	know_fdbs(no),
	know_dsa(no),
	know_pands(yes),
	know_ip(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(ml)),
	assert(electives(ir)),assert(electives(cf)),write(E).


findElectives :-
	findCareer(de1,E),
	know_dbms(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(cf)),
	write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(no),
	know_fdbs(yes),
	know_dsa(yes),
	know_pands(yes),
	know_ip(yes),
	assert(electives(dmg)),assert(electives(ir)),assert(electives(ml)),
	assert(electives(cf)),assert(electives(sw)),assert(electives(mln)),
	write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(no),
	know_fdbs(yes),
	know_dsa(yes),
	know_pands(yes),
	know_ip(yes),
	assert(electives(dmg)),assert(electives(ir)),assert(electives(ml)),
	assert(electives(cf)),assert(electives(sw)),assert(electives(mln)),
	write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(no),
	know_fdbs(no),
	know_dsa(yes),
	know_pands(yes),
	know_ip(yes),
	assert(electives(ir)),assert(electives(ml)),assert(electives(cf)),
	assert(electives(mln)),write(E).

findElectives :-
	findCareer(de1,E),
	know_dbms(no),
	know_fdbs(no),
	know_dsa(no),
	know_pands(no),
	assert(electives(cf)), write(E).

findElectives :-
	findCareer(de1,E),
	assert(electives(none)),write(E).

%-------------

findElectives :-
	findCareer(de2,E),
	know_dsa(yes),
	know_dbms(yes),
	know_os(yes),
	know_cn(yes),
	assert(electives(wd)),assert(electives(sql)),assert(electives(mc)),
	assert(electives(grad)),assert(electives(mad)),assert(electives(rand)),
	assert(electives(dscd)), assert(electives(fpp)),write(E).

findElectives :-
	findCareer(de2,E),
	know_dsa(yes),
	know_dbms(yes),
	know_os(yes),
	know_cn(no),
	assert(electives(wd)),assert(electives(sql)),assert(electives(mc)),
	assert(electives(grad)),assert(electives(mad)),assert(electives(rand)),write(E).


findElectives :-
	findCareer(de2,E),
	know_dsa(yes),
	know_dbms(yes),
	know_os(no),
	know_cn(yes),
	assert(electives(wd)),assert(electives(sql)),assert(electives(mc)),
	assert(electives(grad)),assert(electives(mad)),assert(electives(rand)),
	assert(electives(dscd)),write(E).

findElectives :-
	findCareer(de2,E),
	know_dsa(yes),
	know_dbms(yes),
	know_os(no),
	know_cn(no),
	assert(electives(wd)),assert(electives(sql)),assert(electives(mc)),
	assert(electives(grad)),assert(electives(mad)),assert(electives(rand)),write(E).

findElectives :-
	findCareer(de2,E),
	know_dsa(yes),
	know_dbms(no),
	know_os(yes),
	know_cn(yes),
	assert(electives(wd)),assert(electives(mc)),assert(electives(grad)),
	assert(electives(mad)),assert(electives(rand)),assert(electives(dscd)),
	assert(electives(fpp)),write(E).

findElectives :-
	findCareer(de2,E),
	know_dsa(yes),
	know_dbms(no),
	know_os(no),
	know_cn(yes),
	assert(electives(wd)),assert(electives(mc)),assert(electives(dscd)),
	assert(electives(grad)),assert(electives(mad)),assert(electives(rand)),write(E).

findElectives :-
	findCareer(de2,E),
	know_dsa(yes),
	know_dbms(no),
	know_os(no),
	know_cn(no),
	assert(electives(wd)),assert(electives(mc)),assert(electives(grad)),
	assert(electives(mad)),assert(electives(rand)),write(E).

findElectives :-
	findCareer(de2,E),
	know_dsa(no),
	know_dbms(yes),
	know_os(yes),
	know_cn(yes),
	assert(electives(wd)),assert(electives(sql)),assert(electives(mc)),
	assert(electives(dscd)),assert(electives(fpp)),write(E).

findElectives :-
	findCareer(de2,E),
	know_dsa(no),
	know_dbms(no),
	know_os(no),
	know_cn(yes),
	assert(electives(wd)),assert(electives(sql)),assert(electives(mc)),
	assert(electives(dscd)),write(E).

findElectives :-
	findCareer(de2,E),
	assert(electives(none)),write(E).

% --------------

findElectives :-
	findCareer(de3,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_pands(yes),
	know_ip(yes),
	assert(electives(dmg)),assert(electives(dsi)),assert(electives(bda)),
	assert(electives(dw)),assert(electives(cf)),assert(electives(sw)),
	assert(electives(isc)),write(E).


findElectives :-
	findCareer(de3,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_pands(yes),
	know_ip(no),
	assert(electives(dsi)),assert(electives(bda)),assert(electives(dw)),
	assert(electives(cf)),assert(electives(isc)),write(E).

findElectives :-
	findCareer(de3,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_pands(no),
	know_ip(yes),
	assert(electives(dsi)),assert(electives(bda)),assert(electives(dw)),
	assert(electives(cf)),assert(electives(sw)),assert(electives(isc)),write(E).

findElectives :-
	findCareer(de3,E),
	know_dbms(yes),
	know_fdbs(yes),
	know_pands(no),
	know_ip(no),
	assert(electives(dsi)),assert(electives(bda)),assert(electives(dw)),
	assert(electives(cf)),assert(electives(isc)),write(E).

findElectives :-
	findCareer(de3,E),
	know_dbms(yes),
	know_fdbs(no),
	know_pands(yes),
	know_ip(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(cf)),
	assert(electives(isc)),write(E).

findElectives :-
	findCareer(de3,E),
	know_dbms(yes),
	know_fdbs(no),
	know_pands(no),
	know_ip(yes),
	assert(electives(bda)),assert(electives(dw)),assert(electives(cf)),
	assert(electives(isc)),write(E).

findElectives :-
	findCareer(de3,E),
	know_dbms(yes),
	know_fdbs(no),
	know_pands(no),
	know_ip(no),
	assert(electives(bda)),assert(electives(dw)),assert(electives(cf)),
	assert(electives(isc)),write(E).

findElectives :-
	findCareer(de3,E),
	know_dbms(no),
	know_fdbs(yes),
	know_pands(yes),
	know_ip(yes),
	assert(electives(dmg)),assert(electives(dsi)),assert(electives(cf)),
	assert(electives(sw)),write(E).

findElectives :-
	findCareer(de3,E),
	know_dbms(no),
	know_fdbs(no),
	assert(electives(cf)),write(E).

findElectives :-
	findCareer(de3,E),
	assert(electives(none)),write(E).

% -----------------------------------------------------------------------
% Branch - Specialisation
% -----------------------------------------------------------------------
% CSE - Information Security
% Careers - Security Engineer.
%			CyberSecurity Engineer.
%			Cryptographer/Cryptanalysis.
% ------------------------------------------------------------------------

findElectives :-
	findCareer(is1,E),
	know_cn(yes),
	know_c(yes),
	know_ada(yes),
	assert(electives(dscd)),assert(electives(fcs)),assert(electives(ns)),
	assert(electives(nss)),assert(electives(psosm)),assert(electives(eh)),
	assert(electives(isp)),assert(electives(nap)),assert(electives(mc)),
	assert(electives(mocm)),write(E).

findElectives :-
	findCareer(is1,E),
	know_cn(yes),
	know_c(yes),
	know_ada(no),
	assert(electives(fcs)),assert(electives(ns)),assert(electives(nss)),
	assert(electives(psosm)),assert(electives(eh)),assert(electives(isp)),
	assert(electives(nap)),assert(electives(mc)),assert(electives(mocm)),write(E).

findElectives :-
	findCareer(is1,E),
	know_cn(yes),
	know_c(no),
	know_ada(yes),
	assert(electives(dscd)),assert(electives(fcs)),assert(electives(psosm)),
	assert(electives(eh)),assert(electives(isp)),assert(electives(nap)),
	assert(electives(mocm)),write(E).

findElectives :-
	findCareer(is1,E),
	know_cn(yes),
	know_c(no),
	know_ada(no),
	assert(electives(fcs)),assert(electives(psosm)),assert(electives(eh)),
	assert(electives(isp)),assert(electives(nap)),assert(electives(mocm)),
	write(E).

findElectives :-
	findCareer(is1,E),
	know_cn(no),
	know_c(yes),
	know_ada(yes),
	assert(electives(psosm)),assert(electives(eh)),assert(electives(isp)),
	assert(electives(mc)),assert(electives(mocm)),write(E).

findElectives :-
	findCareer(is1,E),
	know_cn(no),
	know_c(no),
	know_ada(yes),
	assert(electives(psosm)),assert(electives(eh)),assert(electives(isp)),
	assert(electives(mocm)),write(E).

findElectives :-
	findCareer(is1,E),
	know_cn(no),
	know_c(no),
	know_ada(no),
	assert(electives(psosm)),assert(electives(eh)),assert(electives(isp)),
	assert(electives(mocm)),write(E).

% ----------------

findElectives :-
	findCareer(is2,E),
	know_dm(yes),
	know_cn(yes),
	assert(electives(tmc)),assert(electives(ac)),assert(electives(eh)),
	assert(electives(isp)),assert(electives(ibc)),assert(electives(dcf)),
	assert(electives(fcs)),assert(electives(tcs)),assert(electives(tcp)),
	write(E).

findElectives :-
	findCareer(is2,E),
	know_dm(yes),
	know_cn(no),
	assert(electives(tmc)),assert(electives(ac)),assert(electives(eh)),
	assert(electives(isp)),assert(electives(ibc)),assert(electives(dcf)),
	assert(electives(tcs)),assert(electives(tcp)),write(E).

findElectives :-
	findCareer(is2,E),
	know_dm(no),
	know_cn(yes),
	assert(electives(tmc)),assert(electives(fcs)),assert(electives(eh)),
	assert(electives(isp)),assert(electives(ibc)),assert(electives(dcf)),
	assert(electives(tcs)),assert(electives(tcp)),write(E).

findElectives :-
	findCareer(is2,E),
	know_dm(no),
	know_cn(no),
	assert(electives(tmc)),assert(electives(eh)),assert(electives(isp)),
	assert(electives(ibc)),assert(electives(dcf)),assert(electives(tcs)),
	assert(electives(tcp)),write(E).

% ------------------------------------------------------------------------
% Branch - Specialisation
% ------------------------------------------------------------------------
% ECE - VLSI & Embedded Systems (VLSI)
% Careers - VLSI Design Engineer Head.
%			Hardware Engineer.
% ------------------------------------------------------------------------

findElectives :-
	findCareer(vlsi1,E),
	know_dc(yes),
	know_cmos(yes),
	know_be(yes),
	know_emfw(yes),
	assert(electives(vlsidf)),assert(electives(ca)),assert(electives(lvacd)),
	assert(electives(mdt)),assert(electives(rfcd)),assert(electives(icf)),
	assert(electives(msd)),assert(electives(dvlsid)),assert(electives(vhlsd)),
	write(E).


findElectives :-
	findCareer(vlsi1,E),
	know_dc(yes),
	know_cmos(yes),
	know_be(yes),
	know_emfw(no),
	assert(electives(vlsidf)),assert(electives(ca)),assert(electives(lvacd)),
	assert(electives(mdt)),assert(electives(icf)),assert(electives(msd)),
	assert(electives(dvlsid)),assert(electives(vhlsd)),write(E).

findElectives :-
	findCareer(vlsi1,E),
	know_dc(yes),
	know_cmos(yes),
	know_be(no),
	know_emfw(yes),
	assert(electives(vlsidf)),assert(electives(ca)),assert(electives(lvacd)),
	assert(electives(rfcd)),assert(electives(icf)),assert(electives(msd)),
	assert(electives(dvlsid)),assert(electives(vhlsd)),write(E).

findElectives :-
	findCareer(vlsi1,E),
	know_dc(yes),
	know_cmos(yes),
	know_be(no),
	know_emfw(no),
	assert(electives(vlsidf)),assert(electives(ca)),assert(electives(lvacd)),
	assert(electives(icf)),assert(electives(msd)),assert(electives(dvlsid)),
	assert(electives(vhlsd)),write(E).

findElectives :-
	findCareer(vlsi1,E),
	know_dc(yes),
	know_cmos(no),
	know_be(yes),
	know_emfw(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(rfcd)),assert(electives(icf)),assert(electives(dvlsid)),
	assert(electives(vhlsd)),write(E).

findElectives :-
	findCareer(vlsi1,E),
	know_dc(yes),
	know_cmos(no),
	know_be(no),
	know_emfw(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(vhlsd)),
	assert(electives(rfcd)),assert(electives(icf)),assert(electives(dvlsid)),
	write(E).

findElectives :-
	findCareer(vlsi1,E),
	know_dc(yes),
	know_cmos(no),
	know_be(no),
	know_emfw(no),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(vhlsd)),
	assert(electives(icf)),assert(electives(dvlsid)),write(E).


findElectives :-
	findCareer(vlsi1,E),
	know_dc(no),
	know_cmos(yes),
	know_be(yes),
	know_emfw(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(rfcd)),
	assert(electives(icf)),assert(electives(msd)),assert(electives(dvlsid)),
	assert(electives(vhlsd)),write(E).

findElectives :-
	findCareer(vlsi1,E),
	know_dc(no),
	know_cmos(no),
	know_be(yes),
	know_emfw(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(rfcd)),
	assert(electives(icf)),assert(electives(dvlsid)),assert(electives(vhlsd)),
	write(E).

findElectives :-
	findCareer(vlsi1,E),
	know_dc(no),
	know_cmos(no),
	know_be(no),
	know_emfw(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(rfcd)),
	assert(electives(icf)),assert(electives(dvlsid)),assert(electives(vhlsd)),
	write(E).

findElectives :-
	findCareer(vlsi1,E),
	know_dc(no),
	know_cmos(no),
	know_be(no),
	know_emfw(no),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(icf)),
	assert(electives(dvlsid)),assert(electives(vhlsd)),write(E).

% ------------

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(yes),
	know_emfw(yes),
	know_ld(yes),
	know_semi(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(ine)),assert(electives(rfcd)),assert(electives(ssd)),
	assert(electives(icf)),assert(electives(dhwd)),write(E).


findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(yes),
	know_emfw(yes),
	know_ld(yes),
	know_semi(no),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(ine)),assert(electives(rfcd)),assert(electives(icf)),
	assert(electives(dhwd)),write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(yes),
	know_emfw(yes),
	know_ld(no),
	know_semi(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(ine)),assert(electives(rfcd)),assert(electives(ssd)),
	assert(electives(icf)),write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(yes),
	know_emfw(yes),
	know_ld(no),
	know_semi(no),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(ine)),assert(electives(rfcd)),assert(electives(icf)),
	write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(yes),
	know_emfw(no),
	know_ld(yes),
	know_semi(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(ine)),assert(electives(ssd)),assert(electives(icf)),
	assert(electives(dhwd)),write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(yes),
	know_emfw(no),
	know_ld(no),
	know_semi(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(ine)),assert(electives(ssd)),assert(electives(icf)),
	write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(yes),
	know_emfw(no),
	know_ld(no),
	know_semi(no),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(ine)),assert(electives(icf)),write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(no),
	know_emfw(yes),
	know_ld(yes),
	know_semi(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(rfcd)),assert(electives(ssd)),assert(electives(icf)),
	assert(electives(dhwd)),write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(no),
	know_emfw(no),
	know_ld(yes),
	know_semi(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(ssd)),assert(electives(icf)),assert(electives(dhwd)),
	write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(no),
	know_emfw(no),
	know_ld(no),
	know_semi(yes),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(rfcd)),assert(electives(ssd)),assert(electives(icf)),
	write(E).

findElectives :-
	findCareer(vlsi2,E),
	know_mosfet(no),
	know_emfw(no),
	know_ld(no),
	know_semi(no),
	assert(electives(ca)),assert(electives(lvacd)),assert(electives(mdt)),
	assert(electives(rfcd)),assert(electives(icf)),assert(electives(dhwd)),
	write(E).

% ------------------------------------------------------------------------
% Branch - Specialisation
% ------------------------------------------------------------------------
% ECE - Communication and Signal Processing (CSP)
% Careers - Electronics and Electrical Engineer.
%			Communication Engineer.
% ------------------------------------------------------------------------

findElectives :-
	findCareer(csp1,E),
	know_pcs(yes),
	know_ss(yes),
	know_fw(yes),
	know_circuit(yes),
	assert(electives(ocs)),assert(electives(dsp)),assert(electives(atn)),
	assert(electives(rs)),assert(electives(ic)),assert(electives(acmoscd)),
	write(E).


findElectives :-
	findCareer(csp1,E),
	know_pcs(yes),
	know_ss(yes),
	know_fw(yes),
	know_circuit(no),
	assert(electives(ocs)),assert(electives(dsp)),assert(electives(atn)),
	assert(electives(rs)),assert(electives(ic)),write(E).


findElectives :-
	findCareer(csp1,E),
	know_pcs(yes),
	know_ss(yes),
	know_fw(no),
	know_circuit(yes),
	assert(electives(ocs)),assert(electives(dsp)),assert(electives(rs)),
	assert(electives(ic)),assert(electives(acmoscd)),write(E).


findElectives :-
	findCareer(csp1,E),
	know_pcs(yes),
	know_ss(yes),
	know_fw(no),
	know_circuit(no),
	assert(electives(ocs)),assert(electives(dsp)),assert(electives(rs)),
	assert(electives(ic)),write(E).


findElectives :-
	findCareer(csp1,E),
	know_pcs(yes),
	know_ss(no),
	know_fw(yes),
	know_circuit(yes),
	assert(electives(ocs)),assert(electives(atn)),assert(electives(rs)),
	assert(electives(ic)),assert(electives(acmoscd)),write(E).

findElectives :-
	findCareer(csp1,E),
	know_pcs(yes),
	know_ss(no),
	know_fw(no),
	know_circuit(yes),
	assert(electives(ocs)),assert(electives(rs)),assert(electives(ic)),
	assert(electives(acmoscd)),write(E).


findElectives :-
	findCareer(csp1,E),
	know_pcs(yes),
	know_ss(no),
	know_fw(no),
	know_circuit(no),
	assert(electives(ocs)),assert(electives(rs)),assert(electives(ic)),
	write(E).

findElectives :-
	findCareer(csp1,E),
	know_pcs(no),
	know_ss(yes),
	know_fw(yes),
	know_circuit(yes),
	assert(electives(dsp)),assert(electives(atn)),assert(electives(rs)),
	assert(electives(ic)),assert(electives(acmoscd)),write(E).

findElectives :-
	findCareer(csp1,E),
	know_pcs(no),
	know_ss(no),
	know_fw(yes),
	know_circuit(yes),
	assert(electives(atn)),assert(electives(rs)),assert(electives(ic)),
	assert(electives(acmoscd)),write(E).

findElectives :-
	findCareer(csp1,E),
	know_pcs(no),
	know_ss(no),
	know_fw(no),
	know_circuit(yes),
	assert(electives(rs)),assert(electives(ic)),assert(electives(acmoscd)),
	write(E).

findElectives :-
	findCareer(csp1,E),
	know_pcs(no),
	know_ss(no),
	know_fw(no),
	know_circuit(no),
	assert(electives(rs)),assert(electives(ic)),write(E).

% -----------------

findElectives :-
	findCareer(csp2,E),
	know_pcs(yes),
	know_cn(yes),
	assert(electives(wsi)),assert(electives(wn)),assert(electives(eo)),
	assert(electives(ocs)),assert(electives(commnet)),assert(electives(wc3g)),
	assert(electives(dcs)),write(E).

findElectives :-
	findCareer(csp2,E),
	know_pcs(yes),
	know_cn(no),
	assert(electives(wsi)),assert(electives(eo)),assert(electives(ocs)),
	assert(electives(commnet)),assert(electives(wc3g)),assert(electives(dcs)),write(E).

findElectives :-
	findCareer(csp2,E),
	know_pcs(no),
	know_cn(yes),
	assert(electives(wn)),assert(electives(eo)),assert(electives(commnet)),write(E).

findElectives :-
	findCareer(csp2,E),
	know_pcs(no),
	know_cn(no),
	assert(electives(eo)),assert(electives(commnet)),write(E).

% ------------------------------------------------------------------------
% Branch - Specialisation
% ------------------------------------------------------------------------
% CB - Computational Biology (CB)
% Careers - Computational Biologist.
% ------------------------------------------------------------------------

findElectives :-
	findCareer(cb,E),
	know_fob(yes),
	know_ada(yes),
	know_imb(yes),
	assert(electives(fmb)),assert(electives(acb)),assert(electives(cbb)),
	assert(electives(mlba)),assert(electives(nb)),assert(electives(bdmh)),
	assert(electives(cgas)),assert(electives(icn)),assert(electives(ssb)),write(E).

findElectives :-
	findCareer(cb,E),
	know_fob(yes),
	know_ada(yes),
	know_imb(no),
	assert(electives(fmb)),assert(electives(acb)),assert(electives(cbb)),
	assert(electives(mlba)),assert(electives(nb)),assert(electives(bdmh)),
	assert(electives(cgas)),assert(electives(icn)),write(E).


findElectives :-
	findCareer(cb,E),
	know_fob(yes),
	know_ada(no),
	know_imb(yes),
	assert(electives(fmb)),assert(electives(cbb)),assert(electives(mlba)),
	assert(electives(nb)),assert(electives(bdmh)),assert(electives(cgas)),
	assert(electives(icn)),assert(electives(ssb)),write(E).

findElectives :-
	findCareer(cb,E),
	know_fob(yes),
	know_ada(no),
	know_imb(no),
	assert(electives(fmb)),assert(electives(cbb)),assert(electives(mlba)),
	assert(electives(nb)),assert(electives(bdmh)),assert(electives(cgas)),
	assert(electives(icn)),write(E).

findElectives :-
	findCareer(cb,E),
	know_fob(no),
	know_ada(yes),
	know_imb(yes),
	assert(electives(acb)),assert(electives(mlba)),assert(electives(bdmh)),
	assert(electives(cgas)),assert(electives(icn)),assert(electives(ssb)),write(E).

findElectives :-
	findCareer(cb,E),
	know_fob(no),
	know_ada(no),
	know_imb(yes),
	assert(electives(mlba)),assert(electives(bdmh)),assert(electives(cgas)),
	assert(electives(icn)),assert(electives(ssb)),write(E).

findElectives :-
	findCareer(cb,E),
	know_fob(no),
	know_ada(no),
	know_imb(no),
	assert(electives(mlba)),assert(electives(bdmh)),assert(electives(cgas)),
	assert(electives(icn)),write(E).


% ------------------------
% Defining Functions
% ------------------------

chooseBranch(Branch) :-
	result(branch,Branch).

chooseBranch(Branch) :-
	\+result(branch,_),
	run(branch, Branch, [cse,ece,cb]).

chooseSpecialisation(Specialisation, _) :-
	result(specialisation, Specialisation).

chooseSpecialisation(Specialisation, List) :-
	\+result(specialisation, _),
	run(specialisation,Specialisation, List).

chooseAptitude(Aptitude) :-
	result(aptitude, Aptitude).

chooseAptitude(Aptitude) :-
	\+result(aptitude, _),
	run(aptitude, Aptitude, [yes,no]).

chooseCommunication(Communication) :-
	result(communication, Communication).

chooseCommunication(Communication) :-
	\+result(communication, _),
	run(communication, Communication, [yes,no]).

chooseCareer(Career, _) :-
	result(career, Career).

chooseCareer(Career, List) :-
	\+result(career, _),
	run(career, Career, List).

chooseMTP(Research) :-
	result(research,Research).

chooseMTP(Research) :-
	\+result(research,_),
	run(research, Research, [research_on,research_no]).

% --------------------------------------------------------------------------------------
% Defining Functions of prerequisites which displays the question and saving responses
% --------------------------------------------------------------------------------------

know_pands(Probab):-
	prereq(pands,Probab).

know_pands(Probab) :-
	\+prereq(pands,_),
	req(pands, Probab, [yes,no]).

know_ip(Ip):-
	prereq(ip,Ip).

know_ip(Ip) :-
	\+prereq(ip,_),
	req(ip, Ip, [yes,no]).

know_maths(Maths):-
	prereq(maths,Maths).

know_maths(Maths) :-
	\+prereq(maths,_),
	req(maths, Maths, [yes,no]).

know_dsa(DSA):-
	prereq(dsa,DSA).

know_dsa(DSA) :-
	\+prereq(dsa,_),
	req(dsa, DSA, [yes,no]).

know_ada(Ada):-
	prereq(ada,Ada).

know_ada(Ada) :-
	\+prereq(ada,_),
	req(ada, Ada, [yes,no]).

know_la(La):-
	prereq(la,La).

know_la(La) :-
	\+prereq(la,_),
	req(la, La, [yes,no]).

know_fdbs(Fdbs):-
	prereq(fdbs,Fdbs).

know_fdbs(Fdbs) :-
	\+prereq(fdbs,_),
	req(fdbs, Fdbs, [yes,no]).

know_dbms(Dbms):-
	prereq(dbms,Dbms).

know_dbms(Dbms) :-
	\+prereq(dbms,_),
	req(dbms, Dbms, [yes,no]).

know_os(Os):-
	prereq(os,Os).

know_os(Os) :-
	\+prereq(os,_),
	req(os, Os, [yes,no]).

know_cn(Cn):-
	prereq(cn,Cn).

know_cn(Cn) :-
	\+prereq(cn,_),
	req(cn, Cn, [yes,no]).

know_dm(Dm):-
	prereq(dm,Dm).

know_dm(Dm) :-
	\+prereq(dm,_),
	req(dm, Dm, [yes,no]).

know_c(C):-
	prereq(c,C).

know_c(C) :-
	\+prereq(c,_),
	req(c, C, [yes,no]).

know_dc(Dc):-
	prereq(dc,Dc).

know_dc(Dc) :-
	\+prereq(dc,_),
	req(dc, Dc, [yes,no]).

know_cmos(Cmos):-
	prereq(cmos,Cmos).

know_cmos(Cmos) :-
	\+prereq(cmos,_),
	req(cmos, Cmos, [yes,no]).

know_be(Be):-
	prereq(be,Be).

know_be(Be) :-
	\+prereq(be,_),
	req(be, Be, [yes,no]).

know_emfw(Emfw):-
	prereq(emfw,Emfw).

know_emfw(Emfw) :-
	\+prereq(emfw,_),
	req(emfw, Emfw, [yes,no]).

know_mosfet(Mosfet):-
	prereq(mosfet,Mosfet).

know_mosfet(Mosfet) :-
	\+prereq(mosfet,_),
	req(mosfet, Mosfet, [yes,no]).

know_ld(Ld):-
	prereq(ld,Ld).

know_ld(Ld) :-
	\+prereq(ld,_),
	req(ld, Ld, [yes,no]).

know_semi(Semi):-
	prereq(semi,Semi).

know_semi(Semi) :-
	\+prereq(semi,_),
	req(semi, Semi, [yes,no]).

know_pcs(Pcs):-
	prereq(pcs,Pcs).

know_pcs(Pcs) :-
	\+prereq(pcs,_),
	req(pcs, Pcs, [yes,no]).

know_ss(Ss):-
	prereq(ss,Ss).

know_ss(Ss) :-
	\+prereq(ss,_),
	req(ss, Ss, [yes,no]).

know_fw(Fw):-
	prereq(fw,Fw).

know_fw(Fw) :-
	\+prereq(fw,_),
	req(fw, Fw, [yes,no]).	

know_circuit(Circuit):-
	prereq(circuit,Circuit).

know_circuit(Circuit) :-
	\+prereq(circuit,_),
	req(circuit, Circuit, [yes,no]).	

know_fob(Fob):-
	prereq(fob,Fob).

know_fob(Fob) :-
	\+prereq(fob,_),
	req(fob, Fob, [yes,no]).	

know_imb(Imb):-
	prereq(imb,Imb).

know_imb(Imb) :-
	\+prereq(imb,_),
	req(imb, Imb, [yes,no]).			

% -----------------------------------------------
% Defining Functions of running above functions
% -----------------------------------------------

% This outputs the choice of the index selected by the student.
% [Head|Tail], Head is the choice and Tail contains the rest choices. 
% Ind tells the index of the choice which is iterated.
findVal(0, [Head|_], Head).
findVal(Ind, [_|Tail], Answer) :-
	Ind > 0,
	NInd is Ind-1,
	findVal(NInd, Tail, Answer).

% This prints the choice(Head) of the Respective Questions asked with the index.
% The head is printed with index and rest list is iterated using Backtracking.
printChoice([],_).
printChoice([Head|Tail], Val) :-
	write(Val),
	write('. '),
	reply(Head),
	NewVal is Val+1,
	printChoice(Tail, NewVal).

% This asks the Questions to the user and saves the response by the user.
run(Query, Reply, Given) :-
	query(Query),nl,
	printChoice(Given,0),
	read(Value),
	findVal(Value, Given, Answer),
	assert(result(Query,Answer)),
	Answer = Reply.

% This asks the prerequisites Questions to the user and saves the response.
req(Query, Reply, Given) :-
	query(Query),nl,
	printChoice(Given,0),
	read(Value),
	findVal(Value, Given, Answer),
	assert(prereq(Query,Answer)),
	Answer = Reply.

% -------------------------------------
% Printing the Electives
% -------------------------------------

form_list([Head|Tail]) :-
	retract(electives(Head)),
	form_list(Tail).

form_list([]).

printElectives([Head|Tail]) :-
	name(Head), write(' :-  '), describe(Head),nl,nl,
	printElectives(Tail).

printElectives([]).

% -------------------------------------
% Questions that are asked
% -------------------------------------

query(branch) :-
	nl,
	write('Enter the index of your branch?').

query(specialisation) :-
	nl,
	write('Enter the index of your specialisation which you are pursuing?').

query(engg_research) :-
	nl,
	write('Are you interested in Engineering or Research Role?').

query(career) :-
	nl,
	write('Enter the index of the career that you want to pursue ahead?').

query(aptitude) :-
	nl,
	write('Are you good at aptitude?').

query(communication) :-
	nl,
	write('Do you have good communication skills?').

query(research) :-
	nl,
	write('Have you done or doing any MTP/thesis?').

query(pands) :-
	nl,
	write('Do you know Probability and Statistics?').

query(ip) :-
	nl,
	write('Do you know Introduction to Programming?').

query(maths) :-
	nl,
	write('Do you know Maths-I and Maths-III?').

query(dsa) :-
	nl,
	write('Do you know Data Structures and Algorithms?').

query(ada) :-
	nl,
	write('Do you know Algorithm Design and Analysis?').

query(la) :-
	nl,
	write('Do you know Linear Algebra?').

query(fdbs) :-
	nl,
	write('Do you know Fundamentals of DataBase System?').

query(dbms) :-
	nl,
	write('Do you know DataBase Management System?').

query(os) :-
	nl,
	write('Do you know Operating Systems?').

query(cn) :-
	nl,
	write('Do you know Computer Networks?').

query(c) :-
	nl,
	write('Do you know C/C++ Programming?').

query(dm) :-
	nl,
	write('Do you know Discrete Mathematics?').

query(dc) :-
	nl,
	write('Do you know Digital Circuits?').

query(cmos) :-
	nl,
	write('Do you know Basics of CMOS?').

query(be) :-
	nl,
	write('Do you know Basic Electronics?').

query(emfw) :-
	nl,
	write('Do you know Foundations of Electromagnetic Fields and Waves?').

query(mosfet) :-
	nl,
	write('Do you have Basic Understanding of P-N Junction and MOSFET?').

query(ld) :-
	nl,
	write('Do you know Logic Designs?').

query(semi) :-
	nl,
	write('Do you have basic knowledge of Semiconductors?').

query(pcs) :-
	nl,
	write('Do you know Principles of Communication Systems?').

query(ss) :-
	nl,
	write('Do you know Signals and Systems?').	

query(fw) :-
	nl,
	write('Do you know Fields and Waves?').

query(circuit) :-
	nl,
	write('Do you know Circuit Analysis?').

query(fob) :-
	nl,
	write('Do you know Foundations of Biology?').

query(imb) :-
	nl,
	write('Do you know Introduction to Mathematical Biology?').

% -----------------------------------------
% Options to the Questions that are asked
% -----------------------------------------

reply(cse) :-
	write('Computer Science and Engineering (CSE)'),
	nl.

reply(ece) :-
	write('Electronics and Communication Engineering (ECE)'),
	nl.

reply(cb) :-
	write('Computational Biology (CB)'),
	nl.

reply(de) :-
	write('Data Engineering (DE)'),
	nl.

reply(ai) :-
	write('Artificial Intelligence (AI)'),
	nl.

reply(is) :-
	write('Information Security (IS)'),
	nl.

reply(csp) :-
	write('Communication and Signal Processing (CSP)'),
	nl.

reply(vlsi) :-
	write('VLSI & Embedded Systems (VLSI)'),
	nl.

reply(yes) :-
	write('Yes'),
	nl.

reply(no) :-
	write('No'),
	nl.

reply(research_no) :-
	write('No, I have not done any MTP/Thesis'),
	nl.

reply(research_on) :-
	write('Yes, I am currently doing/done MTP/Thesis under professor'),
	nl.

reply(mle) :-
	write('Artificial Intelligence(AI)/Machine Learning(ML) Engineer'),
	nl.

reply(aida) :-
	write('Artificial Intelligence Data Analyst'),
	nl.

reply(rs) :-
	write('Research/Data Scientist'),
	nl.

reply(bde) :-
	write('Big Data Engineer'),
	nl.

reply(swd) :-
	write('Software Developer/ Full Stack Engineer'),
	nl.

reply(dba) :-
	write('DataBase Administrator'),
	nl.

reply(sec) :-
	write('Security Engineer'),
	nl.

reply(cyber) :-
	write('CyberSecurity Engineer'),
	nl.

reply(cryp) :-
	write('Cryptographer/Cryptanalysis'),
	nl.	

reply(vlsid) :-
	write('VLSI Design Engineer Head'),
	nl.	

reply(hwd) :-
	write('Hardware Engineer'),
	nl.		

reply(eee) :-
	write('Electronics and Electrical Engineer'),
	nl.		

reply(cce) :-
	write('Communication Engineer'),
	nl.		

% -------------------------------------
% Name of the electives
% -------------------------------------

name(ml) :-
	write('Machine Learning (CSE543)').

name(ai) :-
	write('Artificial Intelligence (CSE643)').

name(sml) :-
	write('Statistical Machine Learning (CSE542)').

name(dl) :-
	write('Deep Learning (CSE641)').

name(rl) :-
	write('Reinforcement Learning (CSE564)').

name(nlp) :-
	write('Natural Language Processing (CSE556)').

name(ir) :-
	write('Information Retrieval (CSE508)').

name(bml) :-
	write('Bayesian Machine Learning (CSE515/ECE551)').

name(cv) :-
	write('Computer Vision (CSE544)').

name(mas) :-
	write('Multi-Agent Systems (CSE531)').

name(pgm) :-
	write('Probabilistic Graphical Models (CSE561)').

name(dmg) :-
	write('Data Mining (CSE506)').

name(bda) :-
	write('Big Data Analytics (CSE510A)').

name(dw) :-
	write('Data Warehousing (CSE606)').

name(cf) :-
	write('Collaborative Filtering (CSE640)').

name(sw) :-
	write('Semantic Web (CSE632)').

name(mln) :-
	write('Mining Large Networks (CSE559)').

name(isc) :-
	write('Introduction to spatial Computing (CSE555)').

name(wd) :-
	write('Web Development (CSE500)').

name(sql) :-
	write('Structured Query Language (CSE567)').

name(mc) :-
	write('Mobile Computing (CSE535)').

name(grad) :-
	write('Introduction to Graduate Algorithms (CSE525)').

name(mad) :-
	write('Modern Algorithm Design (CSE519)').

name(rand) :-
	write('Randomized Algorithms (CSE523)').

name(dscd) :-
	write('Distributed Systems: Concepts & Design (CSE530)').

name(fpp) :-
	write('Foundations of Parallel Programming (CSE502)').

name(dsi) :-
	write('Database System Implementation (CES507)').

name(fcs) :-
	write('Foundations to Computer Security (CSE545)').

name(ns) :-
	write('Network Security (CSE550)').

name(nss) :-
	write('Networks and Systems Security II (CSE554)').

name(psosm) :-
	write('Privacy and Security in Online Social Media (CSE648)').

name(eh) :-
	write('Ethical Hacking (CSE798A)').

name(isp) :-
	write('Internet Security & Privacy (CSE5xx)').

name(nap) :-
	write('Network Protocol Security (CSE649)').

name(mocm) :-
	write('Mobile and Cellular Network Security (CSE647)').

name(tmc) :-
	write('Theory of Modern Cryptography (CSE524)').

name(ac) :-
	write('Applied Cryptography (CSE546)').

name(ibc) :-
	write('Introduction to Blockchain and Cryptocurrency (CSE546)').

name(dcf) :-
	write('Digital and Cyber Forensics (CSE645)').

name(tcs) :-
	write('Topics in Computer Security (CSE694A)').

name(tcp) :-
	write('Topics in Cryptanalysis (CSE793A)').

name(vlsidf) :-
	write('VLSI Design Flow (CSE5xx)').

name(ca) :-
	write('Computer Architecture (CSE649)').

name(lvacd) :-
	write('Low Voltage Analog Circuit Design (ECE520)').

name(mdt) :-
	write('Memory Design and Testing (ECE611)').

name(rfcd) :-
	write('RF Circuit Design (ECE521)').

name(icf) :-
	write('I C Fabrication (ECE522)').

name(msd) :-
	write('Mixed Signal Design (ECE612)').

name(dvlsid) :-
	write('Digital VLSI Design (ECE514)').

name(vhlsd) :-
	write('Verification and High-Level Synthesis of VLSI Designs (ECE793A)').

name(ine) :-
	write('Introduction to Nanoelectronics (ECE517)').

name(ssd) :-
	write('Solid State Devices (ECE318)').

name(dhwd) :-
	write('Digital Hardware Design (ECE510)').

name(ocs) :-
	write('Optical Comunication System (ECE534)').

name(dsp) :-
	write('Digital Signal Processing (ECE351)').

name(atn) :-
	write('Antenna Theory and Design (ECE631)').

name(rs) :-
	write('Radar Systems (ECE632)').

name(ic) :-
	write('Integrated Circuits (ECE522)').

name(acmoscd) :-
	write('Analog CMOS Circuit Design (ECE515)').

name(wsi) :-
	write('Wireless System Implementation (ECE539)').

name(wn) :-
	write('Wireless Network (ECE538)').

name(eo) :-
	write('Engineering optimization (ECE649)').

name(commnet) :-
	write('Communication Networks (ECE636)').

name(wc3g) :-
	write('Wireless Communications: Evolution from 3g to 5g (ECE537)').

name(dcs) :-
	write('Digital Communication Systems (ECE340)').

name(fmb) :-
	write('Foundations of Modern Biology (BIO512)').

name(acb) :-
	write('Algorithms in Computational Biology (BIO522)').

name(cbb) :-
	write('Cell Biology and Biochemistry (BIO511)').

name(mlba) :-
	write('Machine Learning for Biomedical Applications (BIO542)').

name(nb) :-
	write('Network Biology (BIO532)').

name(bdmh) :-
	write('Big Data Mining in Healthcare (BIO543)').

name(cgas) :-
	write('Computational Gastronomy (BIO544)').

name(icn) :-
	write('Introduction to Computational Neuroscience (BIO534)').

name(ssb) :-
	write('Systems and Synthetic Biology (BIO506)').

name(none) :-
	write('No Electives Possible!').

% -------------------------------------
% Description of the electives
% -------------------------------------

describe(ml) :-
	write('This is an introductory course on Machine Learning (ML) that is offered to undergraduate and graduate students. The contents are designed to cover both theoretical and practical aspects of several well-established ML techniques.'),
	nl.

describe(sml) :-
	write('This course will introduce students to salient topics in machine learning and pattern classification. Fundamentals and advanced theoretical and mathematical concepts related to classification techniques and learning paradigms will be discussed.'),
	nl.

describe(ai) :-
	write('This is an introductory course in Artificial Intelligence. This course introduces the students to various search techniques, knowledge representation, reasoning, and learning.'),
	nl.

describe(dl) :-
	write('The objective of this course is to introduce students through some of the latest techniques in deep learning. The focus of the course will be hands on and the students should be able to design intelligent deep learning systems for solving the problems in the area of their interests.'),
	nl.

describe(rl) :-
	write('The course will introduce reinforcement learning. We will consider exact versions of value and policy iteration, followed by approximations based on gradient methods,temporal difference based methods, and last but not least, simulation based methods like Q-learning.'),
	nl.

describe(nlp) :-
	write('This course will cover a broad range of topics related to NLP, including basic text processing (such as tokenization, stemming), language modeling, morphology, syntax, dependency parsing, distributional and lexical Semantics, sense disambiguation,information extraction etc.'),
	nl.

describe(ir) :-
	write('This course will teach basic concepts, tools & techniques in the field of Information Retrieval (IR) & Search. It will cover theoretical foundations, implementation aspects, issues and state-of-the-art in the area of information retrieval, representation, organization, indexing and categorization.'),
	nl.

describe(bml) :-
	write('In this course, we will discuss the foundations of Bayesian statistical modeling in the context of machine learning through various case-studies/running-examples.'),
	nl.

describe(cv) :-
	write('This is an introductory course on Computer Vision offered to undergraduate and graduate students. The goal is to develop understanding of the fundamental concepts in computer vision and enable students to understand and develop applications using existing tools.'),
	nl.

describe(mas) :-
	write('The goal of this course is to provide fundamental understanding of multi-agent systems. We will study different multi-agent system techniques for decision- making. These techniques are general and have wide range of applications like e-commerce, robotics, air-traffic control, etc.'),
	nl.

describe(pgm) :-
	write('This course will introduce the basic concepts of probabilistic graphical models. Graphical Models are a unified framework that allow to express and manipulate complex probability distributions in a compact and efficient way. '),
	nl.

describe(dmg) :-
	write('Data mining aims at finding the useful patterns in large data sets. Interest in the field is motivated by the growth of computerized data collection due to ubiquity of Internet enabled devices. This course will cover a set of techniques designed to be used for finding interesting patterns from the data. '),
	nl.

describe(bda) :-
	write('This course provides an understanding of most popular distributed processing frameworks – Hadoop, Spark and Giraph. Example Applications will include Graph Analysis algorithms such as BFS, Page Rank, Finding Graph Patterns; Finding Similar Items, Mining Algorithms '),
	nl.

describe(dw) :-
	write('Students will be taken over the development life cycle of a data warehouse. The application environment in which a data warehouse is embedded shall be brought out so that the value of the new technology is clearly discernible.'),
	nl.

describe(cf) :-
	write('Recommender systems have around for sometime. But in recent times with the boom of retail online trade recommendation systems and the hype around the NetFlix competition has made recommender systems a major topic in data mining. In this course we will learn about different aspects of recommender systems with particular emphasis on its algorithms.'),
	nl.

describe(sw) :-
	write('In this course, we will be looking at KRR from a Semantic Web perspective. Semantic Web technologies are now widely used by several commercial enterprises (Google, Amazon, LinkedIn, IBM, GE) in the form of Knowledge Graphs (semantic descriptions of entities and their relationships) and ontologies. '),
	nl.

describe(mln) :-
	write('The course will cover recent research on the structure and analysis of such large networks and on models and algorithms that abstract their basic properties.'),
	nl.

describe(isc) :-
	write('This course introduces fundamental ideas underlying geo-spatial science, systems and services. These include spatial concepts and data models, spatial query languages, spatial storage and indexing,query processing and optimization, spatial networks, spatial data mining. '),
	nl.

describe(wd) :-
	write('In this course, we will be looking at all the front end and backend technologies that will play an important role in the website development '),
	nl.

describe(sql) :-
	write('This course is aimed at giving students a background in basic data structures and algorithms along with their impact in solving real life problems using a computer. The major focus will be on covering the basic data structures, b) Algorithm analysis using recurrence relations and c) problem solving using Java.'),
	nl.

describe(mc) :-
	write('The course prepares and trains the students to program mobile devices with understanding on constaints and opportunites thatmobile devices offer. This course will cover challenges in mobile systems. It will also cover latest research in the field of Mobile Computing.'),
	nl.

describe(grad) :-
	write('The course covers topics such as asymptotic notation, recurrence relation, graph algorithms, heaps, dynamic programming, greedy algorithms, divide and conquer, NP-completeness where the UG contents of each topic is first reviewed in a fast-paced manner, and is followed by some advanced content.'),
	nl.

describe(mad) :-
	write('The field of algorithm design has matured and grown in scope over the last sixty years - starting with the basic algorithmic questionsof sorting and searching, to algorithms for problems from various disciplines; so that neary every field of human endeavour is being revolutionized by the algorithmic viewpoint. Students of this course will learn to use these modern tools irrespective of their future field of study or specialization.'),
	nl.

describe(rand) :-
	write('The course will be split into three main logical sections - tools from probability theory, algorithms which are probabilistic and analysis of deterministic algorithms for different input distributions.'),
	nl.

describe(dscd) :-
	write('The course will teach contemporary distributed systems and how we build them. It will also cover the fundamentals of the distributed systems. The course will require and instill system programming skills.'),
	nl.

describe(fpp) :-
	write('This course introduces the fundamentals of parallel programming. It will cover both traditional approaches and new advancements in the area of parallel programming. A key aim of this course is to provide hands-on knowledge on parallel programming by writing parallel programs in different programming models taught in this course.'),
	nl.

describe(dsi) :-
	write('This course covers topics relating to components of a Database System including file structures, access methods, query processing and optimization, transactions, concurrency control, recovery, distributed databases, security and some trend topics (e.g., distributed databases, spatial databases, etc.)'),
	nl.

describe(fcs) :-
	write('This course provides a principled introduction to techniques for defending against hostile adversaries in modern computer systems and computer networks. Topics covered in the course include Threat modeling; ACL mechanism, Access control list; Access Control; Matrix Types of ACL; network security, including cryptography and cryptographic protocols, firewalls, and network denial-of-service attacks and defenses; Crime-ware addressing issues like phishing, malware, social engineering; Auditing; Multilevel and multi-lateral security Information flow control, MAC, MLS; Security protocols.'),
	nl.

describe(ns) :-
	write('The course on Network Security covers essentials of symmetric-key cryptosystems based on block ciphers (such as DES, AES), stream ciphers (such as RC4), public-key cryptosystems based on RSA and ElGamal, key management (including PKI and Certification), message authentication and digital signatures. '),
	nl.

describe(nss) :-
	write('However, a significant volume of the course material focuses largely on hands-on networks and systems security tools, and how to use them to exploit network and system vulnerabilities, besides the traditional system development exercises.'),
	nl.

describe(psosm) :-
	write('The course will focus on the understanding of privacy and security issues on online social media. Privacy and security of online social media need to be investigated, studied and characterized from various perspectives (computational, cultural, psychological, etc.'),
	nl.

describe(eh) :-
	write('This course introduces the fundamentals of ethical hacking. This practice helps to identify security vulnerabilities which can then be resolved before a malicious attacker has the opportunity to exploit them.'),
	nl.

describe(isp) :-
	write('Broadly, the course would cover: Traditional multi-level security models (Bell La-Padula, Biba etc.), access controls, security in traditional computer programs and attacks against them (buffer/heap overflow attacks), defences against such attacks, writing secure programs (Secure Coding), Viruses/Malware and Trojans.'),
	nl.

describe(nap) :-
	write('The course covers Historical network anonymity and privacy protocols – MIXes and MIXnets, various theoretical and practical attack strategies against high and low-latency anonymity networks, practical traffic analysis against modern anonymity systems like Tor, Freenet, GNUnet, JAP, defenses against traffic analysis attacks, performance vs anonymity trade-offs, side-channel attacks, covert channel communications, pseudonymity and privacy, Anonymous P2P communication systems (e.g. Oneswarm), traffic analysis against anonymous VoIP communications.'),
	nl.

describe(mocm) :-
	write('The course prepares and trains the students to program mobile/Cellular devices with understanding on constaints and opportunites that mobile devices offer. This course will cover challenges in mobile systems. It will also cover latest research in the field of Mobile Computing.'),
	nl.

describe(tmc) :-
	write('From this course, we will learn about three basic principles of Modern Cryptography: Principle 1 – Formulation of Exact Definitions, Principle 2 – Reliance on Precise Assumptions, Principle 3 – Rigorous Proofs of Security. It is very important to know how to prove the security of cryptographic systems, because we cannot guarantee any security without security proof. '),
	nl.

describe(ac) :-
	write('In this course on Applied cryptography, we will learn about the Security notions, adversary powers, Perfect security, Stream ciphers, block ciphers, hash functions,Message authentication, Public key cryptography, Some interesting Cryptograhic protocols. '),
	nl.

describe(ibc) :-
	write('From this course, we will learn about basics of blockchains and cryptocurrency. Topics to be covered include how cryptocurrency such as Bitcoin and Ethereum work, blockchain and other decentralized consensus protocols, digital coin mining, security and privacy of cryptocurrencies, scalability, cryptographic techniques for digital currency, and applications of blockchain to smart contracts, and financial exchanges.'),
	nl.

describe(dcf) :-
	write('This course introduces the fundamentals of cyber forensics. This practice helps to identify security vulnerabilities which can then be resolved before a malicious attacker has the opportunity to exploit them.'),
	nl.

describe(tcs) :-
	write('Broadly, the course would cover: hreat modeling; ACL mechanism, Access control list; Access Control; Matrix Types of ACL; network security, including cryptography and cryptographic protocols, firewalls, Traditional multi-level security models (Bell La-Padula, Biba etc.), access controls, security in traditional computer programs and attacks against them (buffer/heap overflow attacks), defences against such attacks, writing secure programs (Secure Coding), Viruses/Malware and Trojans.'),
	nl.

describe(tcp) :-
	write('The course includes topics related to understanding of privacy and security issues on online social media. Privacy and security of online social media need to be investigated, studied and characterized from various perspectives (computational, cultural, psychological, etc.). '),
	nl.

describe(vlsidf) :-
	write('Broadly, the course would cover: Traditional multi-level security models (Bell La-Padula, Biba etc.), access controls, security in traditional computer programs and attacks against them (buffer/heap overflow attacks), defences against such attacks, writing secure programs (Secure Coding), Viruses/Malware and Trojans.'),
	nl.

describe(ca) :-
	write('The course covers Historical network anonymity and privacy protocols – MIXes and MIXnets, various theoretical and practical attack strategies against high and low-latency anonymity networks, practical traffic analysis against modern anonymity systems like Tor, Freenet, GNUnet, JAP, defenses against traffic analysis attacks, performance vs anonymity trade-offs, side-channel attacks, covert channel communications, pseudonymity and privacy, Anonymous P2P communication systems (e.g. Oneswarm), traffic analysis against anonymous VoIP communications.'),
	nl.

describe(lvacd) :-
	write('The course includes  Analog techniques, Digital techniques, Different techniques to reduce the supply voltage and power consumption, Current Conveyor (CC) - Introduction, Characteristics, Circuit implementations, Low voltage CCs Structure, Applications and design techniques'),
	nl.

describe(mdt) :-
	write('This circuit design course brings students face to face with the challenges in designing a Memory Block. The course will introduce the challenges in designing the most commonly used 6T SRAM cell and then the peripheral circuits like sense amplifiers, decoders, write drivers etc. The course then introduces the cache hierarchy. Then the design specificities linked to DRAM design and NVM Design are covered. '),
	nl.

describe(rfcd) :-
	write('This course is designed for exposure to circuits and systems design techniques for radio communications leading towards the recent research in the domain of advanced radio technology. The first half of the course, students will be exposed to the fundamental concepts of passive and active circuits design at radio frequencies.'),
	nl.

describe(icf) :-
	write('In this course fundamental physical and chemical processes will be used to describe and model a range of fabrication processes making up the various silicon integrated circuit technologies.'),
	nl.

describe(msd) :-
	write('This course teaches mixed signal circuits, which are very important bolcks in many modern processors. It covers switched capacitor circuits, comparators, different types of DACs, nyquist and over sampling ADCs.'),
	nl.

describe(dvlsid) :-
	write('This course introduces students to CMOS circuits, develops first-order current-voltage and capacitance-voltage models for transistors, transfer characteristics of CMOS inverter, performance estimation for circuits through logical effort, interconnects, combinational circuit design, circuit families, sequential circuit design including clocking and latching techniques, design of datapath subsystems (adders, shifters, multipliers etc.), design of memory subsystems. A course project using state-of-the-art computer aided design (CAD) tools in VLSI gives students hands-on exposer to the most current technology/process.'),
	nl.

describe(vhlsd) :-
	write('This course introduces students to CMOS circuits, develops first-order current-voltage and capacitance-voltage models for transistors, transfer characteristics of CMOS inverter, performance estimation for circuits through logical effort, interconnects, combinational circuit design'),
	nl.

describe(ine) :-
	write('Nanoelectronics is an interdisciplinary area of research which has a huge potential and is currently attracting a great deal of attention. The objective of this course is to understand the basic principles that govern the operation and electrical characteristics of nanoelectronic devices and become familiar with the recent research being undertaken in nanoelectronics.'),
	nl.

describe(ssd) :-
	write('This course provides fundamental knowledge required for many other courses in Analog, digital and Mixed signal IC design (Analog CMOS Circuit Design, Mixed Signal Design, Low Power Design and Digital VLSI Design). The course starts with an overview of semiconductors and their conduction mechanism'),
	nl.

describe(dhwd) :-
	write('TField programmable gate arrays (FPGAs) are the first choice for implementation of digital systems due to their distributed and parallel architecture. FPGAs also allows complete control over arithmetic'),
	nl.

describe(ocs) :-
	write('The course introduces To introduce students to the fundamental principles of modern fiber-optic communication systems which include components and system design of optical fiber communication and apply these principles to calculate system performance.'),
	nl.

describe(dsp) :-
	write('The objective of this course is to provide a basic introduction to the theory of digital signal processing (DSP). Since students have familiarity with Fourier and Laplace transforms and concepts such as linearity and shift invariance for the description and analysis of linear analog systems, we extend the use of ideas to the field of discrete time systems in this course. Major parts of the course will concentrate on signal analysis '),
	nl.

describe(atn) :-
	write('The course aims to introduce the principles of antenna theory and design as well as wave propagation to senior undergraduate and graduate students who have a background in fundamental electromagnetics. '),
	nl.

describe(rs) :-
	write('The course aims to introduce the principles of radar systems to senior undergraduate and graduate students. The course will combine system perspectives, radar phenomenology concepts such as radar cross-section and clutter.'),
	nl.

describe(ic) :-
	write('	In this course fundamental physical and chemical processes will be used to describe and model a range of fabrication processes making up the various silicon integrated circuit technologies.'),
	nl.

describe(acmoscd) :-
	write('This course introduces the basic analog building blocks and quantifies their performance parameters. More advanced circuits are derived from these basic building blocks. Concepts of feedback and stability are introduced to enable analysis of complex circuits'),
	nl.

describe(wsi) :-
	write('This course will help the students to design and implement a basic wireless communication system. Starting with the large scale propagation models, the students will study the modelling of wireless channel as a linear time varying filter, statistical multipath models and wireless Digital Modulation/ Digital Demodulation techniques. '),
	nl.

describe(wn) :-
	write('This course will cover a variety of mobile systems (wireless LANs, cellular systems, and sensor networks). This course will cover design of various layers in the network stack in the context of wireless communication. This course will cover challenges in mobile systems.'),
	nl.

describe(eo) :-
	write('This course introduces students to engineering optimization with CMOS circuits, develops first-order current-voltage and capacitance-voltage models for transistors, transfer characteristics of CMOS inverter, performance estimation for circuits through logical effort, interconnects, combinational circuit design'),
	nl.

describe(commnet) :-
	write('The course introduces the student to analytical tools that help understand the performance of various aspects of a communications network. We will analyze various aspects of the layer 2 of the OSI model, including automatic repeat request, multiple access, and flow control. We will learn how to apply simple queueing models to analyze the delay and throughput performance of networks.'),
	nl.

describe(wc3g) :-
	write('This course provides development of cellular standards from 3G to 5G, and Wi-Fi standards from IEEE 802.11a to IEEE 802.11ac. This course will introduce students to channel capacity in non-fading and fading channel conditions, multiple access techniques (including multiple antenna systems), cellular system design, and advanced wireless techniques such as Multi-user MIMO, Carrier Bonding/ Aggregation etc.'),
	nl.

describe(dcs) :-
	write('This course will introduce students to the fundamental blocks that constitute a digital communication system. Starting with the analog to digital conversion block, the students will study the functionalities of the blocks such as Digital Modulator/ Digital Demodulator, Channel Encoder-Decoder. The performance of various digital modulation schemes in AWGN channel will also be studied.'),
	nl.

describe(fmb) :-
	write('The aim of this basic core course is to provide students a good background in genetics and molecular biology. The major focus is to a) cover most important concepts in genetics like Mendelian laws, linkage and recombination b) cover molecular mechanisms of gene expression and c) solve qualitative and quantitative problems in population and evolutionary genetics.'),
	nl.

describe(acb) :-
	write('This is an introductory course on algorithms for computational biology. The goal is to make students familiar with the basics of algorithm designing techniques and their application in solving problems of molecular biology. Students will be trained for developing their own algorithms for solving real life biological problems. Hands on training will be given for commonly used softwares for genomic data analysis.'),
	nl.

describe(cbb) :-
	write('The aim of this basic core course is to provide students a decent background in cell biology and biochenmistry. The major focus is to a) cover most important concepts in cell biology like structure and functions of cell, proteins, and signal transduction mechanism b) cover biological thermodynamics, enzyme kinetics and metabolism and finally c) solve qualitative and quantitative problems.'),
	nl.

describe(mlba) :-
	write('This course is designed for students having wide range of background like biology, medical science, pharmacology, bioinformatics, computer science. This course helps in solving biomedical problems using machine learning techniques. This course will be help students in developing novel methods for solving real-life problems '),
	nl.

describe(nb) :-
	write('The objective of this course is to provide introduction to network biology, an emerging interdisciplinary area which aims at graph theoretical modeling of biological complex systems and its applications. The student will be provided with conceptual understanding of complex networks and their application for modeling various biological systems. Through a combination of lectures, exercises, and assignments, the student is expected to achieve understanding of network biology.'),
	nl.

describe(bdmh) :-
	write('There is a exponential growth of data in the field of biological, medical and clinical scineces. Aim of this course is to taught implementation of data mining techniques in healthcare, to solve health-related problems. In this course, students will learn techniques for managing and mining big data. '),
	nl.

describe(cgas) :-
	write('This course is designed to provide an introduction to the emerging science of Computational Gastronomy, a blend of food, data science and computational techniques'),
	nl.

describe(icn) :-
	write('This introductory neuroscience provides basic understanding of neuronal systems and their respective mathematical models that describes the behavior of the neurons under various conditions. The aim of this course is to encourage Computational biology students to diversify into the area of neuroscience. This course in not about neural networks and machine learning, but about the use of the tools of dynamical systems theory to undertand oscillatory properties of single cell neurons'),
	nl.

describe(ssb) :-
	write('This course will introduce students to stochastic simulations as used in solving biological probelms. It will emphasize kinetic Monte Carlo simulations that are able to capture dynamical aspects (such as in cellular phenotype generation), complex details in biological problems (such as spatial heterogeneity) and fluctuation effects. We plan to discuss stochastic modeling of important cellular (as mediated by regulatory networks) and immunological processes and biomedical applications.'),
	nl.

describe(none) :-
	write('No Electives Possible based on the prerequisites and Career Choices. You have to complete many prerequisites first.'),
	nl.

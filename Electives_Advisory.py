import nltk
#nltk.download("stopwords")
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
import re
#from pyswip import Prolog


ps = PorterStemmer()
file = open('electives_Advisory_Fact.txt','w')

#swipl = Prolog()
#swipl.consult("a5_MT20054_ShreyaGoel.pl")

#Entering the name of the user
name = input('Enter Your Name: ')
name = name.lower()
name = re.sub('[^a-z]', ' ', name)
name = word_tokenize(name)
name = name[0]
file.write('namedata({}).\n'.format(name))


#Entering the GPA of the user
gpa = input('Enter your current CGPA: ')
try:
	gpa_data = re.findall('\d\.\d+',gpa)
	gpa_data = float(gpa_data[0])
except:
	gpa_data = float(gpa)
file.write('cgpa({}).\n'.format(gpa_data))


#Asking the student if doing any MTP
mtp_value = input('Are you currently working on any MTP/Thesis? ') 
mtp_value = mtp_value.lower()
mtp_value = re.sub('[^a-z]', ' ', mtp_value)
mtp_value = word_tokenize(mtp_value)
if (('yes' in mtp_value) or ('yeah' in mtp_value) or ('y' in mtp_value) or ('ofcourse' in mtp_value)):
	file.write('result(research,research_on).\n')

elif (('not' not in mtp_value) and ('no' not in mtp_value) and ('n' not in mtp_value) and ('dont' not in mtp_value) and ('don' not in mtp_value) and ('doesn' not in mtp_value) and ('doesnot' not in mtp_value) and ('doesnt' not in mtp_value)):
	file.write('result(research,research_on).\n')

else:
	file.write('result(research,research_no).\n')


#Asking the student if practising Aptitude
aptitude = input('Are you good at aptitude? ') 
aptitude = aptitude.lower()
aptitude = re.sub('[^a-z]', ' ', aptitude)
aptitude = word_tokenize(aptitude)
if (('yes' in aptitude) or ('yeah' in aptitude) or ('y' in aptitude) or ('ofcourse' in aptitude)):
	file.write('result(aptitude,yes).\n')

elif (('not' not in aptitude) and ('no' not in aptitude) and ('n' not in aptitude) and ('dont' not in aptitude) and ('don' not in aptitude) and ('doesn' not in aptitude) and ('doesnot' not in aptitude) and ('doesnt' not in aptitude)):
	file.write('result(aptitude,yes).\n')

else:
	file.write('result(aptitude,no).\n')


#Asking the student if practising Communication Skills
communication = input('Are you good at Communication Skills? ') 
communication = communication.lower()
communication = re.sub('[^a-z]', ' ', communication)
communication = word_tokenize(communication)
if (('yes' in communication) or ('yeah' in communication) or ('y' in communication) or ('ofcourse' in communication)):
	file.write('result(communication,yes).\n')

elif (('not' not in communication) and ('no' not in communication) and ('n' not in communication) and ('dont' not in communication) and ('don' not in communication) and ('doesn' not in communication) and ('doesnot' not in communication) and ('doesnt' not in communication)):
	file.write('result(communication,yes).\n')

else:
	file.write('result(communication,no).\n')


#Input taking the Branch from the Student
while(True):
	branch = input('Enter your M.Tech Branch: ')
	branch = branch.lower()
	branch = re.sub('[^a-z0-9]', ' ', branch)
	branch = word_tokenize(branch)
	branch_name = []
	chosen_branch = ''

	for word in branch:
		branch_name.append(ps.stem(word))

	if ((('comput' in branch_name) and ('biolog' not in branch_name)) or ('inform' in branch_name) or ('cse' in branch_name) or ('scienc' in branch_name) or ('technolog' in branch_name) ):	
		file.write('result(branch,cse).\n')
		chosen_branch = 'cse'
		break

	elif (('electron' in branch_name) or ('electr' in branch_name) or ('commun' in branch_name) or ('ece' in branch_name) or ('eee' in branch_name)):
		file.write('result(branch,ece).\n')
		chosen_branch = 'ece'
		break

	elif (('comput' in branch_name) or ('biolog' in branch_name) or ('cb' in branch_name)):
		file.write('result(branch,cb).\n')
		chosen_branch = 'cb'
		break
	
	else:
		print('The branch you entered is not offered in IIITD.\n')


#Input taking the Specialisation from the Student
while(True) and chosen_branch != 'cb':
	specialisation = input('Enter your M.Tech Branch Specialisation: ')
	specialisation = specialisation.lower()
	specialisation = re.sub('[^a-z0-9]', ' ', specialisation)
	specialisation = word_tokenize(specialisation)
	chosen_specialisation = ''

	if (chosen_branch == 'cse' and (('artificial' in specialisation) or ('intelligence' in specialisation) or ('ai' in specialisation) or ('machine' in specialisation) or ('ml' in specialisation))):
		file.write('result(specialisation, ai).\n')
		chosen_specialisation = 'ai'
		break

	elif (chosen_branch == 'cse' and (('data' in specialisation) or ('engineering' in specialisation) or ('de' in specialisation))):
		file.write('result(specialisation, de).\n')
		chosen_specialisation = 'de'
		break

	elif (chosen_branch == 'cse' and (('information' in specialisation) or ('security' in specialisation) or ('is' in specialisation))):
		file.write('result(specialisation, is).\n')
		chosen_specialisation = 'is'
		break

	elif (chosen_branch == 'ece' and (('vlsi' in specialisation) or ('embedded' in specialisation) or ('systems' in specialisation))):
		file.write('result(specialisation, vlsi).\n')		
		chosen_specialisation = 'vlsi'
		break
		
	elif (chosen_branch == 'ece' and (('csp' in specialisation) or ('communication' in specialisation) or ('signal' in specialisation) or ('processing' in specialisation))):
		file.write('result(specialisation, vlsi).\n')		
		chosen_specialisation = 'csp'
		break

	else:
		print('The specialisation you entered is not offered in IIITD for ypur respective branch.\n')


#Input taking the Career from the Student
while(True) and chosen_branch != 'cb':
	career = input('Enter the Career which you want to pursue ahead: ')
	career = career.lower()
	career = re.sub('[^a-z0-9]', ' ', career)
	career = word_tokenize(career)
	chosen_career = ''

	if ((chosen_specialisation == 'ai') and (('engineer' in career) or ('machine' in career) or ('ml' in career) or ('science' in career))):
		file.write('result(career,mle).\n')
		chosen_career = 'mle'
		break
	
	elif ((chosen_specialisation == 'ai') and (('analyst' in career) or ('da' in career))):
		file.write('result(career,aida).\n')
		chosen_career = 'aida'
		break

	elif ((chosen_specialisation == 'ai') and (('research' in career) or ('researcher' in career) or ('scientist' in career) or ('ds' in career))):
		file.write('result(career,rs).\n')
		chosen_career = 'rs'
		break
	
	elif ((chosen_specialisation == 'de') and (('big' in career) or ('data' in career) or ('bigdata' in career))):
		file.write('result(career,bde).\n')
		chosen_career = 'bde'
		break

	elif ((chosen_specialisation == 'de') and (('software' in career) or ('developer' in career) or ('full' in career) or ('stack' in career) or ('engineer' in career) or ('engineering' in career))):
		file.write('result(career,swd).\n')
		chosen_career = 'swd'
		break
	
	elif ((chosen_specialisation == 'de') and (('database' in career) or ('db' in career) or ('administrator' in career) or ('analyst' in career))):
		file.write('result(career,dba).\n')
		chosen_career = 'dba'
		break
	
	elif ((chosen_specialisation == 'is') and (('cyber' in career))):
		file.write('result(career,cyber).\n')
		chosen_career = 'cyber'
		break

	elif ((chosen_specialisation == 'is') and (('security' in career) or ('engineer' in career) or ('engineering' in career))):
		file.write('result(career,sec).\n')
		chosen_career = 'sec'
		break
	
	elif ((chosen_specialisation == 'is') and (('cryptographer' in career) or ('cryptanalysis' in career) or ('cryptography' in career) or ('crypt' in career))):
		file.write('result(career,cryp).\n')
		chosen_career = 'cryp'
		break
	
	elif ((chosen_specialisation == 'vlsi') and (('vlsi' in career) or ('design' in career) or ('head' in career))):
		file.write('result(career,vlsid).\n')
		chosen_career = 'vlsid'
		break
	
	elif ((chosen_specialisation == 'vlsi') and (('hardware' in career) or ('engineer' in career) or ('engineering' in career) or ('hard' in career))):
		file.write('result(career,hwd).\n')
		chosen_career = 'hwd'
		break

	elif ((chosen_specialisation == 'csp') and (('electronics' in career) or ('electrical' in career) or ('electronic' in career) or ('electric' in career))):
		file.write('result(career,eee).\n')
		chosen_career = 'eee'
		break
	
	elif ((chosen_specialisation == 'csp') and (('communication' in career) or ('engineer' in career) or ('engineering' in career))):
		file.write('result(career,cce).\n')
		chosen_career = 'cce'
		break

	else:
		print('The career you entered is not properly specified.\n')	
		

#Input taking the prerequisites from the Student for the respective career entered

#Computational Biology Careers Prerequisites
if (chosen_branch == 'cb'):

	fob = input('Do you know Foundations of Biology? ')
	fob = fob.lower()
	fob = re.sub('[^a-z]', ' ', fob)
	fob = word_tokenize(fob)
	if (('yes' in fob) or ('yeah' in fob) or ('y' in fob) or ('ofcourse' in fob)):
		file.write('prereq(fob,yes).\n')

	elif (('not' not in fob) and ('no' not in fob) and ('n' not in fob) and ('dont' not in fob) and ('don' not in fob) and ('doesn' not in fob) and ('doesnot' not in fob) and ('doesnt' not in fob)):
		file.write('prereq(fob,yes).\n')

	else:
		file.write('prereq(fob,no).\n')
	

	ada = input('Do you know Algorithm Design and Analysis? ')
	ada = ada.lower()
	ada = re.sub('[^a-z]', ' ', ada)
	ada = word_tokenize(ada)
	if (('yes' in ada) or ('yeah' in ada) or ('y' in ada) or ('ofcourse' in ada)):
		file.write('prereq(ada,yes).\n')

	elif (('not' not in ada) and ('no' not in ada) and ('n' not in ada) and ('dont' not in ada) and ('don' not in ada) and ('doesn' not in ada) and ('doesnot' not in ada) and ('doesnt' not in ada)):
		file.write('prereq(ada,yes).\n')

	else:
		file.write('prereq(ada,no).\n')


	imb = input('Do you know Introduction to Mathematical Biology? ')
	imb = imb.lower()
	imb = re.sub('[^a-z]', ' ', imb)
	imb = word_tokenize(imb)
	if (('yes' in imb) or ('yeah' in imb) or ('y' in imb) or ('ofcourse' in imb)):
		file.write('prereq(imb,yes).\n')

	elif (('not' not in imb) and ('no' not in imb) and ('n' not in imb) and ('dont' not in imb) and ('don' not in imb) and ('doesn' not in imb) and ('doesnot' not in imb) and ('doesnt' not in imb)):
		file.write('prereq(imb,yes).\n')

	else:
		file.write('prereq(imb,no).\n')

#Artificial Intelligence Careers Prerequisites
elif (chosen_specialisation == 'ai'):
	
	pands = input('Do you know Probability and Statistics? ')
	pands = pands.lower()
	pands = re.sub('[^a-z]', ' ', pands)
	pands = word_tokenize(pands)
	if (('yes' in pands) or ('yeah' in pands) or ('y' in pands) or ('ofcourse' in pands)):
		file.write('prereq(pands,yes).\n')

	elif (('not' not in pands) and ('no' not in pands) and ('n' not in pands) and ('dont' not in pands) and ('don' not in pands) and ('doesn' not in pands) and ('doesnot' not in pands) and ('doesnt' not in pands)):
		file.write('prereq(pands,yes).\n')

	else:
		file.write('prereq(pands,no).\n')
	

	ip = input('Do you know Introduction to Programming? ')
	ip = ip.lower()
	ip = re.sub('[^a-z]', ' ', ip)
	ip = word_tokenize(ip)
	if (('yes' in ip) or ('yeah' in ip) or ('y' in ip) or ('ofcourse' in ip)):
		file.write('prereq(ip,yes).\n')

	elif (('not' not in ip) and ('no' not in ip) and ('n' not in ip) and ('dont' not in ip) and ('don' not in ip) and ('doesn' not in ip) and ('doesnot' not in ip) and ('doesnt' not in ip)):
		file.write('prereq(ip,yes).\n')

	else:
		file.write('prereq(ip,no).\n')


	maths = input('Do you know Maths-I and Maths-III? ')
	maths = maths.lower()
	maths = re.sub('[^a-z]', ' ', maths)
	maths = word_tokenize(maths)
	if (('yes' in maths) or ('yeah' in maths) or ('y' in maths) or ('ofcourse' in maths)):
		file.write('prereq(maths,yes).\n')

	elif (('not' not in maths) and ('no' not in maths) and ('n' not in maths) and ('dont' not in maths) and ('don' not in maths) and ('doesn' not in maths) and ('doesnot' not in maths) and ('doesnt' not in maths)):
		file.write('prereq(maths,yes).\n')

	else:
		file.write('prereq(maths,no).\n')

	
	dsa = input('Do you know Data Structures and Algorithms? ')
	dsa = dsa.lower()
	dsa = re.sub('[^a-z]', ' ', dsa)
	dsa = word_tokenize(dsa)
	if (('yes' in dsa) or ('yeah' in dsa) or ('y' in dsa) or ('ofcourse' in dsa)):
		file.write('prereq(dsa,yes).\n')

	elif (('not' not in dsa) and ('no' not in dsa) and ('n' not in dsa) and ('dont' not in dsa) and ('don' not in dsa) and ('doesn' not in dsa) and ('doesnot' not in dsa) and ('doesnt' not in dsa)):
		file.write('prereq(dsa,yes).\n')

	else:
		file.write('prereq(dsa,no).\n')
	

	ada = input('Do you know Algorithm Design and Analysis? ')
	ada = ada.lower()
	ada = re.sub('[^a-z]', ' ', ada)
	ada = word_tokenize(ada)
	if (('yes' in ada) or ('yeah' in ada) or ('y' in ada) or ('ofcourse' in ada)):
		file.write('prereq(ada,yes).\n')

	elif (('not' not in ada) and ('no' not in ada) and ('n' not in ada) and ('dont' not in ada) and ('don' not in ada) and ('doesn' not in ada) and ('doesnot' not in ada) and ('doesnt' not in ada)):
		file.write('prereq(ada,yes).\n')

	else:
		file.write('prereq(ada,no).\n')


	la = input('Do you know Linear Algebra? ')
	la = la.lower()
	la = re.sub('[^a-z]', ' ', la)
	la = word_tokenize(la)
	if (('yes' in la) or ('yeah' in la) or ('y' in la) or ('ofcourse' in la)):
		file.write('prereq(la,yes).\n')

	elif (('not' not in la) and ('no' not in la) and ('n' not in la) and ('dont' not in la) and ('don' not in la) and ('doesn' not in la) and ('doesnot' not in la) and ('doesnt' not in la)):
		file.write('prereq(la,yes).\n')

	else:
		file.write('prereq(la,no).\n')

#Big Data Engineer
elif (chosen_career == 'bde'):

	dbms = input('Do you know DataBase Management System? ')
	dbms = dbms.lower()
	dbms = re.sub('[^a-z]', ' ', dbms)
	dbms = word_tokenize(dbms)
	if (('yes' in dbms) or ('yeah' in dbms) or ('y' in dbms) or ('ofcourse' in dbms)):
		file.write('prereq(dbms,yes).\n')

	elif (('not' not in dbms) and ('no' not in dbms) and ('n' not in dbms) and ('dont' not in dbms) and ('don' not in dbms) and ('doesn' not in dbms) and ('doesnot' not in dbms) and ('doesnt' not in dbms)):
		file.write('prereq(dbms,yes).\n')

	else:
		file.write('prereq(dbms,no).\n')

	
	fdbs = input('Do you know Fundamentals of DataBase System? ')
	fdbs = fdbs.lower()
	fdbs = re.sub('[^a-z]', ' ', fdbs)
	fdbs = word_tokenize(fdbs)
	if (('yes' in fdbs) or ('yeah' in fdbs) or ('y' in fdbs) or ('ofcourse' in fdbs)):
		file.write('prereq(fdbs,yes).\n')

	elif (('not' not in fdbs) and ('no' not in fdbs) and ('n' not in fdbs) and ('dont' not in fdbs) and ('don' not in fdbs) and ('doesn' not in fdbs) and ('doesnot' not in fdbs) and ('doesnt' not in fdbs)):
		file.write('prereq(fdbs,yes).\n')

	else:
		file.write('prereq(fdbs,no).\n')


	dsa = input('Do you know Data Structures and Algorithms? ')
	dsa = dsa.lower()
	dsa = re.sub('[^a-z]', ' ', dsa)
	dsa = word_tokenize(dsa)
	if (('yes' in dsa) or ('yeah' in dsa) or ('y' in dsa) or ('ofcourse' in dsa)):
		file.write('prereq(dsa,yes).\n')

	elif (('not' not in dsa) and ('no' not in dsa) and ('n' not in dsa) and ('dont' not in dsa) and ('don' not in dsa) and ('doesn' not in dsa) and ('doesnot' not in dsa) and ('doesnt' not in dsa)):
		file.write('prereq(dsa,yes).\n')

	else:
		file.write('prereq(dsa,no).\n')


	pands = input('Do you know Probability and Statistics? ')
	pands = pands.lower()
	pands = re.sub('[^a-z]', ' ', pands)
	pands = word_tokenize(pands)
	if (('yes' in pands) or ('yeah' in pands) or ('y' in pands) or ('ofcourse' in pands)):
		file.write('prereq(pands,yes).\n')

	elif (('not' not in pands) and ('no' not in pands) and ('n' not in pands) and ('dont' not in pands) and ('don' not in pands) and ('doesn' not in pands) and ('doesnot' not in pands) and ('doesnt' not in pands)):
		file.write('prereq(pands,yes).\n')

	else:
		file.write('prereq(pands,no).\n')
	

	ip = input('Do you know Introduction to Programming? ')
	ip = ip.lower()
	ip = re.sub('[^a-z]', ' ', ip)
	ip = word_tokenize(ip)
	if (('yes' in ip) or ('yeah' in ip) or ('y' in ip) or ('ofcourse' in ip)):
		file.write('prereq(ip,yes).\n')

	elif (('not' not in ip) and ('no' not in ip) and ('n' not in ip) and ('dont' not in ip) and ('don' not in ip) and ('doesn' not in ip) and ('doesnot' not in ip) and ('doesnt' not in ip)):
		file.write('prereq(ip,yes).\n')

	else:
		file.write('prereq(ip,no).\n')

#Software Developer Career Prerequisites
elif (chosen_career == 'swd'):
	
	dsa = input('Do you know Data Structures and Algorithms? ')
	dsa = dsa.lower()
	dsa = re.sub('[^a-z]', ' ', dsa)
	dsa = word_tokenize(dsa)
	if (('yes' in dsa) or ('yeah' in dsa) or ('y' in dsa) or ('ofcourse' in dsa)):
		file.write('prereq(dsa,yes).\n')

	elif (('not' not in dsa) and ('no' not in dsa) and ('n' not in dsa) and ('dont' not in dsa) and ('don' not in dsa) and ('doesn' not in dsa) and ('doesnot' not in dsa) and ('doesnt' not in dsa)):
		file.write('prereq(dsa,yes).\n')

	else:
		file.write('prereq(dsa,no).\n')


	dbms = input('Do you know DataBase Management System? ')
	dbms = dbms.lower()
	dbms = re.sub('[^a-z]', ' ', dbms)
	dbms = word_tokenize(dbms)
	if (('yes' in dbms) or ('yeah' in dbms) or ('y' in dbms) or ('ofcourse' in dbms)):
		file.write('prereq(dbms,yes).\n')

	elif (('not' not in dbms) and ('no' not in dbms) and ('n' not in dbms) and ('dont' not in dbms) and ('don' not in dbms) and ('doesn' not in dbms) and ('doesnot' not in dbms) and ('doesnt' not in dbms)):
		file.write('prereq(dbms,yes).\n')

	else:
		file.write('prereq(dbms,no).\n')


	os = input('Do you know Operating Systems? ')
	os = os.lower()
	os = re.sub('[^a-z]', ' ', os)
	os = word_tokenize(os)
	if (('yes' in os) or ('yeah' in os) or ('y' in os) or ('ofcourse' in os)):
		file.write('prereq(os,yes).\n')

	elif (('not' not in os) and ('no' not in os) and ('n' not in os) and ('dont' not in os) and ('don' not in os) and ('doesn' not in os) and ('doesnot' not in os) and ('doesnt' not in os)):
		file.write('prereq(os,yes).\n')

	else:
		file.write('prereq(os,no).\n')
	
	
	cn = input('Do you know Computer Networks? ')
	cn = cn.lower()
	cn = re.sub('[^a-z]', ' ', cn)
	cn = word_tokenize(cn)
	if (('yes' in cn) or ('yeah' in cn) or ('y' in cn) or ('ofcourse' in cn)):
		file.write('prereq(cn,yes).\n')

	elif (('not' not in cn) and ('no' not in cn) and ('n' not in cn) and ('dont' not in cn) and ('don' not in cn) and ('doesn' not in cn) and ('doesnot' not in cn) and ('doesnt' not in cn)):
		file.write('prereq(cn,yes).\n')

	else:
		file.write('prereq(cn,no).\n')

#Database Administrator Career Prerequisites
elif (chosen_career == 'dba'):
	
	dbms = input('Do you know DataBase Management System? ')
	dbms = dbms.lower()
	dbms = re.sub('[^a-z]', ' ', dbms)
	dbms = word_tokenize(dbms)
	if (('yes' in dbms) or ('yeah' in dbms) or ('y' in dbms) or ('ofcourse' in dbms)):
		file.write('prereq(dbms,yes).\n')

	elif (('not' not in dbms) and ('no' not in dbms) and ('n' not in dbms) and ('dont' not in dbms) and ('don' not in dbms) and ('doesn' not in dbms) and ('doesnot' not in dbms) and ('doesnt' not in dbms)):
		file.write('prereq(dbms,yes).\n')

	else:
		file.write('prereq(dbms,no).\n')

	
	fdbs = input('Do you know Fundamentals of DataBase System? ')
	fdbs = fdbs.lower()
	fdbs = re.sub('[^a-z]', ' ', fdbs)
	fdbs = word_tokenize(fdbs)
	if (('yes' in fdbs) or ('yeah' in fdbs) or ('y' in fdbs) or ('ofcourse' in fdbs)):
		file.write('prereq(fdbs,yes).\n')

	elif (('not' not in fdbs) and ('no' not in fdbs) and ('n' not in fdbs) and ('dont' not in fdbs) and ('don' not in fdbs) and ('doesn' not in fdbs) and ('doesnot' not in fdbs) and ('doesnt' not in fdbs)):
		file.write('prereq(fdbs,yes).\n')

	else:
		file.write('prereq(fdbs,no).\n')

	
	pands = input('Do you know Probability and Statistics? ')
	pands = pands.lower()
	pands = re.sub('[^a-z]', ' ', pands)
	pands = word_tokenize(pands)
	if (('yes' in pands) or ('yeah' in pands) or ('y' in pands) or ('ofcourse' in pands)):
		file.write('prereq(pands,yes).\n')

	elif (('not' not in pands) and ('no' not in pands) and ('n' not in pands) and ('dont' not in pands) and ('don' not in pands) and ('doesn' not in pands) and ('doesnot' not in pands) and ('doesnt' not in pands)):
		file.write('prereq(pands,yes).\n')

	else:
		file.write('prereq(pands,no).\n')
	

	ip = input('Do you know Introduction to Programming? ')
	ip = ip.lower()
	ip = re.sub('[^a-z]', ' ', ip)
	ip = word_tokenize(ip)
	if (('yes' in ip) or ('yeah' in ip) or ('y' in ip) or ('ofcourse' in ip)):
		file.write('prereq(ip,yes).\n')

	elif (('not' not in ip) and ('no' not in ip) and ('n' not in ip) and ('dont' not in ip) and ('don' not in ip) and ('doesn' not in ip) and ('doesnot' not in ip) and ('doesnt' not in ip)):
		file.write('prereq(ip,yes).\n')

	else:
		file.write('prereq(ip,no).\n')

#Security Engineer Career Prerequisites
elif (chosen_career == 'sec'):

	cn = input('Do you know Computer Networks? ')
	cn = cn.lower()
	cn = re.sub('[^a-z]', ' ', cn)
	cn = word_tokenize(cn)
	if (('yes' in cn) or ('yeah' in cn) or ('y' in cn) or ('ofcourse' in cn)):
		file.write('prereq(cn,yes).\n')

	elif (('not' not in cn) and ('no' not in cn) and ('n' not in cn) and ('dont' not in cn) and ('don' not in cn) and ('doesn' not in cn) and ('doesnot' not in cn) and ('doesnt' not in cn)):
		file.write('prereq(cn,yes).\n')

	else:
		file.write('prereq(cn,no).\n')

	
	c = input('Do you know C/C++ Programming? ')
	c = c.lower()
	c = re.sub('[^a-z]', ' ', c)
	c = word_tokenize(c)
	if (('yes' in c) or ('yeah' in c) or ('y' in c) or ('ofcourse' in c)):
		file.write('prereq(c,yes).\n')

	elif (('not' not in c) and ('no' not in c) and ('n' not in c) and ('dont' not in c) and ('don' not in c) and ('doesn' not in c) and ('doesnot' not in c) and ('doesnt' not in c)):
		file.write('prereq(c,yes).\n')

	else:
		file.write('prereq(c,no).\n')

	
	ada = input('Do you know Algorithm Design and Analysis? ')
	ada = ada.lower()
	ada = re.sub('[^a-z]', ' ', ada)
	ada = word_tokenize(ada)
	if (('yes' in ada) or ('yeah' in ada) or ('y' in ada) or ('ofcourse' in ada)):
		file.write('prereq(ada,yes).\n')

	elif (('not' not in ada) and ('no' not in ada) and ('n' not in ada) and ('dont' not in ada) and ('don' not in ada) and ('doesn' not in ada) and ('doesnot' not in ada) and ('doesnt' not in ada)):
		file.write('prereq(ada,yes).\n')

	else:
		file.write('prereq(ada,no).\n')

#Cyber Security/Cryptographer Career Prerequisites
elif (chosen_career == 'cyber' or chosen_career == 'cryp'):
	
	dm = input('Do you know Discrete Mathematics? ')
	dm = dm.lower()
	dm = re.sub('[^a-z]', ' ', dm)
	dm = word_tokenize(dm)
	if (('yes' in dm) or ('yeah' in dm) or ('y' in dm) or ('ofcourse' in dm)):
		file.write('prereq(dm,yes).\n')

	elif (('not' not in dm) and ('no' not in dm) and ('n' not in dm) and ('dont' not in dm) and ('don' not in dm) and ('doesn' not in dm) and ('doesnot' not in dm) and ('doesnt' not in dm)):
		file.write('prereq(dm,yes).\n')

	else:
		file.write('prereq(dm,no).\n')


	cn = input('Do you know Computer Networks? ')
	cn = cn.lower()
	cn = re.sub('[^a-z]', ' ', cn)
	cn = word_tokenize(cn)
	if (('yes' in cn) or ('yeah' in cn) or ('y' in cn) or ('ofcourse' in cn)):
		file.write('prereq(cn,yes).\n')

	elif (('not' not in cn) and ('no' not in cn) and ('n' not in cn) and ('dont' not in cn) and ('don' not in cn) and ('doesn' not in cn) and ('doesnot' not in cn) and ('doesnt' not in cn)):
		file.write('prereq(cn,yes).\n')

	else:
		file.write('prereq(cn,no).\n')

#VLSI Design Career Prerequisites
elif (chosen_career == 'vlsid'):
	
	dc = input('Do you know Digital Circuits? ')
	dc = dc.lower()
	dc = re.sub('[^a-z]', ' ', dc)
	dc = word_tokenize(dc)
	if (('yes' in dc) or ('yeah' in dc) or ('y' in dc) or ('ofcourse' in dc)):
		file.write('prereq(dc,yes).\n')

	elif (('not' not in dc) and ('no' not in dc) and ('n' not in dc) and ('dont' not in dc) and ('don' not in dc) and ('doesn' not in dc) and ('doesnot' not in dc) and ('doesnt' not in dc)):
		file.write('prereq(dc,yes).\n')

	else:
		file.write('prereq(dc,no).\n')


	cmos = input('Do you know Basics of CMOS? ')
	cmos = cmos.lower()
	cmos = re.sub('[^a-z]', ' ', cmos)
	cmos = word_tokenize(cmos)
	if (('yes' in cmos) or ('yeah' in cmos) or ('y' in cmos) or ('ofcourse' in cmos)):
		file.write('prereq(cmos,yes).\n')

	elif (('not' not in cmos) and ('no' not in cmos) and ('n' not in cmos) and ('dont' not in cmos) and ('don' not in cmos) and ('doesn' not in cmos) and ('doesnot' not in cmos) and ('doesnt' not in cmos)):
		file.write('prereq(cmos,yes).\n')

	else:
		file.write('prereq(cmos,no).\n')

	
	be = input('Do you know Basic Electronics? ')
	be = be.lower()
	be = re.sub('[^a-z]', ' ', be)
	be = word_tokenize(be)
	if (('yes' in be) or ('yeah' in be) or ('y' in be) or ('ofcourse' in be)):
		file.write('prereq(be,yes).\n')

	elif (('not' not in be) and ('no' not in be) and ('n' not in be) and ('dont' not in be) and ('don' not in be) and ('doesn' not in be) and ('doesnot' not in be) and ('doesnt' not in be)):
		file.write('prereq(be,yes).\n')

	else:
		file.write('prereq(be,no).\n')


	emfw = input('Do you know Foundations of Electromagnetic Fields and Waves? ')
	emfw = emfw.lower()
	emfw = re.sub('[^a-z]', ' ', emfw)
	emfw = word_tokenize(emfw)
	if (('yes' in emfw) or ('yeah' in emfw) or ('y' in emfw) or ('ofcourse' in emfw)):
		file.write('prereq(emfw,yes).\n')

	elif (('not' not in emfw) and ('no' not in emfw) and ('n' not in emfw) and ('dont' not in emfw) and ('don' not in emfw) and ('doesn' not in emfw) and ('doesnot' not in emfw) and ('doesnt' not in emfw)):
		file.write('prereq(emfw,yes).\n')

	else:
		file.write('prereq(emfw,no).\n')

#Hardware Engineer Career Prerequisites
elif(chosen_career == 'hwd'):
	
	mosfet = input('Do you have Basic Understanding of P-N Junction and MOSFET? ')
	mosfet = mosfet.lower()
	mosfet = re.sub('[^a-z]', ' ', mosfet)
	mosfet = word_tokenize(mosfet)
	if (('yes' in mosfet) or ('yeah' in mosfet) or ('y' in mosfet) or ('ofcourse' in mosfet)):
		file.write('prereq(mosfet,yes).\n')

	elif (('not' not in mosfet) and ('no' not in mosfet) and ('n' not in mosfet) and ('dont' not in mosfet) and ('don' not in mosfet) and ('doesn' not in mosfet) and ('doesnot' not in mosfet) and ('doesnt' not in mosfet)):
		file.write('prereq(mosfet,yes).\n')

	else:
		file.write('prereq(mosfet,no).\n')

	
	emfw = input('Do you know Foundations of Electromagnetic Fields and Waves? ')
	emfw = emfw.lower()
	emfw = re.sub('[^a-z]', ' ', emfw)
	emfw = word_tokenize(emfw)
	if (('yes' in emfw) or ('yeah' in emfw) or ('y' in emfw) or ('ofcourse' in emfw)):
		file.write('prereq(emfw,yes).\n')

	elif (('not' not in emfw) and ('no' not in emfw) and ('n' not in emfw) and ('dont' not in emfw) and ('don' not in emfw) and ('doesn' not in emfw) and ('doesnot' not in emfw) and ('doesnt' not in emfw)):
		file.write('prereq(emfw,yes).\n')

	else:
		file.write('prereq(emfw,no).\n')

	
	ld = input('Do you know Logic Designs? ')
	ld = ld.lower()
	ld = re.sub('[^a-z]', ' ', ld)
	ld = word_tokenize(ld)
	if (('yes' in ld) or ('yeah' in ld) or ('y' in ld) or ('ofcourse' in ld)):
		file.write('prereq(ld,yes).\n')

	elif (('not' not in ld) and ('no' not in ld) and ('n' not in ld) and ('dont' not in ld) and ('don' not in ld) and ('doesn' not in ld) and ('doesnot' not in ld) and ('doesnt' not in ld)):
		file.write('prereq(ld,yes).\n')

	else:
		file.write('prereq(ld,no).\n')

	
	semi = input('Do you have basic knowledge of Semiconductors? ')
	semi = semi.lower()
	semi = re.sub('[^a-z]', ' ', semi)
	semi = word_tokenize(semi)
	if (('yes' in semi) or ('yeah' in semi) or ('y' in semi) or ('ofcourse' in semi)):
		file.write('prereq(semi,yes).\n')

	elif (('not' not in semi) and ('no' not in semi) and ('n' not in semi) and ('dont' not in semi) and ('don' not in semi) and ('doesn' not in semi) and ('doesnot' not in semi) and ('doesnt' not in semi)):
		file.write('prereq(semi,yes).\n')

	else:
		file.write('prereq(semi,no).\n')

#Electronics and Electrical Engineer Career Prerequisites
elif (chosen_career == 'eee'):
	
	pcs = input('Do you know Principles of Communication Systems? ')
	pcs = pcs.lower()
	pcs = re.sub('[^a-z]', ' ', pcs)
	pcs = word_tokenize(pcs)
	if (('yes' in pcs) or ('yeah' in pcs) or ('y' in pcs) or ('ofcourse' in pcs)):
		file.write('prereq(pcs,yes).\n')

	elif (('not' not in pcs) and ('no' not in pcs) and ('n' not in pcs) and ('dont' not in pcs) and ('don' not in pcs) and ('doesn' not in pcs) and ('doesnot' not in pcs) and ('doesnt' not in pcs)):
		file.write('prereq(pcs,yes).\n')

	else:
		file.write('prereq(pcs,no).\n')

	
	ss = input('Do you know Signals and Systems? ')
	ss = ss.lower()
	ss = re.sub('[^a-z]', ' ', ss)
	ss = word_tokenize(ss)
	if (('yes' in ss) or ('yeah' in ss) or ('y' in ss) or ('ofcourse' in ss)):
		file.write('prereq(ss,yes).\n')

	elif (('not' not in ss) and ('no' not in ss) and ('n' not in ss) and ('dont' not in ss) and ('don' not in ss) and ('doesn' not in ss) and ('doesnot' not in ss) and ('doesnt' not in ss)):
		file.write('prereq(ss,yes).\n')

	else:
		file.write('prereq(ss,no).\n')

	
	fw = input('Do you know Fields and Waves? ')
	fw = fw.lower()
	fw = re.sub('[^a-z]', ' ', fw)
	fw = word_tokenize(fw)
	if (('yes' in fw) or ('yeah' in fw) or ('y' in fw) or ('ofcourse' in fw)):
		file.write('prereq(fw,yes).\n')

	elif (('not' not in fw) and ('no' not in fw) and ('n' not in fw) and ('dont' not in fw) and ('don' not in fw) and ('doesn' not in fw) and ('doesnot' not in fw) and ('doesnt' not in fw)):
		file.write('prereq(fw,yes).\n')

	else:
		file.write('prereq(fw,no).\n')

	
	circuit = input('Do you know Circuit Analysis? ')
	circuit = circuit.lower()
	circuit = re.sub('[^a-z]', ' ', circuit)
	circuit = word_tokenize(circuit)
	if (('yes' in circuit) or ('yeah' in circuit) or ('y' in circuit) or ('ofcourse' in circuit)):
		file.write('prereq(circuit,yes).\n')

	elif (('not' not in circuit) and ('no' not in circuit) and ('n' not in circuit) and ('dont' not in circuit) and ('don' not in circuit) and ('doesn' not in circuit) and ('doesnot' not in circuit) and ('doesnt' not in circuit)):
		file.write('prereq(circuit,yes).\n')

	else:
		file.write('prereq(circuit,no).\n')

#Communication Engineer Career Prerequisites
elif (chosen_career == 'cce'):
	
	pcs = input('Do you know Principles of Communication Systems? ')
	pcs = pcs.lower()
	pcs = re.sub('[^a-z]', ' ', pcs)
	pcs = word_tokenize(pcs)
	if (('yes' in pcs) or ('yeah' in pcs) or ('y' in pcs) or ('ofcourse' in pcs)):
		file.write('prereq(pcs,yes).\n')

	elif (('not' not in pcs) and ('no' not in pcs) and ('n' not in pcs) and ('dont' not in pcs) and ('don' not in pcs) and ('doesn' not in pcs) and ('doesnot' not in pcs) and ('doesnt' not in pcs)):
		file.write('prereq(pcs,yes).\n')

	else:
		file.write('prereq(pcs,no).\n')

	
	cn = input('Do you know Computer Networks? ')
	cn = cn.lower()
	cn = re.sub('[^a-z]', ' ', cn)
	cn = word_tokenize(cn)
	if (('yes' in cn) or ('yeah' in cn) or ('y' in cn) or ('ofcourse' in cn)):
		file.write('prereq(cn,yes).\n')

	elif (('not' not in cn) and ('no' not in cn) and ('n' not in cn) and ('dont' not in cn) and ('don' not in cn) and ('doesn' not in cn) and ('doesnot' not in cn) and ('doesnt' not in cn)):
		file.write('prereq(cn,yes).\n')

	else:
		file.write('prereq(cn,no).\n')



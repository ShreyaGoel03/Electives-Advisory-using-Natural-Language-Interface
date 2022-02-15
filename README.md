## Electives-Advisory-using-Natural-Language-Interface
The Natural-Language User Interface is taking the input of all the questions and providing input to the electives advisory System developed in Prolog.
<br />
### Algorithm Design:
NLTK library, which is a standard python library with prebuilt functions and utilities for ease of use and implementation, has been used which preprocesses the text data.
re Library, is the module that provides regular expressions matching operations.
<br />
<b> LowerCase</b>: All the words are converted into the lower case. <br />
<b> Word Tokenization</b>: It is the process that breaks the sentence into smaller words.<br />
<b> Stemming</b>: It is used for the reduction of words to their origin. Porter Stemmer has been used over here.<br />


### Files:
<b> Electives.py</b>: NL Interface in Python.<br />
<b> Electives.pl</b>: Electives Advisory System in Prolog.<br />
<b> electives_Advisory_Fact.txt</b>: Facts stored in the text file used for consultation by Prolog Program. These facts act as one of the clauses in the prolog program during
runtime. Then based on that fact the prolog program does not ask the user any further questions and is able to suggest the electives according to the career choice and
prerequisites completed.<br />


### Output:

<b> Electives.py

<b> electives_Advisory_Fact.txt

<b> Electives.pl

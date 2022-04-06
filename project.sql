SPOOL project.txt
SET ECHO ON
/*
CIS 353 - Database Design Project
Kyle Casey
Matthew Newhouse
Tu Nguyen
Alexis Webster
*/
--< The SQL/DDL code that creates your schema >
--In the DDL, every IC must have a unique name; e.g. IC5, IC10, IC15, etc.
--
SET FEEDBACK OFF
--< The INSERT statements that populate the tables>
CREATE TABLE Book (
ISBN	INTEGER,
publisher   CHAR(20)	NOT NULL,
title	CHAR(20)    NOT NULL,
retail_cost	FLOAT NOT NULL,
--
CONSTRAINT bookIC1 PRIMARY KEY (ISBN)
);
--
CREATE TABLE Librarian (
ssn	INTEGER,
librarian_name	CHAR(20)   NOT NULL,
date_of_hire	DATE	NOT NULL,
mentor_ssn	INTEGER,
--
CONSTRAINT lIC1 PRIMARY KEY (ssn)
);
--
CREATE TABLE LibraryCard (
card_number	INTEGER,
customer_name	CHAR(20)   NOT NULL,
expiration_date   DATE   NOT NULL,
zip_code	INTEGER   NOT NULL,
--
CONSTRAINT lcIC1 PRIMARY KEY (card_number)
);
--
CREATE TABLE ReadingGroup (
id	INTEGER,
genre	CHAR(20) NOT NULL,
group_name	CHAR(20)  NOT NULL,
--
CONSTRAINT readIC1 PRIMARY KEY (id)
);
--
CREATE TABLE Transaction (
transaction_number   INTEGER,
order_date	DATE   NOT NULL,
return_date	DATE   NOT NULL,
due_date	DATE   NOT NULL,
penalty	INTEGER,
librarian_ssn	INTEGER NOT NULL,
c_number	INTEGER NOT NULL,
--
CONSTRAINT tIC1 PRIMARY KEY (transaction_number)
);
--
CREATE TABLE BookCopy (
copy_number	INTEGER,
isbn	INTEGER,
condition	CHAR(20) NOT NULL,
date_received	DATE NOT NULL,
tnumber	INTEGER NOT NULL,
--
CONSTRAINT bcIC1 PRIMARY KEY (copy_number, isbn)
);
--
CREATE TABLE Authors (
a_isbn	INTEGER,
author	CHAR(20) NOT NULL,
--
CONSTRAINT aIC1 PRIMARY KEY (a_isbn, author)
);
--
CREATE TABLE Joins (
groupid   INTEGER,
card_num   INTEGER,
date_of_join	DATE	NOT NULL,
--
CONSTRAINT jIC1 PRIMARY KEY (groupid, card_num)
);
--Important: Keep the number of rows in each table small enough so that the results of your
--queries can be verified by hand. See the Sailors database as an example.
SET FEEDBACK ON
COMMIT;
--
--< One query (per table) of the form: SELECT * FROM table; in order to display your database >
--
--< The SQL queries>
--Include the following for each query:
--	− A comment line stating the query number and the feature(s) it demonstrates
--(e.g. -- Q25 – correlated subquery).
--	− A comment line stating the query in English.
--	− The SQL code for the query.
--
--< The insert/delete/update statements to test the enforcement of ICs >
INSERT INTO Book VALUES (1234567891234, 'Disney', 'Disney Book', 10.50);
--
INSERT INTO Librarian VALUES (123456789, 'Steven', 
	TO_DATE('10/14/93', 'MM/DD/YY'), 987654321 );
--
INSERT INTO LibraryCard VALUES (54321, 'Joseph', 
	TO_DATE('10/25/21', 'MM/DD/YY'), 49221);
--
INSERT INTO ReadingGroup VALUES (4321, 'Fantasy', 'Fans of Fantasy');
--
INSERT INTO Transaction VALUES (7654321,
	TO_DATE('11/10/20', 'MM/DD/YY'), 
	TO_DATE('12/24/20', 'MM/DD/YY'),
	TO_DATE('12/24/20', 'MM/DD/YY'),
	0,123456789,54321);
--
INSERT INTO BookCopy VALUES (10,1234567891234,'Good',
	TO_DATE('01/05/99', 'MM/DD/YY'),
	7654321);
--
INSERT INTO Authors VALUES (1234567891234, 'John Doe');
--
INSERT INTO Joins VALUES (4321, 54321,
	TO_DATE('01/07/00', 'MM/DD/YY'));
COMMIT;
/*Include the following items for every IC that you test (Important: see the next section titled
“Submit a final report” regarding which ICs you need to test).*/
	--− A comment line stating: Testing: < IC name>
	--− A SQL INSERT, DELETE, or UPDATE that will test the IC.
COMMIT;
--
SPOOL OFF

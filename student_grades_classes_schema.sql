CREATE TYPE credits AS ENUM ( '1','2','3','4');
CREATE TYPE grade AS ENUM ( 'A','B','C','D','F'); 
CREATE TYPE credits_received AS ENUM ( '0','1','2','3','4');

CREATE TABLE students(
    "student_id" INTEGER,
    "first_name" VARCHAR(16),   
    "last_name" VARCHAR(16),   

    PRIMARY KEY ("student_id")
);

CREATE TABLE classes_taken(
    "class_id" INTEGER,  
    "class_name" VARCHAR(40),   
    "credits_worth" credits,

    PRIMARY KEY ("class_id")
);

CREATE TABLE grades_received(
    "grade_id" INTEGER,  
    "student_id" INTEGER,   
    "class_id" INTEGER,  
  	"grade_received" grade,
    "credits_earned" credits_received,

    PRIMARY KEY ("grade_id")
);

INSERT INTO students
	("student_id", "first_name", "last_name")
VALUES
	(12001, 'Bob', 'Jefferson'),
	(12002, 'Harry', 'Bigilow'),
	(12003, 'Cathy', 'Taylor'),
	(12004, 'Juliet', 'Springsbury'),
	(12005, 'Big', 'Pa'),
	(12006, 'Part', 'Timer');

INSERT INTO classes_taken
	("class_id", "class_name", "credits_worth")
VALUES
	(101, 'Biology', '4'),
	(201, 'Chemistry One', '4'),
	(110, 'INTRO Micro-Economics', '3'),
	(120, 'Creative Writing', '2'),
	(170, 'Study Skills', '1');

INSERT INTO grades_received
	("grade_id", "student_id", "class_id", "grade_received", "credits_earned")
VALUES
	(1, 12001, 101, 'B', '4'),
	(2, 12001, 201, 'F', '0'),
	(3, 12001, 170, 'A', '1'),
	(4, 12001, 110, 'A', '3'),
	(5, 12001, 120, 'B', '2'),
	(6, 12002, 101, 'A', '4'),
	(7, 12002, 201, 'C', '4'),
	(8, 12002, 170, 'A', '1'),
	(9, 12002, 110, 'A', '3'),
	(10, 12002, 120, 'B', '2'),
	(11, 12003, 101, 'B', '4'),
	(12, 12003, 201, 'D', '4'),
	(13, 12003, 170, 'A', '1'),
	(14, 12003, 110, 'B', '3'),
	(15, 12003, 120, 'F', '0'),
	(16, 12004, 101, 'A', '4'),
	(17, 12004, 201, 'A', '4'),
	(18, 12004, 170, 'A', '1'),
	(19, 12004, 110, 'A', '3'),
	(20, 12004, 120, 'B', '2'),
	(21, 12005, 101, 'B', '4'),
	(22, 12005, 201, 'B', '4'),
	(23, 12005, 170, 'A', '1'),
	(24, 12005, 110, 'A', '3'),
	(25, 12005, 120, 'C', '2'),
	(26, 12006, 120, 'A', '2');



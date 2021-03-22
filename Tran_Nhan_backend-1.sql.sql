USE MASTER
GO
CREATE DATABASE Tran_Nhan_db
GO
USE StudentUSE Tran_Nhan_db
GO
CREATE TABLE Student (
	studentID int NOT NULL,
	lastName varCHAR(250) NOT NULL,
	firstName varChar(250) NOT NULL,
	dobMonth NUMERIC(2) NOT NULL,
	dobDay NUMERIC(2) NOT NULL,
	dobYear NUMERIC(4) NOT NULL,
	PRIMARY KEY (studentID)
);
INSERT INTO Student VALUES (1, 'Tran', 'Nhan', 06, 19,1995);
INSERT INTO Student VALUES (2, 'harold', 'Jonh', 01, 19,1996);
INSERT INTO Student VALUES (3, 'Tran', 'Garen', 07, 12,1997);
INSERT INTO Student VALUES (4, 'Ronald', 'JR', 12, 23,1995);
INSERT INTO Student VALUES (5, 'Sun', 'Wukong', 11, 17,1994);
INSERT INTO Student VALUES (6, 'Master', 'Yi', 08, 15,1993);
INSERT INTO Student VALUES (7, 'Tran', 'Eve', 01, 20,1995);

SELECT * FROM Student;

CREATE TABLE StudentEmail (
	studentID int NOT NULL,
	email varCHAR(250) NOT NULL,
	PRIMARY KEY (studentID, email),
    FOREIGN KEY (studentID) REFERENCES Student(StudentID)
);
INSERT INTO StudentEmail VALUES (1, 'ntantran@uw.edu');
INSERT INTO StudentEmail VALUES (2, 'sdfas@uw.edu');
INSERT INTO StudentEmail VALUES (3, 'fsadf@uw.edu');
INSERT INTO StudentEmail VALUES (4, 'ffdssfd@uw.edu');
INSERT INTO StudentEmail VALUES (5, 'fahksdf@uw.edu');
INSERT INTO StudentEmail VALUES (6, 'nvzxcv@uw.edu');
INSERT INTO StudentEmail VALUES (7, 'iyuityu@uw.edu');

SELECT * FROM StudentEmail;


CREATE TABLE StudentPhone (
	studentID int NOT NULL,
	phoneNo varCHAR(10) NOT NULL,
	PRIMARY KEY (studentID, phoneNo),
    FOREIGN KEY (studentID) REFERENCES Student(StudentID)
);
INSERT INTO StudentPhone VALUES (1, 3603501234);
INSERT INTO StudentPhone VALUES (2, 3604324451);
INSERT INTO StudentPhone VALUES (3, 2065436543);
INSERT INTO StudentPhone VALUES (4, 3604559963);
INSERT INTO StudentPhone VALUES (5, 2064537765);
INSERT INTO StudentPhone VALUES (6, 3604326890);
INSERT INTO StudentPhone VALUES (7, 3604327689);

SELECT * FROM StudentPhone;

CREATE TABLE Course (
	courseID NUMERIC(10) NOT NULL,
	title varCHAR (250) NOT NULL,
	credit int NOT NULL,
	PRIMARY KEY (courseID)
);
INSERT INTO Course VALUES (1, 'TCSS 445', 5);
INSERT INTO Course VALUES (2, 'TCSS 345', 5);
INSERT INTO Course VALUES (3, 'TCSS 255', 3);
INSERT INTO Course VALUES (4, 'TCSS 372', 5);
INSERT INTO Course VALUES (5, 'TCSS 373', 2);
INSERT INTO Course VALUES (6, 'TCSS 432', 2);
INSERT INTO Course VALUES (7, 'TCSS 532', 2);
INSERT INTO Course VALUES (8, 'TCSS 321', 5);

SELECT * FROM Course;

CREATE TABLE Enrollment (
	studentID int NOT NULL,
	courseID NUMERIC(10) NOT NULL,
	grade DECIMAL (2,1) NOT NULL,
	PRIMARY KEY(studentID, courseID),
	FOREIGN KEY (studentID) REFERENCES Student(StudentID),
	FOREIGN KEY (courseID) REFERENCES Course(courseID)
);
INSERT INTO Enrollment VALUES (1, 1, 4.0);
INSERT INTO Enrollment VALUES (2, 2, 3.6);
INSERT INTO Enrollment VALUES (3, 2, 3.0);
INSERT INTO Enrollment VALUES (4, 2, 3.5);
INSERT INTO Enrollment VALUES (5, 2, 3.1);
INSERT INTO Enrollment VALUES (6, 2, 3.5);
INSERT INTO Enrollment VALUES (7, 3, 2.1);
INSERT INTO Enrollment VALUES (1, 4, 2.7);
INSERT INTO Enrollment VALUES (2, 5, 3.8);
INSERT INTO Enrollment VALUES (2, 6, 3.9);
INSERT INTO Enrollment VALUES (4, 1, 3.5);


SELECT * FROM Enrollment;

CREATE TABLE GradeReport (
	studentID int NOT NULL,
	reportID int NOT NULL,
	gpa DECIMAL (2,1) NOT NULL,
	creditEarned int NOT NULL,
	PRIMARY KEY (studentID, reportID),
	FOREIGN KEY (studentID) REFERENCES Student(StudentID)
);
INSERT INTO GradeReport
VALUES (1,1,3.8,15);

SELECT * FROM GradeReport;

CREATE TABLE Major (
	majorID int NOT NULL,
	majorName varCHAR (250) NOT NULL,
	deparment varCHAR (250) NOT NULL,
	minimumGPA DECIMAL (2,1) NOT NULL,
	PRIMARY KEY (majorID)
);
INSERT INTO Major
VALUES (1,'Compueter Science', 'Engineer and Technology', 2.5); 

SELECT * FROM Major;

CREATE TABLE TutitionFee (
	recieptNumber int NOT NULL,
	fee DECIMAL(10,2) NOT NULL,
	quarters varCHAR(10) NOT NULL,
	year NUMERIC(4) NOT NULL,
	PRIMARY KEY (recieptNumber)
);
INSERT INTO TutitionFee
VALUES (1, 3999.99, 'spring', 2019);

SELECT * FROM TutitionFee;

CREATE TABLE Advisor (
	advisorID int NOT NULL,
	firstName varCHAR(200) NOT NULL,
	lastName varCHAR(200) NOT NULL,
	major varCHAR(200) NOT NULL,
	PRIMARY KEY (advisorID)
);
INSERT INTO Advisor
VALUES (1, 'John', 'Smith', 'CS') ;

SELECT * FROM  Advisor;

CREATE TABLE AdvisorEmail (
	advisorID int NOT NULL,
	email varCHAR(250) NOT NULL,
	PRIMARY KEY (advisorID, email),
    FOREIGN KEY (advisorID) REFERENCES Advisor(AdvisorID)
);
INSERT INTO AdvisorEmail
VALUES (1, 'johnsmith@uw.edu');

SELECT * FROM AdvisorEmail;

CREATE TABLE AdvisorPhone (
	advisorID int NOT NULL,
	phoneNo varCHAR(10) NOT NULL,
	PRIMARY KEY (advisorID, phoneNo),
    FOREIGN KEY (advisorID) REFERENCES Advisor(advisorID)
);
INSERT INTO AdvisorPhone
VALUES (1, 3603507879);

SELECT * FROM AdvisorPhone;

CREATE TABLE ParkingPass (
	studentID int,
	parkingID int NOT NULL,
	parkingLocation varCHAR(200) NOT NULL,
	schoolYear NUMERIC(4) NOT NULL,
	quarters varCHAR(15) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (parkingID),
	FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
INSERT INTO ParkingPass VALUES (NULL, 123, 'West', 2020, 'Spring', 129.99);
INSERT INTO ParkingPass VALUES (NULL,321, 'Ease', 2020, 'Fall', 149.99);
INSERT INTO ParkingPass VALUES (NULL, 001, 'South', 2020, 'Winter', 119.99);
INSERT INTO ParkingPass VALUES (NULL, 142, 'West', 2020, 'Spring', 312.99);
INSERT INTO ParkingPass VALUES (NULL, 521, 'North', 2020, 'Summer', 100.99);
INSERT INTO ParkingPass VALUES (NULL, 456, 'East', 2020, 'Spring', 123.99);
INSERT INTO ParkingPass VALUES (NULL, 111, 'West', 2020, 'Spring', 165.99);
INSERT INTO ParkingPass VALUES (NULL, 2134, 'West', 2020, 'Spring', 390.99);

INSERT INTO ParkingPass VALUES (NULL, 1111, 'North', 2020, 'Summer', 100.99);
INSERT INTO ParkingPass VALUES (NULL, 2222, 'East', 2020, 'Spring', 215.99);
INSERT INTO ParkingPass VALUES (NULL, 2322, 'West', 2020, 'Spring', 200.99);
INSERT INTO ParkingPass VALUES (NULL, 12345, 'West', 2020, 'Spring', 390.99);



SELECT * FROM ParkingPass;

CREATE TABLE Professor (
	professorID int NOT NULL,
	firstName varCHAR(250) NOT NULL,
	lastName varCHAR(250) NOT NULL,
	degree varCHAR(200) NOT NULL,
	subjects varCHAR(200) NOT NULL,
	PRIMARY KEY (professorID)
);
INSERT INTO Professor
VALUES (1,'Adam', 'Smith', 'M.D.', 'Math');

SELECT * FROM Professor;

CREATE TABLE profEmail (
	professorID int NOT NULL,
	email varCHAR(250) NOT NULL,
	PRIMARY KEY (professorID, email),
    FOREIGN KEY (professorID) REFERENCES Professor(professorID)
);
INSERT INTO profEmail
VALUES (1, 'adam@uw.edu');

SELECT * FROM profEmail;

CREATE TABLE profPhone (
	professorID int NOT NULL,
	phoneNo varCHAR(10) NOT NULL,
	PRIMARY KEY (professorID, phoneNo),
    FOREIGN KEY (professorID) REFERENCES Professor(professorID)
);
INSERT INTO profPhone
VALUES (1, 3604564535);

SELECT * FROM profPhone;

CREATE TABLE Lecture (
	lectureID int NOT NULL,
	subjectName varCHAR(200) NOT NULL,
	startTime varCHAR(100) NOT NULL,
	endTime varCHAR(100) NOT NULL,
	PRIMARY KEY (lectureID)
);
INSERT INTO Lecture
VALUES (1, 'Computer Science', '10:00 AM', '12:00 AM');

SELECT * FROM Lecture;

CREATE TABLE Campus (
	campusID int NOT NULL,
	campusAddress varCHAR(200) NOT NULL,
	PRIMARY KEY (campusID),
	UNIQUE (campusAddress)
);
INSERT INTO Campus
VALUES (321, '1900 Commerce St, Tacoma, WA 98402');

SELECT * FROM Campus;

CREATE TABLE CampusID (
	campusID int NOT NULL,
	campusName varCHAR(250) NOT NULL,
	PRIMARY KEY (campusID),
	FOREIGN KEY (campusID) REFERENCES Campus(campusID)
);
INSERT INTO CampusID
VALUES (321, 'University of Washington Tacoma');

SELECT * FROM CampusID;

CREATE TABLE CampusAdd (
	campusAddress varCHAR(200) NOT NULL,
	campusName varCHAR(250) NOT NULL,
	PRIMARY KEY (campusAddress),
	FOREIGN KEY (campusAddress) REFERENCES Campus(campusAddress)	
);
INSERT INTO CampusAdd
VALUES ('1900 Commerce St, Tacoma, WA 98402', 'University of Washington Tacoma');

SELECT * FROM CampusAdd;

CREATE TABLE Library (
	campusID int NOT NULL,
	libraryName varCHAR(300) NOT NULL,
	operationHour varCHAR(100) NOT NULL,
	operationDay varCHAR(100) NOT NULL,
	PRIMARY KEY(campusID, libraryName),
	FOREIGN KEY(campusID) REFERENCES Campus(campusID)
);
INSERT INTO Library
VALUES (321, 'The best Library', '8:00 AM - 5:00 PM', 'M-F');

SELECT * FROM Library;

CREATE TABLE Building (
	buildingID int NOT NULL,
	buildingName varCHAR(200) NOT NULL,
	numberOfFloors int NOT NULL,
	PRIMARY KEY(buildingID)
);
INSERT INTO Building
VALUES (1, 'MC Dougal', 4);

SELECT * FROM Building;

CREATE TABLE Floor (
	buildingID int NOT NULL,
	floorLevel int NOT NULL,
	numberOfRooms int NOT NULL,
	PRIMARY KEY(buildingID, floorLevel),
	FOREIGN KEY(buildingID) REFERENCES Building(buildingID)
);
INSERT INTO Floor
VALUES (1, 1, 24);

SELECT * FROM Floor;

CREATE TABLE ClassRoom (
	buildingID int NOT NULL,
	className varCHAR(250) NOT NULL,
	capacity int NOT NULL,
	PRIMARY KEY(buildingID, className),
	FOREIGN KEY(buildingID) REFERENCES Building(buildingID)
);
INSERT INTO ClassRoom
VALUES (1, 'MD 103', 50);

SET GLOBAL time_zone = '+3:00';



-- Analytical Query:
-- 1 Find the average Parking Price for spring quarter 2020
SELECT AVG(price) Average_Parking_Price_For_Spring_2020
FROM ParkingPass
WHERE ParkingPass.quarters = 'spring' AND ParkingPass.schoolYear = '2020';

-- 2 Find the course with highest Average GPA.
SELECT courseID, AVG(grade) Highest_Average_Grade
FROM Enrollment
GROUP BY courseID
ORDER BY AVG(grade) desc;

-- 3.	Find most popular Course(course taken by many student)
SELECT courseID Most_Taken_CourseID, COUNT(courseID) Number_Of_Enrollments
								  FROM Enrollment
								  GROUP BY courseID
								  ORDER BY COUNT(courseID) desc;

-- 4.	Find the number of student who have the average gpa higher than 3.0
SELECT COUNT(Highest_Average_Grade) Number_Of_Student_With_GPA_Higher_Than_Three_Point_ZERO 
FROM (SELECT AVG(grade) Highest_Average_Grade
FROM Enrollment
GROUP BY studentID
HAVING AVG(grade) > 3.0) AS asfd;

-- 5.	Find number of Parking Pass that have the price lower than 200 and available for purchase
SELECT COUNT(parkingID) Number_Of_Available_Parking_Pass_Under_Two_Hundreds_Dollars
FROM ParkingPass
WHERE ParkingPass.price < 200.00 AND ParkingPass.studentID is NULL















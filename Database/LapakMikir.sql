/***
 * Created by: Jason
 * Date: December 22nd, 2018
 * Purpose: Database LapakMikir
***/

-- //Create and Use Database
CREATE DATABASE LapakMikir
GO
USE LapakMikir

-- //Create Table
GO
CREATE TABLE msStudent (
	studentID CHAR(14) PRIMARY KEY,
	studentName VARCHAR(25) NOT NULL,
	studentDOB DATE NOT NULL,
	studentEmail VARCHAR(50) NOT NULL,
	studentSecondaryEmail VARCHAR(50) NOT NULL,
	studentPassword VARCHAR(50) NOT NULL,
	accSecurityQuestion VARCHAR(100) NOT NULL,
	accSecurityAnswer VARCHAR(50) NOT NULL,
	studentOverallProgress INT NOT NULL,

	CONSTRAINT check_studentID CHECK(studentID LIKE 'SD[1-2][0-9][0-9][0-9]0[0-1][1-9][0-3][0-9][0-9][0-9][0-9]'), -- SD[YYYYMMMDD = date of register][0-9 = list of number]
	CONSTRAINT check_studentEmail CHECK(studentEmail LIKE '%_@__%.__%'),
	CONSTRAINT check_studentEmail_unique UNIQUE(studentEmail), -- studentEmail must be unique
	CONSTRAINT check_studentSecondaryEmail CHECK(studentSecondaryEmail LIKE '%_@__%.__%' AND studentSecondaryEmail NOT LIKE studentEmail),
	CONSTRAINT check_studentOverallProgress CHECK(studentOverallProgress >= 0 AND studentOverallProgress <= 100) -- max student overall progress = 100
)
GO
CREATE TABLE msAdmin (
	adminID CHAR(4) PRIMARY KEY,
	adminName VARCHAR(25) NOT NULL,
	adminEmail VARCHAR(50) NOT NULL,
	adminPassword VARCHAR(50) NOT NULL,

	CONSTRAINT check_adminID CHECK(adminID LIKE 'AD[0][0-9]'),
	CONSTRAINT check_adminEmail CHECK(adminEmail LIKE '%_@__%.__%'),
	CONSTRAINT check_adminEmail_unique UNIQUE(adminEmail), -- adminEmail must be unique
	CONSTRAINT check_adminPassword CHECK(LEN(adminPassword) >= 8)
)
GO
CREATE TABLE msCourse (
	courseID CHAR(6) PRIMARY KEY,
	courseName VARCHAR(25) NOT NULL,

	CONSTRAINT check_courseID CHECK(courseID LIKE 'CR[A-Z][A-Z][0][0-3]'), -- CR[A-Z = initial of course][0][1-3 = code of course]
)
GO
CREATE TABLE msMaterial (
	materialID CHAR(6) PRIMARY KEY,
	adminID CHAR(4) FOREIGN KEY REFERENCES msAdmin(adminID),
	materialName VARCHAR(50) NOT NULL,
	materialDesc VARCHAR(255) NOT NULL,
	materialFile VARBINARY(MAX),
	dataUploaded TIMESTAMP NOT NULL,

	CONSTRAINT check_materialID CHECK(materialID LIKE 'MR[0-3][0-9][0-9][0-9]'), --MR[1-3 = code of course][0-9 = list of number]
	CONSTRAINT check_materialFile CHECK(DATALENGTH(materialFile) <= 2097152) -- max file size = 2MB
)
GO
CREATE TABLE trMaterialDetail (
	courseID CHAR(6) FOREIGN KEY REFERENCES msCourse(courseID) NOT NULL,
	materialID CHAR(6) FOREIGN KEY REFERENCES msMaterial(materialID) NOT NULL
)
GO
CREATE TABLE msQuestion (
	questionID CHAR(5) PRIMARY KEY,
	questionDetail VARCHAR(255) NOT NULL,

	CONSTRAINT check_questionID CHECK(questionID LIKE 'QT[0-9][0-9][0-9]')
)
GO
CREATE TABLE msAnswer(
	answerID CHAR(5) PRIMARY KEY,
	answerDetail VARCHAR(255) NOT NULL,

	CONSTRAINT check_answerID CHECK(answerID LIKE 'AN[0-9][0-9][0-9]')
)
CREATE TABLE msPackage (
	packageID CHAR(5) PRIMARY KEY,
	questionID CHAR(5) FOREIGN KEY REFERENCES msQuestion(questionID) NOT NULL,
	answerID CHAR(5) FOREIGN KEY REFERENCES msAnswer(answerID) NOT NULL,

	CONSTRAINT check_packageID CHECK(packageID LIKE 'PC[0-9][0-9][0-9]')
)
GO
CREATE TABLE trExcercise (
	excerciseID CHAR(4) PRIMARY KEY,
	courseID CHAR(6) FOREIGN KEY REFERENCES msCourse(courseID) NOT NULL,
	score INT NOT NULL,
	exceciseDate TIMESTAMP NOT NULL,

	CONSTRAINT check_excerciseID CHECK(excerciseID LIKE 'EX[0-9][0-9]'),
	CONSTRAINT check_score CHECK(score >= 0 AND score <=5) -- max score = 5
)
GO
CREATE TABLE trExcerciseDetail (
	excerciseID CHAR(4) FOREIGN KEY REFERENCES trExcercise(excerciseID),
	packageID CHAR(5) FOREIGN KEY REFERENCES msPackage(packageID)
)
GO
CREATE TABLE trStudentDetail (
	studentID CHAR(14) FOREIGN KEY REFERENCES msStudent(studentID) NOT NULL,
	courseID CHAR(6) FOREIGN KEY REFERENCES msCOurse(courseID) NOT NULL,
	courseStatus TINYINT NOT NULL,

	CONSTRAINT check_courseStatus CHECK(courseStatus = 0 OR courseStatus = 1) -- 0 for not completed, 1 for completed
)

-- //Insert Testing Values
GO
INSERT INTO msStudent (
	studentID,
	studentName,
	studentDOB,
	studentEmail,
	studentSecondaryEmail,
	studentPassword,
	accSecurityQuestion,
	accSecurityAnswer,
	studentOverallProgress
)
VALUES (
	'SD201801222000',
	'Testing Student',
	'2018/12/22',
	'test@student.com',
	'test@student.co.id',
	'test123',
	'1+1',
	'2',
	0
)
GO
INSERT INTO msAdmin(adminID, adminName, adminEmail, adminPassword) VALUES
('AD00', 'Testing Admin', 'test@admin.com', 'Admintest123')
GO
INSERT INTO msCourse(courseID,courseName) VALUES
('CRTC00', 'Testing Course'),
('CRSL01', 'SQL'),
('CRJA02', 'Java'),
('CRAJ03', 'Advanced Java')
GO
INSERT INTO msMaterial(materialID, adminID, materialName, materialDesc, materialFile, dataUploaded) VALUES
('MR0000', 'AD00', 'Testing Material', 'This is first testing material.', null, null),
('MR0001', null, 'Testing Material 2', 'This is second testing material.', null, null)
GO
INSERT INTO trMaterialDetail(courseID, materialID) VALUES
('CRTC00', 'MR0000'),
('CRTC00', 'MR0001')
GO
INSERT INTO msQuestion(questionID, questionDetail) VALUES
('QT000', 'Choose B answer!')
GO
INSERT INTO msAnswer(answerID, answerDetail) VALUES
('AN000', 'Wrong ans!'),
('AN001', 'Correct ans..'),
('AN002', 'Wrong answer!')
INSERT INTO msPackage(packageID, questionID, answerID) VALUES
('PC000', 'QT000', 'AN001')
GO
INSERT INTO trExcercise(excerciseID, courseID, score, exceciseDate) VALUES
('EX00', 'CRTC00', 5, null)
GO
INSERT INTO trExcerciseDetail(excerciseID, packageID) VALUES
('EX00', 'PC000')
GO
INSERT INTO trStudentDetail VALUES
('SD201801222000', 'CRTC00', 0)


--USE master
--DROP DATABASE LapakMikir

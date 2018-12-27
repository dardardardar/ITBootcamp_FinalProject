/***
 * Created by: Jason
 * Date: December 22nd, 2018
 * Purpose: Create stored procedure to LapakMikir database
***/

-- Use Database
USE LapakMikir

-- Create Procedure
GO
CREATE PROCEDURE bn_student_createNewStudent
	@name VARCHAR(25),
	@dob DATE,
	@email VARCHAR(50),
	@secEmail VARCHAR(50),
	@password VARCHAR(50),
	@securityQuestion VARCHAR(100),
	@securityAnswer VARCHAR(50)
AS
DECLARE
	@next_idx CHAR(3),
	@input_id CHAR(14)
BEGIN
	SET NOCOUNT ON

	-- Get last index & set current index
	SELECT TOP 1
		@next_idx = CAST( FORMAT( CAST( RIGHT(studentID, 3) AS INT) + 1, '000') AS VARCHAR)
	FROM msStudent
	ORDER BY studentID DESC

	-- Set current id
	SET @input_id = 'SD' + 
					CAST(YEAR(GETDATE()) AS VARCHAR) + 
					'0' + CAST(MONTH(GETDATE()) AS VARCHAR) + 
					CAST(DAY(GETDATE()) AS VARCHAR) + 
					CAST(@next_idx AS VARCHAR)

	-- Insert values
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
	VALUES(@input_id, @name, @dob, @email, @secEmail, @password, @securityQuestion, @securityAnswer, 0)
END


GO
CREATE PROCEDURE bn_admin_createNewAdmin
	@name VARCHAR(25),
	@email VARCHAR(50),
	@password VARCHAR(50)
AS
DECLARE
	@next_idx CHAR(2),
	@input_id CHAR(4)
BEGIN
	SET NOCOUNT ON

	-- Get last index & set current index
	SELECT TOP 1
		@next_idx = CAST( FORMAT( CAST( RIGHT(adminID, 2) AS INT) + 1, '00') AS VARCHAR)
	FROM msAdmin
	ORDER BY adminID DESC

	-- Set current id
	SET @input_id = 'AD' + CAST(@next_idx AS VARCHAR)

	-- Insert values
	INSERT INTO msAdmin(adminID, adminName, adminEmail,	adminPassword) 
	VALUES(@input_idx, @name, @email, @password)
END

GO
CREATE PROCEDURE bn_admin_readAllStudent
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		studentID,
		studentName,
		studentDOB,
		studentEmail,
		studentSecondaryEmail,
		studentOverallProgress
	FROM msStudent
END

GO
CREATE PROCEDURE bn_admin_readAllMaterial_byCourse
	@course VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON

	IF(LEN(@course) = 6 AND @course LIKE 'MR%')
	BEGIN
		-- Search by ID
		SELECT
			materialID,
			materialName,
			materialDesc,
			materialFile,
			dataUploaded
		FROM msMaterial a
		JOIN trMaterialDetail b ON a.materialID = b.materialID
		WHERE courseID LIKE @course
	END
	ELSE
	BEGIN
		-- Search by name
		SELECT
			materialID,
			materialName,
			materialDesc,
			materialFile,
			dataUploaded
		FROM trMaterialDetail a
		JOIN msMaterial b ON a.materialID = b.materialID
		JOIN msCourse c ON a.courseID = c.courseID
		WHERE courseName LIKE @course
	END
END

GO
CREATE PROCEDURE bn_admin_uploadNewMaterial
	@course_id CHAR(6),
	@name VARCHAR(50),
	@admin_id CHAR(4),
	@description VARCHAR(255),
	@file VARBINARY(MAX)
AS
DECLARE
	@course_idx CHAR(1),
	@next_idx CHAR(3),
	@input_id CHAR(6)
BEGIN
	SET NOCOUNT ON

	-- Get course index
	SELECT
		@course_idx = CAST( RIGHT(courseID, 2) AS VARCHAR )
	FROM msCourse
	WHERE courseID LIKE @course_id

	-- Get last index & set current index
	SELECT TOP 1
		@next_idx = CAST( FORMAT( CAST( RIGHT(materialID, 3) AS INT) + 1, '000') AS VARCHAR)
	FROM msMaterial
	ORDER BY materialID DESC

	-- Set current ID
	SET @input_id = 'MR' + CAST(@course_idx AS VARCHAR) + CAST(@next_idx AS VARCHAR)

	-- Insert values
	INSERT INTO msMaterial(materialID, adminID, materialName, materialDesc, materialFile, dataUploaded) 
	VALUES(@input_id, @admin_id, @name, @description, @file, null)

	INSERT INTO trMaterialDetail(courseID, materialID) VALUES(@course_id, @input_id)
END


CREATE PROCEDURE bn_admin_createNewExcercise
	@course_id CHAR(6),
	@question VARCHAR(255),
	@answer VARCHAR(255)
AS
DECLARE
	@question_idx CHAR(3),
	@answer_idx CHAR(3),
	@excercise_idx CHAR(2),
	@questionID CHAR(5),
	@answerID CHAR(5),
	@excerciseID CHAR(4)
BEGIN
	SET NOCOUNT ON

	-- Get last index & set current index
	SELECT TOP 1
		@question_idx = CAST( FORMAT( CAST( RIGHT(questionID, 3) AS INT) + 1, '000') AS VARCHAR)
	FROM msQuestion
	ORDER BY questionID DESC

	SELECT TOP 1
		@answer_idx = CAST( FORMAT( CAST( RIGHT(answerID, 3) AS INT) + 1, '000') AS VARCHAR)
	FROM msAnswer
	ORDER BY answerID DESC

	SELECT TOP 1
		@excercise_idx = CAST( FORMAT( CAST( RIGHT(excerciseID, 2) AS INT) + 1, '00') AS VARCHAR)
	FROM msExcercise
	ORDER BY excerciseID DESC

	-- Set current ID
	SET @questionID = 'QT' + CAST(@question_idx AS VARCHAR)
	SET @answerID = 'AN' + CAST(@answer_idx AS VARCHAR)
	SET @excerciseID = 'EX' + CAST(@excercise_idx AS VARCHAR)

	-- Insert values
	INSERT INTO msQuestion(questionID, questionDetail) VALUES(@questionID, @question)
	INSERT INTO msAnswer(answerID, answerDetail) VALUES(@answerID, @answer)
	INSERT INTO msExcercise(excerciseID, questionID, answerID) VALUES(@excerciseID, @questionID, @answerID)
END

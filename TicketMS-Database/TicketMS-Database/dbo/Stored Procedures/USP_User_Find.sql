CREATE PROCEDURE [dbo].[USP_User_Find]
	@emailOrUserName NVARCHAR(128)
AS
	DECLARE @id INT

	SELECT @id = [Id]
	FROM [User]
	WHERE [Email] = @emailOrUserName
		OR [UserName] = @emailOrUserName

	IF @id IS NOT NULL
		EXEC USP_User_Get @id
RETURN 0

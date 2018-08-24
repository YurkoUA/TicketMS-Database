CREATE PROCEDURE [dbo].[USP_User_ChangePassword]
	@id				INT,
	@passwordHash	VARBINARY(MAX),
	@salt			VARBINARY(MAX)
AS
	UPDATE [User] SET
		[PasswordHash] = @passwordHash,
		[Salt] = @salt
	WHERE [Id] = @id
RETURN 0

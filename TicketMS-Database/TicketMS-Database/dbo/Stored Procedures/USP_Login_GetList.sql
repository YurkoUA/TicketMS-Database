CREATE PROCEDURE [dbo].[USP_Login_GetList]
	@userId INT,
	@offset INT = 0,
	@take	INT = 10
AS
	SELECT * FROM [Login]
	WHERE [UserId] = @userId
	ORDER BY [Id] DESC
	OFFSET @offset ROWS
	FETCH NEXT @take ROWS ONLY
RETURN 0

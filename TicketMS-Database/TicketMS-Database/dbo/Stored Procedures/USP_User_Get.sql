CREATE PROCEDURE [dbo].[USP_User_Get]
	@id INT
AS
	SELECT	[u].[Id],
			[u].[Email],
			[u].[UserName],
			[u].[TelegramId],
			[u].[PasswordHash],
			[u].[Salt],

			-- Role
			[r].[Id],
			[r].[Name],
			[r].[Description]

	FROM [User] AS [u]
	JOIN [Role] AS [r] ON [r].[Id] = [u].[RoleId]

	WHERE [u].[Id] = @id
RETURN 0

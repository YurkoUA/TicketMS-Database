CREATE PROCEDURE [dbo].[USP_Package_Find]
	@Name NVARCHAR(MAX)
AS
	SELECT *
	FROM [v_Packages] AS [p]
	WHERE [p].[Name] LIKE CONCAT('%', @Name, '%')
	ORDER BY [p].[Id]

RETURN 0

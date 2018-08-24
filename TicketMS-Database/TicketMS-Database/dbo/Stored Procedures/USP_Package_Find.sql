CREATE PROCEDURE [dbo].[USP_Package_Find]
	@name NVARCHAR(MAX)
AS
	SELECT *
	FROM [v_Packages] AS [p]
	WHERE [p].[Name] LIKE CONCAT('%', @name, '%')
	ORDER BY [p].[Id]

RETURN 0

CREATE PROCEDURE [dbo].[USP_Notes_Find]
	@text NVARCHAR(MAX)
AS
	SELECT DISTINCT 
		[t].[Note]						AS [Note],
		CHARINDEX(@text, [t].[Note])	AS [index],
		LEN([Note])						AS [length]

	FROM [Ticket] AS [t]
	WHERE [t].[Note] LIKE CONCAT('%', @text, '%')
	ORDER BY [index], [length], [Note]
RETURN 0

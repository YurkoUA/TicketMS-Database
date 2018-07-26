CREATE PROCEDURE [dbo].[USP_Notes_Find]
	@Text NVARCHAR(MAX)
AS
	SELECT DISTINCT 
		[t].[Note]						AS [Note]
		,CHARINDEX(@Text, [t].[Note])	AS [index]
		,LEN([Note])					AS [length]

	FROM [Ticket] AS [t]
	WHERE [t].[Note] LIKE CONCAT('%', @Text, '%')
	ORDER BY [index], [length], [Note]
RETURN 0

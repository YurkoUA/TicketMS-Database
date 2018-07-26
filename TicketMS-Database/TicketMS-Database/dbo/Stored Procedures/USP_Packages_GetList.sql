CREATE PROCEDURE [dbo].[USP_Packages_GetList]
	@offset INT = 0,
	@take	INT = 20,

	@onlyOpened BIT = 0,
	@onlySpecial BIT = 0
AS
	SELECT *
	FROM [v_Packages] AS [p]

	WHERE ((@onlyOpened = 1		AND [p].[IsOpened] = 1)		OR @onlyOpened = 0)
		AND ((@onlySpecial = 1	AND [p].[IsSpecial] = 1)	OR @onlySpecial = 0)

	ORDER BY ([p].[IsOpened] & [p].[IsSpecial])				DESC, 
			([p].[IsOpened] & ([p].[IsSpecial] ^ 1))		DESC, 
			(([p].[IsOpened] ^ 1) & ([p].[IsSpecial] ^ 1))	DESC, 
			(([p].[IsOpened] ^ 1) & [p].[IsSpecial])		ASC

	OFFSET @offset ROWS
	FETCH NEXT @take ROWS ONLY
RETURN 0

CREATE PROCEDURE [dbo].[USP_Package_GetList]
	@offset INT = 0,
	@take	INT = 20,

	@onlyOpened BIT = 0,
	@onlySpecial BIT = 0,

	@total INT OUTPUT
AS
	SELECT *
	FROM [v_Packages] AS [p]

	WHERE ((@onlyOpened = 1		AND [p].[IsOpened] = 1)		OR @onlyOpened = 0)
		AND ((@onlySpecial = 1	AND [p].[IsSpecial] = 1)	OR @onlySpecial = 0)

	ORDER BY ([p].[IsOpened] & [p].[IsSpecial])				DESC, 
			([p].[IsOpened] & ([p].[IsSpecial] ^ 1))		DESC, 
			(([p].[IsOpened] ^ 1) & ([p].[IsSpecial] ^ 1))	DESC, 
			(([p].[IsOpened] ^ 1) & [p].[IsSpecial])		ASC,
			[p].[PackageId] DESC

	OFFSET @offset ROWS
	FETCH NEXT @take ROWS ONLY

	SET @total = [dbo].[fn_Package_Count](@onlyOpened, @onlySpecial)
RETURN 0

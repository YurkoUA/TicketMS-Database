CREATE PROCEDURE [dbo].[USP_Packages_Filter]
	@firstDigit INT = NULL,
	@serialId	INT = NULL,
	@colorId	INT = NULL
AS
	SELECT *
	FROM [v_Packages] AS [p]
	WHERE ((@firstDigit IS NOT NULL		AND [p].[FirstNumber] = @firstDigit)		OR @firstDigit IS NULL)
		AND		((@serialId IS NOT NULL	AND [p].[SerialId] = @serialId)				OR @serialId IS NULL)
		AND		((@colorId IS NOT NULL	AND [p].[ColorId] = @colorId)				OR @colorId IS NULL)

ORDER BY [p].[Id]
RETURN 0

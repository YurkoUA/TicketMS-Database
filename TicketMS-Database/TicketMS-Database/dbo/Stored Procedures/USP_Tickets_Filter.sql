CREATE PROCEDURE [dbo].[USP_Tickets_Filter]
	@firstDigit INT = NULL,
	@serialId	INT = NULL,
	@colorId	INT = NULL,

	@offset INT = 0,
	@take INT = 20
AS
	SELECT * 
	FROM [v_Tickets] AS [t]
	WHERE ((@firstDigit IS NOT NULL		AND LEFT([t].[Number], 1) = @firstDigit)		OR @firstDigit IS NULL)
		AND		((@serialId IS NOT NULL	AND [t].[SerialId] = @serialId)				OR @serialId IS NULL)
		AND		((@colorId IS NOT NULL	AND [t].[ColorId] = @colorId)				OR @colorId IS NULL)

	ORDER BY [t].[Number]
	
	OFFSET @offset ROWS
	FETCH NEXT @take ROWS ONLY

RETURN 0

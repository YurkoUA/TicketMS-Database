CREATE PROCEDURE [dbo].[USP_Ticket_Filter]
	@firstDigit INT = NULL,
	@serialId	INT = NULL,
	@colorId	INT = NULL,
	@nominalId	INT = NULL,

	@onlyUnallocated BIT = 0,

	@offset INT = 0,
	@take INT = 20
AS
	SELECT * 
	FROM [v_Tickets] AS [t]
	WHERE		((@firstDigit IS NOT NULL	AND [t].[FirstDigit] = @firstDigit)		OR @firstDigit IS NULL)
		AND		((@serialId IS NOT NULL		AND [t].[SerialId] = @serialId)			OR @serialId IS NULL)
		AND		((@colorId IS NOT NULL		AND [t].[ColorId] = @colorId)			OR @colorId IS NULL)
		AND		((@nominalId IS NOT NULL	AND [t].[NominalId] = @nominalId)		OR @nominalId IS NULL)

		AND		((@onlyUnallocated = 1		AND [t].[PackageId] IS NULL)			OR @onlyUnallocated = 0)

	ORDER BY [t].[Number]
	
	OFFSET @offset ROWS
	FETCH NEXT @take ROWS ONLY

RETURN 0

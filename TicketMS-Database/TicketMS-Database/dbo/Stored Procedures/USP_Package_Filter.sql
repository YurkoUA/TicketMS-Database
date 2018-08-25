CREATE PROCEDURE [dbo].[USP_Package_Filter]
	@firstDigit INT = NULL,
	@serialId	INT = NULL,
	@colorId	INT = NULL,
	@nominalId	INT = NULL
AS
	SELECT *
	FROM [v_Packages] AS [p]
	WHERE ((@firstDigit IS NOT NULL			AND [p].[FirstDigit] = @firstDigit)			OR @firstDigit IS NULL)
		AND		((@serialId IS NOT NULL		AND [p].[SerialId] = @serialId)				OR @serialId IS NULL)
		AND		((@colorId IS NOT NULL		AND [p].[ColorId] = @colorId)				OR @colorId IS NULL)
		AND		((@nominalId IS NOT NULL	AND [p].[NominalId] = @nominalId)			OR @nominalId IS NULL)

ORDER BY [p].[PackageId]
RETURN 0

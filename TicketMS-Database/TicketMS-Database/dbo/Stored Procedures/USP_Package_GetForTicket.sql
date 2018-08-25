CREATE PROCEDURE [dbo].[USP_Package_GetForTicket]
	@colorId	INT,
	@serialId	INT,
	@nominalId	INT,
	@firstDigit	INT
AS
	SELECT *
	FROM [v_Packages] AS [p]

	WHERE [p].[IsOpened] = 1
		AND ([p].[ColorId]		= @colorId		OR [p].[ColorId]	IS NULL)
		AND ([p].[SerialId]		= @serialId		OR [p].[SerialId]	IS NULL)
		AND ([p].[FirstDigit]	= @firstDigit	OR [p].[FirstDigit] IS NULL)
		AND ([p].[NominalId]	= @nominalId)

	ORDER BY [p].[IsSpecial], [p].[PackageId]

RETURN 0

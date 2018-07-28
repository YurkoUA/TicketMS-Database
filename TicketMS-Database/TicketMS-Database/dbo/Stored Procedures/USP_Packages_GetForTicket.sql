CREATE PROCEDURE [dbo].[USP_Packages_GetForTicket]
	@ColorId	INT,
	@SerialId	INT,
	@FirstDigit	INT
AS
	SELECT *
	FROM [v_Packages] AS [p]

	WHERE [p].[IsOpened] = 1
		AND ([p].[ColorId]		= @ColorId		OR [p].[ColorId]	IS NULL)
		AND ([p].[SerialId]		= @SerialId		OR [p].[SerialId]	IS NULL)
		AND ([p].[FirstDigit]	= @FirstDigit	OR [p].[FirstDigit] IS NULL)

	ORDER BY [p].[IsSpecial], [p].[Id]

RETURN 0

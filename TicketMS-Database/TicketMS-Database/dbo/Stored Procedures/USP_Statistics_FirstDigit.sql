CREATE PROCEDURE [dbo].[USP_Statistics_FirstDigit]
	@StartDate DATETIME,
	@EndDate DATETIME
AS
	SELECT LEFT([t].[Number], 1)	AS [Name]
		,COUNT(*)					AS [Count]

	FROM [Ticket] AS [t]
	WHERE [t].[AddDate] BETWEEN @StartDate AND @EndDate

	GROUP BY LEFT([t].[Number], 1)
	ORDER BY [Name]
RETURN 0

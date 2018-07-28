CREATE PROCEDURE [dbo].[USP_Statistics_Colors]
	@StartDate DATETIME,
	@EndDate DATETIME
AS
	SELECT [s].[Name]			AS [Name]
		,COUNT([t].[ColorId])	AS [Count]

	FROM [Color] AS [s]

	LEFT JOIN [Ticket] AS [t] ON [t].[ColorId] = [s].[Id]
	WHERE [t].[CreatedDate] BETWEEN @StartDate AND @EndDate

	GROUP BY [s].[Name]
	ORDER BY [Count] DESC
RETURN 0

CREATE PROCEDURE [dbo].[USP_Statistics_Colors]
	@startDate DATETIME,
	@endDate DATETIME
AS
	SELECT	[c].[Name],
			[c].[PaletteName],
			COUNT([t].[ColorId]) AS [Count]

	FROM [Color] AS [c]

	LEFT JOIN [Ticket] AS [t] ON [t].[ColorId] = [c].[Id]
	WHERE [t].[CreatedDate] BETWEEN @startDate AND @endDate

	GROUP BY [c].[Name]
	ORDER BY [Count] DESC
RETURN 0

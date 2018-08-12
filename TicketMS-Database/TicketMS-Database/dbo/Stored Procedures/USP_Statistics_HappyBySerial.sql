CREATE PROCEDURE [dbo].[USP_Statistics_HappyBySerial]
	@startDate	DATETIME,
	@endDate	DATETIME
AS
	SELECT	[s].[Name],
			COUNT([t].[ColorId]) AS [Count]

	FROM [Serial] AS [s]

	LEFT JOIN [Ticket] AS [t] ON [t].[SerialId] = [s].[Id]

	WHERE [t].[CreatedDate] BETWEEN @startDate AND @endDate
		AND [dbo].[fn_Number_IsHappy]([t].[Number]) = 1

	GROUP BY [s].[Name]
	ORDER BY [Count] DESC
RETURN 0

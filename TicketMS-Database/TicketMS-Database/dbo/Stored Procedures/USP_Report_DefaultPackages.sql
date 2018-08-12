CREATE PROCEDURE [dbo].[USP_Report_DefaultPackages]
	@startDate	DATETIME,
	@endDate	DATETIME
AS
	SELECT	[p].[Id],
			[p].[SerialName],
			[p].[Name],
			COUNT(*)				AS [TicketsCount],
			[NewTickets].[Count]	AS [NewTicketsCount]

	FROM [v_Packages] AS [p]
	JOIN [Ticket] AS [t] ON [t].[PackageId] = [p].[Id]

	CROSS APPLY
	(
		SELECT COUNT(*) AS [Count]
		FROM [Ticket] AS [t]
		WHERE [t].[PackageId] = [p].[Id]
			AND [t].[LastMovedDate] BETWEEN @startDate AND @endDate
	) AS [NewTickets]

	WHERE [p].[IsSpecial] = 0 AND [p].[CreatedDate] <= @endDate

	GROUP BY [p].[Id], [p].[SerialName], [p].[Name], [NewTickets].[Count]
	ORDER BY [p].[Id]
RETURN 0

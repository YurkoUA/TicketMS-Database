CREATE PROCEDURE [dbo].[USP_Report_SpecialPackages]
	@startDate	DATETIME,
	@endDate	DATETIME
AS
	DECLARE @lastReportId INT = [dbo].[fn_Report_GetLastId]()

	SELECT	[p].[Id],
			[p].[Name],
			COUNT(*) AS [TicketsCount],
			IIF(@lastReportId IS NOT NULL, [dbo].[fn_ReportPackage_GetNewTicketsCount](@lastReportId), [dbo].[fn_Package_TicketsCount]([p].[Id]))	AS [NewTicketsCount]

	FROM [v_Packages] AS [p]
	JOIN [Ticket] AS [t] ON [t].[PackageId] = [p].[Id]

	WHERE [p].[IsSpecial] = 1 AND [p].[CreatedDate] <= @endDate

	GROUP BY [p].[Id], [p].[Name]
	ORDER BY [p].[Id]
RETURN 0

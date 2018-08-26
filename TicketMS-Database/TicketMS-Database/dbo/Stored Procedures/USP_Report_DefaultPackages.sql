CREATE PROCEDURE [dbo].[USP_Report_DefaultPackages]
	@startDate	DATETIME,
	@endDate	DATETIME
AS
	DECLARE @lastReportId INT = [dbo].[fn_Report_GetLastId]()

	SELECT	[p].[PackageId]		AS [Id],
			[p].[PackageName]	AS [Name],
			[p].[SerialName],
			COUNT(*)			AS [TicketsCount],
			IIF(@lastReportId IS NOT NULL, [dbo].[fn_ReportPackage_GetNewTicketsCount](@lastReportId), [dbo].[fn_Package_TicketsCount]([p].[PackageId]))	
				AS [NewTicketsCount]

	FROM [v_Packages] AS [p]
	JOIN [Ticket] AS [t] ON [t].[PackageId] = [p].[PackageId]

	WHERE [p].[IsSpecial] = 0 AND [p].[CreatedDate] <= @endDate

	GROUP BY [p].[PackageId], [p].[SerialName], [p].[PackageName]
	ORDER BY [p].[PackageId]
RETURN 0

CREATE PROCEDURE [dbo].[USP_Report_TicketsFromDefaultAndUnallocatedPackages]
AS
	DECLARE @lastReportDate DATETIME = [dbo].[fn_Report_GetLastDate]()

	SELECT	SUM(CASE p.[IsSpecial] WHEN 0 THEN 1 ELSE 0 END)		AS [FromDefaultPackagesCount],

			SUM(CASE WHEN (p.[IsSpecial] = 0 AND @lastReportDate IS NOT NULL AND t.[CreatedDate] >= @lastReportDate) THEN 1 ELSE 0 END) 
																	AS [FromDefaultPackagesNewCount],

			SUM(CASE WHEN t.[PackageId] IS NULL THEN 1 ELSE 0 END)	AS [UnallocatedCount],

			SUM(CASE WHEN (t.[PackageId] IS NULL AND @lastReportDate IS NOT NULL AND t.[CreatedDate] >= @lastReportDate) THEN 1 ELSE 0 END)
																	AS [UnallocatedNewCount]

	FROM [Ticket] AS [t]
	LEFT JOIN [Package] AS [p] ON [p].[Id] = [t].[PackageId]
RETURN 0

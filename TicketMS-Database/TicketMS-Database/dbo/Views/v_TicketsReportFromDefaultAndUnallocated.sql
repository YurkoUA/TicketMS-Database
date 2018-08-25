CREATE VIEW [dbo].[v_TicketsReportFromDefaultAndUnallocated]
AS

SELECT	SUM(CASE p.[IsSpecial] WHEN 0 THEN 1 ELSE 0 END)		AS [FromDefaultPackagesCount],
		SUM(CASE WHEN t.[PackageId] IS NULL THEN 1 ELSE 0 END)	AS [UnallocatedCount]

FROM [Ticket] AS [t]
LEFT JOIN [Package] AS [p] ON [p].[Id] = [t].[PackageId]

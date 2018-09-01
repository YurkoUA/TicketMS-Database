CREATE PROCEDURE [dbo].[USP_ReportPackage_Get]
	@reportId INT
AS
	SELECT	p.[PackageId]		AS [Id], 
			p.[PackageName]		AS [Name], 
			p.[SerialName], 
			rp.[TicketsCount], 
			p.[IsSpecial]

	FROM [ReportPackage] AS [rp]
	JOIN [v_Packages] AS [p] ON p.[PackageId] = rp.[PackageId]
	WHERE rp.[ReportId] = @reportId
	ORDER BY p.[PackageId]
RETURN 0

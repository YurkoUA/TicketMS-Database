CREATE PROCEDURE [dbo].[USP_ReportPackage_Insert]
	@reportId INT
AS
	INSERT INTO [ReportPackage]([ReportId], [PackageId], [TicketsCount])
	SELECT @reportId, [p].[Id], COUNT(*)
	FROM [Package] AS [p]
	LEFT JOIN [Ticket] AS [t] ON [t].[PackageId] = [p].[Id]
	GROUP BY [p].[Id]
RETURN 0

CREATE FUNCTION [dbo].[fn_ReportPackage_TicketsCount]
(
	@reportId INT,
	@packageId INT
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT TOP 1 [TicketsCount] FROM [ReportPackage] WHERE [ReportId] = @reportId AND [PackageId] = @packageId)
END

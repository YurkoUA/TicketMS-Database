CREATE FUNCTION [dbo].[fn_ReportPackage_GetNewTicketsCount]
(
	@reportId INT,
	@packageId INT
)
RETURNS INT
AS
BEGIN
	RETURN ([dbo].[fn_Package_TicketsCount](@packageId) - [dbo].[fn_ReportPackage_TicketsCount](@reportId, @packageId))
END

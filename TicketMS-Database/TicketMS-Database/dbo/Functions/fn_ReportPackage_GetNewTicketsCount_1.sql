CREATE FUNCTION [dbo].[fn_ReportPackage_GetNewTicketsCount]
(
	@reportId INT,
	@packageId INT
)
RETURNS INT
AS
BEGIN
	RETURN ([dbo].[fn_Package_TicketsCount]([p].[Id]) - [dbo].[fn_ReportPackage_TicketsCount](@reportId, [p].[Id]))
END

CREATE FUNCTION [dbo].[fn_Package_TicketsCount]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(*) FROM [Ticket] WHERE [PackageId] = @id)
END

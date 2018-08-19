CREATE FUNCTION [dbo].[fn_Package_TicketsCount]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	DECLARE @count INT

	SELECT @count = COUNT(*)
	FROM [Ticket]
	WHERE [PackageId] = [Id]

	RETURN @count
END

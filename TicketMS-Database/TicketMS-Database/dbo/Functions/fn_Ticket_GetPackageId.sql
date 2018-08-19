CREATE FUNCTION [dbo].[fn_Ticket_GetPackageId]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	DECLARE @packageId INT

	SELECT @packageId = [PackageId]
	FROM [Ticket]
	WHERE [Id] = @id

	RETURN @packageId
END

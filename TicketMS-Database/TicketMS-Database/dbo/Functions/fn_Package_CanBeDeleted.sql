CREATE FUNCTION [dbo].[fn_Package_CanBeDeleted]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Ticket] AS [t] WHERE [t].[PackageId] = @id)
		RETURN 0

	RETURN 1
END

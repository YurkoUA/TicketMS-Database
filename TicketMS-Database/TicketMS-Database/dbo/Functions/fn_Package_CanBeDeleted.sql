CREATE FUNCTION [dbo].[fn_Package_CanBeDeleted]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Package] WHERE [Id] = @id AND [IsDeleted] = 1)
		RETURN 0

	IF EXISTS (SELECT 1 FROM [Ticket] WHERE [PackageId] = @id)
		RETURN 0

	RETURN 1
END

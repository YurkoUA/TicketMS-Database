CREATE FUNCTION [dbo].[fn_Package_CanBeDeleted]
(
	@Id INT
)
RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Ticket] AS [t] WHERE [t].[PackageId] = @Id)
		RETURN 0

	RETURN 1
END

CREATE FUNCTION [dbo].[fn_Color_CanBeDeleted]
(
	@Id INT
)
RETURNS INT
AS
BEGIN
	IF (EXISTS (SELECT 1 FROM [Package] AS [p] WHERE [p].[ColorId] = @Id) OR EXISTS (SELECT 1 FROM [Ticket] AS [t] WHERE [t].[ColorId] = @Id))
		RETURN 0

	RETURN 1
END

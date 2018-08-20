CREATE FUNCTION [dbo].[fn_Color_CanBeDeleted]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	IF (EXISTS (SELECT 1 FROM [Package] AS [p] WHERE [p].[ColorId] = @id) OR EXISTS (SELECT 1 FROM [Ticket] AS [t] WHERE [t].[ColorId] = @id))
		RETURN 0

	RETURN 1
END

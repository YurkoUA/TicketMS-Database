CREATE FUNCTION [dbo].[fn_Serial_CanBeDeleted]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	IF (EXISTS (SELECT 1 FROM [Package] AS [p] WHERE [p].[SerialId] = @id) OR EXISTS (SELECT 1 FROM [Ticket] AS [t] WHERE [t].[SerialId] = @id))
		RETURN 0

	RETURN 1
END

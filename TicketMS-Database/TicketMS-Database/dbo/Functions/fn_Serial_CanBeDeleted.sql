CREATE FUNCTION [dbo].[fn_Serial_CanBeDeleted]
(
	@Id INT
)
RETURNS INT
AS
BEGIN
	IF (EXISTS (SELECT 1 FROM [Package] AS [p] WHERE [p].[SerialId] = @Id) OR EXISTS (SELECT 1 FROM [Ticket] AS [t] WHERE [t].[SerialId] = @Id))
		RETURN 0

	RETURN 1
END

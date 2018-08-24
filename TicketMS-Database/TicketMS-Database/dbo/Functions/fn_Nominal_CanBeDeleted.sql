CREATE FUNCTION [dbo].[fn_Nominal_CanBeDeleted]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	IF (EXISTS (SELECT 1 FROM [Package] AS [p] WHERE [p].[NominalId] = @id) OR EXISTS (SELECT 1 FROM [Ticket] AS [t] WHERE [t].[NominalId] = @id))
		RETURN 0

	RETURN 1
END

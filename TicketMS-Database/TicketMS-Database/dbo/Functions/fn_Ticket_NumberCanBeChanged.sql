CREATE FUNCTION [dbo].[fn_Ticket_NumberCanBeChanged]
(
	@id INT,
	@newNumber NVARCHAR(6)
)
RETURNS BIT
AS
BEGIN
	DECLARE @firstDigit INT = (CONVERT(INT, LEFT(@newNumber, 1)))
	DECLARE @packageFirstDigit INT

	SELECT @packageFirstDigit = [p].[FirstDigit]
	FROM [Ticket] AS [t]
	JOIN [Package] AS [p] ON [p].[Id] = [t].[PackageId]
	WHERE [t].[Id] = @id

	IF (@packageFirstDigit IS NULL OR @packageFirstDigit = @firstDigit)
		RETURN 1

	RETURN 0
END

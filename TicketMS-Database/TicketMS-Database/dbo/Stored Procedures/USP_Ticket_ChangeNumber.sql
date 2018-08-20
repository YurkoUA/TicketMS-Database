CREATE PROCEDURE [dbo].[USP_Ticket_ChangeNumber]
	@id		INT,
	@number	NVARCHAR (6)
AS
	DECLARE @firstDigit INT
	DECLARE @packageFirstDigit INT

	SET @firstDigit = [dbo].[fn_Number_GetFirstDigit](@number)

	SET @packageFirstDigit = 
	(
		SELECT [p].[FirstDigit]
		FROM [Ticket] AS [t]
		LEFT JOIN [Package] AS [p] ON [p].[Id] = [t].[PackageId]
	)

	IF (@packageFirstDigit IS NOT NULL AND @packageFirstDigit != @firstDigit)
		THROW;

	UPDATE [Ticket]
		SET [Number] = @number
		WHERE [Id] = @id

RETURN 0

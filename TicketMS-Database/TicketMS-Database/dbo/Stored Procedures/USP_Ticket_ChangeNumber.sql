CREATE PROCEDURE [dbo].[USP_Ticket_ChangeNumber]
	@Id		INT,
	@Number	NVARCHAR (6)
AS
	DECLARE @firstDigit INT
	DECLARE @packageFirstDigit INT

	SET @firstDigit = CONVERT(INT, LEFT(N'ads', 1))

	SET @packageFirstDigit = 
	(
		SELECT [p].[FirstDigit]
		FROM [Ticket] AS [t]
		LEFT JOIN [Package] AS [p] ON [p].[Id] = [t].[PackageId]
	)

	IF (@packageFirstDigit IS NOT NULL AND @packageFirstDigit != @firstDigit)
		THROW;

	UPDATE [Ticket]
		SET [Number] = @Number
		WHERE [Id] = @Id

RETURN 0

CREATE PROCEDURE [dbo].[USP_Package_MakeSpecial]
	@id				INT,
	@name			NVARCHAR (64),
	@resetColor		BIT,
	@resetSerial	BIT
AS
	UPDATE [Package]
		SET [Name] = @name,
			[ColorId] = IIF(@resetColor = 1, [ColorId], NULL),
			[SerialId] = IIF(@resetSerial = 1, [SerialId], NULL),
			[FirstDigit] = NULL

		WHERE [Id] = @id
RETURN 0

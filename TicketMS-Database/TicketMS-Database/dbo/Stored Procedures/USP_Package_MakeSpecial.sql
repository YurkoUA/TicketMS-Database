CREATE PROCEDURE [dbo].[USP_Package_MakeSpecial]
	@Id				INT,
	@Name			NVARCHAR (64),
	@ResetColor		BIT,
	@ResetSerial	BIT
AS
	UPDATE [Package]
		SET [Name] = @Name,
			[ColorId] = IIF(@ResetColor = 1, [ColorId], NULL),
			[SerialId] = IIF(@ResetSerial = 1, [SerialId], NULL),
			[FirstDigit] = NULL

		WHERE [Id] = @Id
RETURN 0

CREATE PROCEDURE [dbo].[USP_Package_MakeSpecial]
	@id				INT,
	@name			NVARCHAR (64),
	@resetColor		BIT,
	@resetSerial	BIT
AS
	IF ([dbo].[fn_Package_Exists](@name, @id) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Спеціальна пачка з іменем "', @name, N'" вже існує.');
		THROW 50002, @msg, 1;
	END

	UPDATE [Package] SET 
		[Name] = @name,
		[ColorId] = IIF(@resetColor = 1, [ColorId], NULL),
		[SerialId] = IIF(@resetSerial = 1, [SerialId], NULL),
		[FirstDigit] = NULL

		WHERE [Id] = @id
RETURN 0

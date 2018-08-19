CREATE PROCEDURE [dbo].[USP_Package_MakeDefault]
	@id			INT,
	@colorId	INT,
	@serialId	INT,
	@firstDigit	INT
AS
	UPDATE [Package]
		SET [Name] = NULL,
			[IsSpecial] = 0,
			[ColorId] = @colorId,
			[SerialId] = @serialId,
			[FirstDigit] = @firstDigit

	WHERE [Id] = @id
RETURN 0

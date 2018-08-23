CREATE PROCEDURE [dbo].[USP_Package_MakeDefault]
	@id			INT,
	@colorId	INT,
	@serialId	INT,
	@nominalId	INT,
	@firstDigit	INT
AS
	IF ([dbo].[fn_Package_CanBeEdited](@id, @colorId, @serialId, @nominalId, @firstDigit) = 0)
	BEGIN;
		THROW 50002, N'Пачка не може бути відредагована.', 1;
	END

	UPDATE [Package] SET 
		[Name] = NULL,
		[IsSpecial] = 0,
		[ColorId] = @colorId,
		[SerialId] = @serialId,
		[NominalId] = @nominalId,
		[FirstDigit] = @firstDigit

	WHERE [Id] = @id
RETURN 0

CREATE PROCEDURE [dbo].[USP_Package_EditDefault]
	@id			INT,
	@colorId	INT,
	@serialId	INT,
	@nominalId	INT,
	@firstDigit	INT,
	@note		NVARCHAR(128)
AS
	IF ([dbo].[fn_Package_CanBeEdited](@id, @colorId, @serialId, @nominalId, @firstDigit) = 0)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = N'Неможливо відредагувати пачку.';
		THROW 50002, @msg, 1;
	END

	UPDATE [Package] SET
		[ColorId] = @colorId,
		[SerialId] = @serialId,
		[NominalId] = @nominalId,
		[FirstDigit] = @firstDigit,
		[Note] = @note
	WHERE [Id] = @id

RETURN 0

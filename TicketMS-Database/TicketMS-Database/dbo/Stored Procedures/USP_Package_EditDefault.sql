CREATE PROCEDURE [dbo].[USP_Package_EditDefault]
	@id			INT,
	@colorId	INT,
	@serialId	INT,
	@nominalId	INT,
	@firstDigit	INT,
	@note		NVARCHAR(128)
AS
	-- TODO: Validate.

	UPDATE [Package] SET
		[ColorId] = @colorId,
		[SerialId] = @serialId,
		[NominalId] = @nominalId,
		[FirstDigit] = @firstDigit,
		[Note] = @note
	WHERE [Id] = @id

RETURN 0

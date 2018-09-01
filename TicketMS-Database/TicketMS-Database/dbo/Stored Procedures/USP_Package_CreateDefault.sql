CREATE PROCEDURE [dbo].[USP_Package_CreateDefault]
	@colorId	INT,
	@serialId	INT,
	@firstDigit	INT,
	@nominalId	INT,
	@note		NVARCHAR(128),

	@id			INT OUTPUT
AS
	INSERT INTO [Package]([ColorId], [SerialId], [FirstDigit], [NominalId], [Note])
			VALUES (@colorId, @serialId, @firstDigit, @nominalId, @note)

	SET @id = SCOPE_IDENTITY()

RETURN 0

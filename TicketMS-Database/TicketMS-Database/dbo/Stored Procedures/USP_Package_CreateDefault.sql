CREATE PROCEDURE [dbo].[USP_Package_CreateDefault]
	@colorId	INT,
	@serialId	INT,
	@firstDigit	INT,
	@nominalId	INT,
	@note		NVARCHAR(128)
AS
	DECLARE @id INT

	INSERT INTO [Package]([ColorId], [SerialId], [FirstDigit], [NominalId], [Note])
			VALUES (@colorId, @serialId, @firstDigit, @nominalId, @note)

	SET @id = SCOPE_IDENTITY()
RETURN @id

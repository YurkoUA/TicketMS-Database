CREATE PROCEDURE [dbo].[USP_Package_CreateSpecial]
	@name		NVARCHAR (64),
	@colorId	INT,
	@serialId	INT,
	@nominalId	INT,
	@note		NVARCHAR(128)
AS
	DECLARE @id INT

	INSERT INTO [Package]([Name], [ColorId], [SerialId], [NominalId], [Note], [IsSpecial])
		VALUES (@name, @colorId, @serialId, @nominalId, @note, 1)

	SELECT @id = SCOPE_IDENTITY()
RETURN @id

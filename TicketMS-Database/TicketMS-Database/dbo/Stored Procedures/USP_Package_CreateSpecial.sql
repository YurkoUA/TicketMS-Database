CREATE PROCEDURE [dbo].[USP_Package_CreateSpecial]
	@Name		NVARCHAR (64),
	@ColorId	INT,
	@SerialId	INT,
	@NominalId	INT,
	@Note		NVARCHAR(128)
AS
	DECLARE @isSpecial BIT = 1

	INSERT INTO [Package]([Name], [ColorId], [SerialId], [NominalId], [Note], [IsSpecial])
		VALUES (@Name, @ColorId, @SerialId, @NominalId, @Note, @isSpecial)
RETURN 0

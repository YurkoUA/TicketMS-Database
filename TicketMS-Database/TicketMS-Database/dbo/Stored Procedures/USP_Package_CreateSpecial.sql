CREATE PROCEDURE [dbo].[USP_Package_CreateSpecial]
	@Name		NVARCHAR (64),
	@ColorId	INT,
	@SerialId	INT,
	@Nominal	REAL,
	@Note		NVARCHAR(128)
AS
	DECLARE @isSpecial BIT = 1

	INSERT INTO [Package]([Name], [ColorId], [SerialId], [Nominal], [Note], [IsSpecial])
		VALUES (@Name, @ColorId, @SerialId, @Nominal, @Note, @isSpecial)
RETURN 0

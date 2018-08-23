CREATE PROCEDURE [dbo].[USP_Package_CreateSpecial]
	@name		NVARCHAR (64),
	@colorId	INT,
	@serialId	INT,
	@nominalId	INT,
	@note		NVARCHAR(128)
AS
	IF ([dbo].[fn_Package_Exists](@name) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Спеціальна пачка з іменем "', @name, N'" вже існує.');
		THROW 50001, @msg, 1;
	END

	INSERT INTO [Package]([Name], [ColorId], [SerialId], [NominalId], [Note], [IsSpecial])
		VALUES (@name, @colorId, @serialId, @nominalId, @note, 1)

	DECLARE @id INT = SCOPE_IDENTITY()
RETURN @id

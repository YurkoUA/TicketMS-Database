CREATE PROCEDURE [dbo].[USP_Package_EditSpecial]
	@id			INT,
	@name		NVARCHAR (64),
	@colorId	INT,
	@serialId	INT,
	@nominalId	INT,
	@note		NVARCHAR(128)
AS
	IF ([dbo].[fn_Package_Exists](@name, @id) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Спеціальна пачка з іменем "', @name, N'" вже існує.');
		THROW 50002, @msg, 1;
	END

	-- TODO: CanBeEdited.

	UPDATE [Package] SET
		[Name] = @name,
		[ColorId] = @colorId,
		[SerialId] = @serialId,
		[NominalId] = @nominalId,
		[Note] = @note
	WHERE [Id] = @id

RETURN 0

CREATE PROCEDURE [dbo].[USP_Color_Update]
	@id				INT,
	@name			NVARCHAR(32),
	@paletteName	NVARCHAR(32)
AS
	IF ([dbo].[fn_Color_Exists](@name, @paletteName, @id) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Колір з назвою "', @name, N'" або кодом "', @paletteName, N'" вже існує.');
		THROW 50002, @msg, 1;
	END

	UPDATE [Color] SET 
		[Name] = @name,
		[PaletteName] = @paletteName
	WHERE [Id] = @id

RETURN 0

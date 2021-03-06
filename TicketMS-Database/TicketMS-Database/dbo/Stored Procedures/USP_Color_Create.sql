﻿CREATE PROCEDURE [dbo].[USP_Color_Create]
	@name			NVARCHAR(32),
	@paletteName	NVARCHAR(32),

	@id				INT OUTPUT
AS
	IF ([dbo].[fn_Color_Exists](@name, @paletteName, NULL) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Колір з назвою "', @name, N'" або кодом "', @paletteName, N'" вже існує.');
		THROW 50001, @msg, 1;
	END

	INSERT INTO [Color]([Name], [PaletteName])
		VALUES (@name, @paletteName)

	SET @id = SCOPE_IDENTITY()

RETURN 

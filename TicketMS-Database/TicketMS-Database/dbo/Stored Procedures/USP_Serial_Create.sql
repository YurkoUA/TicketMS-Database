﻿CREATE PROCEDURE [dbo].[USP_Serial_Create]
	@name	NVARCHAR(4),
	@note	NVARCHAR(128),

	@id		INT OUTPUT
AS
	IF ([dbo].[fn_Serial_Exists](@name, NULL) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Серія з назвою "', @name, N'" вже існує.');
		THROW 50001, @msg, 1;
	END

	INSERT INTO [Serial]([Name], [Note])
		VALUES(@name, @note)

	SET @id = SCOPE_IDENTITY()

RETURN 0

CREATE PROCEDURE [dbo].[USP_Serial_Update]
	@name	NVARCHAR(4),
	@note	NVARCHAR(128),
	@id		INT
AS
	IF ([dbo].[fn_Serial_Exists](@name, @id) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Серія з назвою "', @name, N'" вже існує.');
		THROW 50002, @msg, 1;
	END

	UPDATE [Serial] SET
		[Name] = @name,
		[Note] = @note
	WHERE [Id] = @id

RETURN 0

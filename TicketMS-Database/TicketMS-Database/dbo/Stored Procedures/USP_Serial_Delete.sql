CREATE PROCEDURE [dbo].[USP_Serial_Delete]
	@id INT
AS
	IF ([dbo].[fn_Serial_CanBeDeleted](@id) = 0)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = N'Серію не може бути видалено, оскільки є пачки або квитки, що посилаються на нього';
		THROW 50003, @msg, 1;
	END

	DELETE FROM [Serial] WHERE [Id] = @id
RETURN 0

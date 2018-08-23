CREATE PROCEDURE [dbo].[USP_Color_Delete]
	@id INT
AS
	IF ([dbo].[fn_Color_CanBeDeleted](@id) = 0)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = N'Колір не може бути видалено, оскільки є пачки або квитки, що посилаються на нього';
		THROW 50003, @msg, 1;
	END

	DELETE FROM [Color] WHERE [Id] = @id
RETURN 0

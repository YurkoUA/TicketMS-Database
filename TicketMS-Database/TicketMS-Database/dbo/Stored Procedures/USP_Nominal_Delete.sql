CREATE PROCEDURE [dbo].[USP_Nominal_Delete]
	@id INT
AS
	IF ([dbo].[fn_Nominal_CanBeDeleted](@id) = 0)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = N'Номінал не може бути видалено, оскільки є пачки або квитки, що посилаються на нього.';
		THROW 50003, @msg, 1;
	END

	DELETE FROM [Nominal] WHERE [Id] = @id
RETURN 0

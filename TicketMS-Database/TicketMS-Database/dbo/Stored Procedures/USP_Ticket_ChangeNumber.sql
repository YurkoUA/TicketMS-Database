CREATE PROCEDURE [dbo].[USP_Ticket_ChangeNumber]
	@id		INT,
	@number	NVARCHAR (6)
AS
	IF ([dbo].[fn_Ticket_NumberCanBeChanged](@number) = 0)
	BEGIN;
		THROW 50002, N'Номер не може бути змінено.', 1;
	END

	UPDATE [Ticket] SET
		[Number] = @number
		WHERE [Id] = @id

RETURN 0

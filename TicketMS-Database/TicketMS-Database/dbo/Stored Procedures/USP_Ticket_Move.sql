CREATE PROCEDURE [dbo].[USP_Ticket_Move]
	@ticketId	INT,
	@packageId	INT
AS
	IF ([dbo].[fn_Ticket_CanBeMoved](@ticketId, @packageId) = 0)
	BEGIN;
		THROW 50002, N'Квиток не може бути переміщено до пачки.', 1;
	END

	UPDATE [Ticket] SET [PackageId] = @packageId
	WHERE [Id] = @ticketId

RETURN 0

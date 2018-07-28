CREATE PROCEDURE [dbo].[USP_Ticket_Move]
	@TicketId	INT,
	@PackageId	INT
AS
	UPDATE [Ticket]
		SET [Ticket].[PackageId] = @PackageId
		WHERE [Ticket].[Id] = @TicketId

RETURN 0

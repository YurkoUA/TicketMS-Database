CREATE PROCEDURE [dbo].[USP_Ticket_Move]
	@ticketId	INT,
	@packageId	INT
AS
	UPDATE [Ticket] SET [PackageId] = @packageId
	WHERE [Id] = @ticketId

RETURN 0

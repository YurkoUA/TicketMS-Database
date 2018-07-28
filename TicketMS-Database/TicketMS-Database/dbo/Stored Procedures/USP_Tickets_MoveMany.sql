CREATE PROCEDURE [dbo].[USP_Tickets_MoveMany]
	@TicketsIds	IntArrayType READONLY,
	@PackageId	INT
AS
	UPDATE [Ticket]
		SET [Ticket].[PackageId] = @PackageId
		WHERE [Ticket].[Id] IN (SELECT [Item] FROM @TicketsIds)
RETURN 0

CREATE PROCEDURE [dbo].[USP_Ticket_MoveMany]
	@ticketsIds	IntArrayType READONLY,
	@packageId	INT
AS
	UPDATE [Ticket]
		SET [Ticket].[PackageId] = @packageId
		WHERE [Ticket].[Id] IN (SELECT [Item] FROM @ticketsIds)
RETURN 0

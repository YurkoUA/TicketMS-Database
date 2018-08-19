CREATE PROCEDURE [dbo].[USP_Ticket_MoveMany]
	@ticketsIds	IntArrayType READONLY,
	@packageId	INT
AS
	UPDATE [Ticket] SET [PackageId] = @packageId
	WHERE [Id] IN (SELECT [Item] FROM @ticketsIds)
RETURN 0

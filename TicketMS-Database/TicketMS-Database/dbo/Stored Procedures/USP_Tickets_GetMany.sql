CREATE PROCEDURE [dbo].[USP_Tickets_GetMany]
	@TicketsIds IntArrayType READONLY
AS
	SELECT * FROM [Ticket]
	WHERE [Ticket].[Id] IN (SELECT [Item] FROM @TicketsIds)

RETURN 0

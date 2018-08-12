CREATE PROCEDURE [dbo].[USP_Ticket_GetMany]
	@ticketsIds IntArrayType READONLY
AS
	SELECT * FROM [Ticket]
	WHERE [Ticket].[Id] IN (SELECT [Item] FROM @ticketsIds)

RETURN 0

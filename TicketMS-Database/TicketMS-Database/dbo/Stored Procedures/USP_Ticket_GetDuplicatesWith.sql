CREATE PROCEDURE [dbo].[USP_Ticket_GetDuplicatesWith]
	@id INT
AS
	DECLARE @number NVARCHAR(6)

	SELECT @number = [Number]
	FROM [Ticket]
	WHERE [Id] = @id

	SELECT *
	FROM [v_Tickets] AS [t]
	WHERE [t].[Number] = @number
		AND [t].[TicketId] != @id

RETURN 0

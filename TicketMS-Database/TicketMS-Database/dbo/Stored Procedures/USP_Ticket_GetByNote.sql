CREATE PROCEDURE [dbo].[USP_Ticket_GetByNote]
	@note NVARCHAR(MAX)
AS
	SELECT * FROM [v_Tickets] WHERE [Note] = @note
RETURN 0

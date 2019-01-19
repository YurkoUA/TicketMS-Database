CREATE PROCEDURE [dbo].[USP_Ticket_GetListHappy]
	@offset INT = 0,
	@take	INT = 20,
	@total INT OUTPUT
AS
	SELECT * FROM [v_TicketsHappy]
	ORDER BY [Number]

	OFFSET @offset ROWS
	FETCH NEXT @take ROWS ONLY

	SET @total = [dbo].[fn_Ticket_CountHappy]()
RETURN 0

CREATE PROCEDURE [dbo].[USP_Ticket_GetList]
	@offset INT = 0,
	@take	INT = 20
AS
	SELECT * FROM [v_Tickets]
	ORDER BY [Number]

	OFFSET @offset ROWS
	FETCH NEXT @take ROWS ONLY
RETURN 0

CREATE PROCEDURE [dbo].[USP_TicketsHappy_GetList]
	@offset INT = 0,
	@take	INT = 20
AS
	SELECT * FROM [v_TicketsHappy]
	ORDER BY [Number]

	OFFSET @offset ROWS
	FETCH NEXT @take ROWS ONLY
RETURN 0

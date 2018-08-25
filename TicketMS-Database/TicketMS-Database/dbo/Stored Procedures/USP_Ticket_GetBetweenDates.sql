CREATE PROCEDURE [dbo].[USP_Ticket_GetBetweenDates]
	@startDate DATETIME,
	@endDate DATETIME
AS
	SELECT * FROM [v_Tickets]
	WHERE [CreatedDate] BETWEEN @startDate AND @endDate
RETURN 0

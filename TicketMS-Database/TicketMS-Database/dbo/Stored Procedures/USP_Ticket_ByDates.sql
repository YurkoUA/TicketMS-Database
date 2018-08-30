CREATE PROCEDURE [dbo].[USP_Ticket_ByDates]
	@startDate		DATETIME,
	@endDate		DATETIME,
	@hoursOffset	INT = 0
AS
	SELECT	CAST(DATEADD(HOUR, @hoursOffset, [CreatedDate]) AS DATE)	AS [Date],
		COUNT(*)														AS [TicketsCount]

	FROM [Ticket]
	WHERE [CreatedDate] BETWEEN @startDate AND @endDate

	GROUP BY CAST(DATEADD(HOUR, @hoursOffset, [CreatedDate]) AS DATE)
	ORDER BY [Date] ASC
RETURN 0

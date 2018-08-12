CREATE PROCEDURE [dbo].[USP_Report_TicketsTotal]
	@startDate	DATETIME,
	@endDate	DATETIME
AS
	SELECT	COUNT(*)																															AS [TotalCount],
			SUM(CASE WHEN [t].[CreatedDate] BETWEEN @startDate AND @endDate THEN 1 ELSE 0 END)													AS [NewTicketsCount],
			SUM(CASE [dbo].[fn_Number_IsHappy]([t].[Number]) WHEN 1 THEN 1 ELSE 0 END)															AS [HappyTicketsCount],
			SUM(CASE WHEN [t].[CreatedDate] BETWEEN @startDate AND @endDate AND [dbo].[fn_Number_IsHappy]([t].[Number]) = 1 THEN 1 ELSE 0 END)	AS [NewHappyTicketsCount]

	FROM [Ticket] AS [t]
	WHERE [t].[CreatedDate] <= @endDate
RETURN 0

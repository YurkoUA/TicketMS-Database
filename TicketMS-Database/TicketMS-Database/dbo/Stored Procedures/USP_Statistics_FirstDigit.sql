CREATE PROCEDURE [dbo].[USP_Statistics_FirstDigit]
	@startDate DATETIME,
	@endDate DATETIME
AS
	SELECT	[dbo].[fn_Number_GetFirstDigit](t.[Number])	AS [Name],
			COUNT(*)									AS [Count]

	FROM [Ticket] AS [t]
	WHERE [t].[CreatedDate] BETWEEN @startDate AND @endDate

	GROUP BY [dbo].[fn_Number_GetFirstDigit](t.[Number])
	ORDER BY [Name]
RETURN 0

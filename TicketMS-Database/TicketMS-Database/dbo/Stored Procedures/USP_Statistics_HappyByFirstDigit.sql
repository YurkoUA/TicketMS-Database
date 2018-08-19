﻿CREATE PROCEDURE [dbo].[USP_Statistics_HappyByFirstDigit]
	@startDate	DATETIME,
	@endDate	DATETIME
AS
	SELECT	LEFT([t].[Number], 1)	AS [Name],
			COUNT(*)				AS [Count]

	FROM [Ticket] AS [t]
	WHERE [t].[CreatedDate] BETWEEN @startDate AND @endDate
		AND [dbo].[fn_Number_IsHappy]([t].[Number]) = 1

	GROUP BY LEFT([t].[Number], 1)
	ORDER BY [Name]
RETURN 0
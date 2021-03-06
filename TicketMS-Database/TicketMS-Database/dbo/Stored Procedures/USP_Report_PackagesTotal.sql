﻿CREATE PROCEDURE [dbo].[USP_Report_PackagesTotal]
	@startDate	DATETIME,
	@endDate	DATETIME
AS
	SELECT	COUNT(*)																			AS [TotalCount],
			SUM(CASE WHEN [p].[CreatedDate] BETWEEN @startDate AND @endDate THEN 1 ELSE 0 END)	AS [NewPackagesCount],
			SUM(CASE [p].[IsSpecial] WHEN 0 THEN 1 ELSE 0 END)									AS [DefaultPackagesCount],
			SUM(CASE [p].[IsSpecial] WHEN 1 THEN 1 ELSE 0 END)									AS [SpecialPackagesCount]

	FROM [Package] AS [p]
	WHERE [p].[CreatedDate] <= @endDate
		AND ([p].[IsDeleted] = 0 OR ([p].[IsDeleted] = 1 AND [p].[DeletedDate] <= @endDate))
RETURN 0

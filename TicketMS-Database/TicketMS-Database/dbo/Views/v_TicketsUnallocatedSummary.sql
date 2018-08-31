CREATE VIEW [dbo].[v_TicketsUnallocatedSummary]
AS

SELECT	CONCAT([t].[SerialName], '-', [t].[ColorName], ' (', [t].[FirstDigit], ')')		AS [Name],
		COUNT(*)																		AS [Count],
		SUM(CASE [dbo].[fn_Number_IsHappy]([t].[Number]) WHEN 1 THEN 1 ELSE 0 END)		AS [HappyCount]

FROM [v_TicketsUnallocated] AS [t]
GROUP BY [t].[SerialName], [t].[ColorName], [t].[FirstDigit], [t].[Number]

ORDER BY [Count] DESC
OFFSET 0 ROWS

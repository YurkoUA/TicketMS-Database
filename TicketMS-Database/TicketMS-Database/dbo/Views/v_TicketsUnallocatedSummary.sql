CREATE VIEW [dbo].[v_TicketsUnallocatedSummary]
AS

SELECT	CONCAT([t].[SerialName], '-', [t].[ColorName], ' (', [t].[FirstDigit], ')')		AS [Name],
		COUNT(*)																		AS [Count],
		SUM(CASE [dbo].[fn_Number_IsHappy]([t].[Number]) WHEN 1 THEN 1 ELSE 0 END)		AS [HappyCount]

FROM [v_TicketsUnallocated] AS [t]

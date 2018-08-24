CREATE VIEW [dbo].[v_TicketsTotal]
AS

SELECT	COUNT(*)																	AS [TotalCount],
		SUM(CASE [dbo].[fn_Number_IsHappy](t.[Number]) WHEN 1 THEN 1 ELSE 0 END)	AS [HappyCount]
		
FROM [Ticket] AS [t]

CREATE VIEW [dbo].[v_TicketsDuplicates]
AS

SELECT [v_Tickets].*
FROM [v_Tickets]
JOIN 
(
	SELECT [Number] AS [num]
	FROM [Ticket]
	GROUP BY [Number]
	HAVING COUNT(*) > 1
) AS [dt] ON [v_Tickets].[Number] = [dt].[num]

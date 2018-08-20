CREATE VIEW [dbo].[v_Notes]
AS

SELECT	[t].[Note]	AS [Note],
		COUNT(*)	AS [TicketsCount]

FROM [Ticket] AS [t]
WHERE [t].[Note] IS NOT NULL

GROUP BY [t].[Note]
ORDER BY [TicketsCount] DESC
OFFSET 0 ROWS

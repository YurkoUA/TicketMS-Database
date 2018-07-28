CREATE VIEW [dbo].[v_TicketsHappy]
AS

SELECT *
FROM [v_Tickets] AS [t]
WHERE [t].[IsHappy] = 1

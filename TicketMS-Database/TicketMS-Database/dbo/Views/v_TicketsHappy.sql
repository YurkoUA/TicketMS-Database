CREATE VIEW [dbo].[v_TicketsHappy]
AS

SELECT *
FROM [v_Tickets] AS [t]
WHERE [fn_Number_IsHappy]([t].[Number]) = 1

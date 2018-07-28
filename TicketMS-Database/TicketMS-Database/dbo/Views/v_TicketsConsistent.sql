CREATE VIEW [dbo].[v_TicketsConsistent]
AS

SELECT *
FROM [v_Tickets] AS [t]
WHERE [fn_Number_IsConsistent]([t].[Number]) = 1

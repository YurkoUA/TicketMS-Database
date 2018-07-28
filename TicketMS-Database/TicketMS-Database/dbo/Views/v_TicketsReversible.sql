﻿CREATE VIEW [dbo].[v_TicketsReversible]
AS

SELECT *
FROM [v_Tickets] AS [t]
WHERE [fn_Number_IsReversible]([t].[Number]) = 1

﻿CREATE FUNCTION [dbo].[fn_Ticket_Count]()
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(*) FROM [Ticket])
END

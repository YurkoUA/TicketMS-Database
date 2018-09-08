CREATE FUNCTION [dbo].[fn_Ticket_CountHappy]()
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(*) FROM [Ticket] WHERE [dbo].[fn_Number_IsHappy]([Number]) = 1)
END

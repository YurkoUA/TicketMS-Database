CREATE PROCEDURE [dbo].[USP_Ticket_FindNumber]
	@number NVARCHAR(6)
AS
	SELECT *
	FROM [v_Tickets] AS [t]
	WHERE [t].[Number] LIKE CONCAT('%', @number, '%')

RETURN 0

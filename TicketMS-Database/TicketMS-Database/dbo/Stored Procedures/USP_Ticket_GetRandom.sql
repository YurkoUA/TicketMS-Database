CREATE PROCEDURE [dbo].[USP_Ticket_GetRandom]
AS
	DECLARE @id INT
	SELECT TOP 1 @id = [Id] FROM [Ticket] ORDER BY NEWID()

	EXEC USP_Ticket_Get @id
RETURN 0

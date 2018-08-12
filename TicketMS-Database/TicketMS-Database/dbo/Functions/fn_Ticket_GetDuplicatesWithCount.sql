CREATE FUNCTION [dbo].[fn_Ticket_GetDuplicatesWithCount]
(
	@id INT
)
RETURNS INT
AS
BEGIN
	DECLARE @number NVARCHAR(6)

	SELECT @number = [Number]
	FROM [Ticket]
	WHERE [Id] = @id

	RETURN (SELECT COUNT(*) FROM [Ticket] WHERE [Number] = @number AND [Id] != @id)
END

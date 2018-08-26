CREATE FUNCTION [dbo].[fn_Ticket_GetNumber]
(
	@id INT
)
RETURNS NVARCHAR(6)
AS
BEGIN
	RETURN (SELECT [Number] FROM [Ticket] WHERE [Id] = @id)
END

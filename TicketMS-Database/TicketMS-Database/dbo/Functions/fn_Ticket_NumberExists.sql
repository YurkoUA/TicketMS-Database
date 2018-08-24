CREATE FUNCTION [dbo].[fn_Ticket_NumberExists]
(
	@number NVARCHAR(MAX)
)
RETURNS BIT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Ticket] WHERE [Number] = @number)
		RETURN 1

	RETURN 0
END

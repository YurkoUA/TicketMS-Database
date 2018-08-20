CREATE FUNCTION [dbo].[fn_Number_IsReversible]
(
	@number NVARCHAR (6)
)
RETURNS BIT
AS
BEGIN
	IF LEFT(@number, 3) = REVERSE(RIGHT(@number, 3))
		RETURN 1

	RETURN 0
END

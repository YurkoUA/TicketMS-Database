CREATE FUNCTION [dbo].[fn_Number_GetFirstDigit]
(
	@number NVARCHAR(6)
)
RETURNS INT
AS
BEGIN
	RETURN CONVERT(INT, LEFT(@number, 1))
END

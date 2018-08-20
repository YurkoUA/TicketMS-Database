CREATE FUNCTION [dbo].[fn_Number_IsConsistent]
(
	@number NVARCHAR (6)
)
RETURNS INT
AS
BEGIN
	IF LEFT(@number, 3) = RIGHT(@number, 3)
		RETURN 1

	RETURN 0
END

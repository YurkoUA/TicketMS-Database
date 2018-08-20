CREATE FUNCTION [dbo].[fn_Number_IsHappy]
(
	@number NVARCHAR (6)
)
RETURNS BIT
AS
BEGIN
	DECLARE @leftSum INT
	DECLARE @rightSum INT

	SET @leftSum = CONVERT(INT, SUBSTRING(@number, 1, 1)) + CONVERT(INT, SUBSTRING(@number, 2, 1)) + CONVERT(INT, SUBSTRING(@number, 3, 1))
	SET @rightSum = CONVERT(INT, SUBSTRING(@number, 4, 1)) + CONVERT(INT, SUBSTRING(@number, 5, 1)) + CONVERT(INT, SUBSTRING(@number, 6, 1))

	IF @leftSum = @rightSum
		RETURN 1

	RETURN 0
END

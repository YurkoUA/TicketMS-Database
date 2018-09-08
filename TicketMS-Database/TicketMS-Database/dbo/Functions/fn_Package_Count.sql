CREATE FUNCTION [dbo].[fn_Package_Count]
(
	@onlyOpened BIT = 0,
	@onlySpecial BIT = 0
)
RETURNS INT
AS
BEGIN
	DECLARE @count INT

	SELECT @count = COUNT(*)
	FROM [Package]
	WHERE ((@onlyOpened = 1		AND [IsOpened] = 1)		OR @onlyOpened = 0)
		AND ((@onlySpecial = 1	AND [IsSpecial] = 1)	OR @onlySpecial = 0)

	RETURN @count
END

CREATE FUNCTION [dbo].[fn_Package_IsOpened]
(
	@id INT
)
RETURNS BIT
AS
BEGIN
	RETURN (SELECT [IsOpened] FROM [Package] WHERE [Id] = @id)
END

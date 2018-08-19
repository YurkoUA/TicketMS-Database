CREATE FUNCTION [dbo].[fn_Serial_Exists]
(
	@name NVARCHAR(MAX),
	@id	INT = NULL
)
RETURNS BIT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Serial] WHERE [Name] = @name AND (@id IS NULL OR [Id] = @id))
		RETURN 1

	RETURN 0
END

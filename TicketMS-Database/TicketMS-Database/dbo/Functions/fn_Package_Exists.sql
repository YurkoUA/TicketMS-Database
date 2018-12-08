CREATE FUNCTION [dbo].[fn_Package_Exists]
(
	@name NVARCHAR(MAX),
	@id	INT = NULL
)
RETURNS BIT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Package] WHERE [Name] = @name AND (@id IS NULL OR [Id] != @id) AND [IsSpecial] = 1 AND [IsDeleted] = 0)
		RETURN 1

	RETURN 0
END

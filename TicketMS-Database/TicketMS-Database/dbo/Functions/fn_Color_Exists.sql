CREATE FUNCTION [dbo].[fn_Color_Exists]
(
	@name NVARCHAR(MAX),
	@paletteName NVARCHAR(MAX),
	@id	INT = NULL
)
RETURNS BIT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Color] WHERE ([Name] = @name OR [PaletteName] = @paletteName)
			AND (@id IS NULL OR [Id] = @id))
		RETURN 1

	RETURN 0
END

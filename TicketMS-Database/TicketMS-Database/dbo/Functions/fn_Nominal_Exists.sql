CREATE FUNCTION [dbo].[fn_Nominal_Exists]
(
	@value MONEY,
	@id INT = NULL
)
RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Nominal] WHERE [Value] = @value AND (@id IS NULL OR [Id] != @id))
		RETURN 1

	RETURN 0
END

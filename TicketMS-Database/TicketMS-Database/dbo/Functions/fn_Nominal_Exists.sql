CREATE FUNCTION [dbo].[fn_Nominal_Exists]
(
	@price MONEY,
	@id INT = NULL
)
RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Nominal] WHERE [Price] = @price AND (@id IS NULL OR [Id] = @id))
		RETURN 1

	RETURN 0
END

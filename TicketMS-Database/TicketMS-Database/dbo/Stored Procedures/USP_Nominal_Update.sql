CREATE PROCEDURE [dbo].[USP_Nominal_Update]
	@price MONEY,
	@id INT
AS
	IF ([dbo].[fn_Nominal_Exists](@price, @id) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Номінал значенням "', @price, N'" вже існує.');
		THROW 50002, @msg, 1;
	END

	UPDATE [Nominal] 
	SET [Price] = @price 
	WHERE [Id] = @id
RETURN 0

CREATE PROCEDURE [dbo].[USP_Nominal_Create]
	@price MONEY
AS
	IF ([dbo].[fn_Nominal_Exists](@price) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Номінал значенням "', @price, N'" вже існує.');
		THROW 50001, @msg, 1;
	END

	INSERT INTO [Nominal]([Price]) VALUES (@price)

RETURN SCOPE_IDENTITY()

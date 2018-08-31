CREATE PROCEDURE [dbo].[USP_Nominal_Create]
	@value MONEY
AS
	IF ([dbo].[fn_Nominal_Exists](@value, NULL) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Номінал значенням "', @value, N'" вже існує.');
		THROW 50001, @msg, 1;
	END

	INSERT INTO [Nominal]([Value]) VALUES (@value)

RETURN SCOPE_IDENTITY()

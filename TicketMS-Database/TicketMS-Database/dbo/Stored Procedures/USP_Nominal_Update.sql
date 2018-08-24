CREATE PROCEDURE [dbo].[USP_Nominal_Update]
	@value MONEY,
	@id INT
AS
	IF ([dbo].[fn_Nominal_Exists](@value, @id) = 1)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = CONCAT(N'Номінал значенням "', @value, N'" вже існує.');
		THROW 50002, @msg, 1;
	END

	UPDATE [Nominal] 
	SET [Value] = @value 
	WHERE [Id] = @id
RETURN 0

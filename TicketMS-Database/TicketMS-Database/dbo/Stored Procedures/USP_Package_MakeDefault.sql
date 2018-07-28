CREATE PROCEDURE [dbo].[USP_Package_MakeDefault]
	@Id			INT,
	@ColorId	INT,
	@SerialId	INT,
	@FirstDigit	INT
AS
	DECLARE @isSpecial BIT = 0

	UPDATE [Package]
		SET [Name] = NULL,
			[IsSpecial] = @isSpecial,
			[ColorId] = @ColorId,
			[SerialId] = @SerialId,
			[FirstDigit] = @FirstDigit

	WHERE [Id] = @Id
RETURN 0

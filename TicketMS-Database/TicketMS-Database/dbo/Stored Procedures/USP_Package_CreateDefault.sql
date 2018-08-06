CREATE PROCEDURE [dbo].[USP_Package_CreateDefault]
	@ColorId	INT,
	@SerialId	INT,
	@FirstDigit	INT,
	@NominalId	INT,
	@Note		NVARCHAR(128)
AS
	
	INSERT INTO [Package]([ColorId], [SerialId], [FirstDigit], [NominalId], [Note])
			VALUES (@ColorId, @SerialId, @FirstDigit, @NominalId, @Note)
RETURN 0

CREATE PROCEDURE [dbo].[USP_Package_CreateDefault]
	@ColorId	INT,
	@SerialId	INT,
	@FirstDigit	INT,
	@Nominal	REAL,
	@Note		NVARCHAR(128)
AS
	
	INSERT INTO [Package]([ColorId], [SerialId], [FirstDigit], [Nominal], [Note])
			VALUES (@ColorId, @SerialId, @FirstDigit, @Nominal, @Note)
RETURN 0

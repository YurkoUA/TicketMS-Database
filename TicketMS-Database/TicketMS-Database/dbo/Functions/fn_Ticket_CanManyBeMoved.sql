CREATE FUNCTION [dbo].[fn_Ticket_CanManyBeMoved]
(
	@ticketsIds IntArrayType READONLY,
	@packageId INT
)
RETURNS BIT
AS
BEGIN
	IF ([dbo].[fn_Package_IsOpened](@packageId) = 0)
		RETURN 0

	DECLARE @toMoveCount INT,
			@compatibleCount INT

	DECLARE @packageFirstDigit	INT,
			@packageSerialId	INT,
			@packageColorId		INT,
			@packageNominalId	INT



	SELECT	@packageFirstDigit = [FirstDigit],
			@packageSerialId = [SerialId],
			@packageColorId = [ColorId],
			@packageNominalId = [NominalId]
	FROM [Package]
	WHERE [Id] = @packageId


	SELECT @toMoveCount = COUNT(*) FROM @ticketsIds


	SELECT @compatibleCount = COUNT(*) FROM [Ticket]
	WHERE [Id] IN (SELECT [Item] FROM @ticketsIds)
		AND (@packageFirstDigit IS NULL OR [dbo].[fn_Number_GetFirstDigit]([Number]) = @packageFirstDigit)
		AND (@packageSerialId IS NULL OR [SerialId] = @packageSerialId)
		AND (@packageColorId IS NULL OR [ColorId] = @packageColorId)
		AND @packageNominalId = [NominalId]


	IF (@toMoveCount = @compatibleCount)
		RETURN 1

	RETURN 0
END

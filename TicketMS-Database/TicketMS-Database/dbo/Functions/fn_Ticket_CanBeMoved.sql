CREATE FUNCTION [dbo].[fn_Ticket_CanBeMoved]
(
	@ticketId INT,
	@packageId INT
)
RETURNS BIT
AS
BEGIN
	IF ([dbo].[fn_Package_IsOpened](@packageId) = 0)
		RETURN 0

	DECLARE @ticketFirstDigit	INT,
			@ticketSerialId		INT,
			@ticketColorId		INT,
			@ticketNominalId	INT

	DECLARE @packageFirstDigit	INT,
			@packageSerialId	INT,
			@packageColorId		INT,
			@packageNominalId	INT



	SELECT	@ticketFirstDigit = [dbo].[fn_Number_GetFirstDigit]([Number]),
			@ticketSerialId = [SerialId],
			@ticketColorId = [ColorId],
			@ticketNominalId = [NominalId]
	FROM [Ticket]
	WHERE [Id] = @ticketId

	

	SELECT	@packageFirstDigit = [FirstDigit],
			@packageSerialId = [SerialId],
			@packageColorId = [ColorId],
			@packageNominalId = [NominalId]
	FROM [Package]
	WHERE [Id] = @packageId



	IF (@packageFirstDigit IS NOT NULL AND @packageFirstDigit != @ticketFirstDigit)
		RETURN 0

	IF (@packageSerialId IS NOT NULL AND @packageSerialId != @ticketSerialId)
		RETURN 0

	IF (@packageColorId IS NOT NULL AND @packageColorId != @ticketColorId)
		RETURN 0

	IF (@packageNominalId != @ticketNominalId)
		RETURN 0

	RETURN 1
END

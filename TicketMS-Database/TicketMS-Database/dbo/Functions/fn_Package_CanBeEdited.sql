CREATE FUNCTION [dbo].[fn_Package_CanBeEdited]
(
	@id				INT,
	@colorId		INT,
	@serialId		INT,
	@nominalId		INT,
	@firstDigit		INT = NULL
)
RETURNS BIT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM [Package] WHERE [Id] = @id AND [IsDeleted] = 0)
		RETURN 0

	DECLARE @ticketsCount INT = [dbo].[fn_Package_TicketsCount](@id)
	DECLARE @conditionCount INT

	IF (@ticketsCount = 0)
		RETURN 1

	SELECT @conditionCount = COUNT(*)
	FROM [Ticket]
	WHERE [PackageId] = @id
		AND (@colorId IS NULL OR [ColorId] = @colorId)
		AND (@serialId IS NULL OR [SerialId] = @serialId)
		AND ([NominalId] = @nominalId)
		AND (@firstDigit IS NULL OR [dbo].[fn_Number_GetFirstDigit]([Number]) = @firstDigit)

	IF (@ticketsCount = @conditionCount)
		RETURN 1

	RETURN 0
END

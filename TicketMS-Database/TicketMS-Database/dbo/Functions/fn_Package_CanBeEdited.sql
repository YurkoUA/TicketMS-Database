CREATE FUNCTION [dbo].[fn_Package_CanBeEdited]
(
	@id				INT,
	@colorId		INT,
	@serialId		INT,
	@nominalId		INT,
	@firstDigit		INT
)
RETURNS BIT
AS
BEGIN
	DECLARE @ticketsCount INT = [dbo].[fn_Package_TicketsCount](@id)
	DECLARE @conditionCount INT

	IF (@ticketsCount = 0)
		RETURN 1

	SELECT @conditionCount = COUNT(*)
	FROM [Ticket]
	WHERE [PackageId] = @id
		AND ([ColorId] = @colorId		OR @colorId IS NULL)
		AND ([SerialId] = @serialId		OR @serialId IS NULL)
		AND ([NominalId] = @nominalId	OR @nominalId IS NULL)
		AND ([dbo].[fn_Number_GetFirstDigit]([Number]) = @firstDigit OR @firstDigit IS NULL)

	IF (@ticketsCount = @conditionCount)
		RETURN 1

	RETURN 0
END

CREATE FUNCTION [dbo].[fn_Ticket_CanBeCreatedInPackage]
(
	@number			NVARCHAR(6),
	@packageId		INT,
	@nominalId		INT,
	@colorId		INT,
	@serialId		INT
)
RETURNS BIT
AS
BEGIN
	IF ([dbo].[fn_Package_IsOpened](@packageId) = 0)
		RETURN 0

	DECLARE @firstDigit INT = [dbo].[fn_Number_GetFirstDigit](@number)

	IF EXISTS	(
					SELECT 1 FROM [Package] AS [p]
					WHERE p.[Id] = @packageId
						AND p.[NominalId] = @nominalId
						AND (p.[ColorId] IS NULL OR p.[ColorId] = @colorId)
						AND (p.[SerialId] IS NULL OR p.[SerialId] = @serialId)
						AND (p.[FirstDigit] IS NULL OR p.[FirstDigit] = @firstDigit)
				)
		RETURN 1

	RETURN 0
END

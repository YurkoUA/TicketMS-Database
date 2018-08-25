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


	IF EXISTS	(
					SELECT 1 FROM [Ticket] AS [t]
					JOIN [Package] AS [p] ON [p].[Id] = @packageId
					WHERE t.[Id] = @ticketId
						AND t.[NominalId] = p.[NominalId]
						AND (p.[FirstDigit] IS NULL OR [dbo].[fn_Number_GetFirstDigit](t.[Number]) = p.[FirstDigit])
						AND (p.[ColorId] IS NULL OR t.[ColorId] = p.[ColorId])
						AND (p.[SerialId] IS NULL OR t.[SerialId] = p.[SerialId])

				)
		RETURN 1
	
	RETURN 0
END

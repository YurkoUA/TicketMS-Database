CREATE FUNCTION [dbo].[fn_Ticket_FilterCount]
(
	@firstDigit INT = NULL,
	@serialId	INT = NULL,
	@colorId	INT = NULL,
	@nominalId	INT = NULL,

	@onlyUnallocated BIT = 0
)
RETURNS INT
AS
BEGIN
	RETURN	(
				SELECT COUNT(*)
				FROM [Ticket] AS [t]
				WHERE		((@firstDigit IS NOT NULL	AND LEFT([t].[Number], 1) = @firstDigit)		OR @firstDigit IS NULL)
					AND		((@serialId IS NOT NULL		AND [t].[SerialId] = @serialId)					OR @serialId IS NULL)
					AND		((@colorId IS NOT NULL		AND [t].[ColorId] = @colorId)					OR @colorId IS NULL)
					AND		((@nominalId IS NOT NULL	AND [t].[NominalId] = @nominalId)				OR @nominalId IS NULL)

					AND		((@onlyUnallocated = 1		AND [t].[PackageId] IS NULL)					OR @onlyUnallocated = 0)
			)
END

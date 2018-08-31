CREATE PROCEDURE [dbo].[USP_Ticket_SummaryByPackage]
	@packageId INT
AS
	SELECT	CONCAT([t].[SerialName], '-', [t].[ColorName], ' (', [t].[FirstDigit], ')')		AS [Name],
			COUNT(*)																		AS [Count],
			SUM(CASE [dbo].[fn_Number_IsHappy]([t].[Number]) WHEN 1 THEN 1 ELSE 0 END)		AS [HappyCount]

	FROM [v_Tickets] AS [t]
	WHERE t.[PackageId] = @packageId

	GROUP BY [t].[SerialName], [t].[ColorName], [t].[FirstDigit]
	ORDER BY [Count] DESC
RETURN 0

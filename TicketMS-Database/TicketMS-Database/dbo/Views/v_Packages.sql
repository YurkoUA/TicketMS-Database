CREATE VIEW [dbo].[v_Packages]
AS

SELECT	[p].[Id]			AS [Id]
		,IIF([p].[IsSpecial] = 1, [p].[Name], CONCAT([s].[Name], '-', [c].[Name], IIF([FirstTicket].[Number] IS NOT NULL, CONCAT(' (', [FirstTicket].[Number], ')'), ''))) 
							AS [Name]
		,[p].[IsOpened]
		,[p].[IsSpecial]
		,[p].[FirstDigit]
		,[p].[Nominal]
		,[p].[Note]
		,[p].[CreatedDate]
		,COUNT([t].[Id])	AS [TicketsCount]

		-- Serial
		,[s].[Id]			AS [SerialId]
		,[s].[Name]			AS [SerialName]

		-- Color
		,[c].[Id]			AS [ColorId]
		,[c].[Name]			AS [ColorName]

FROM [Package] AS [p]

LEFT JOIN [Serial]	AS [s] ON [s].[Id] = [p].[SerialId]
LEFT JOIN [Color]	AS [c] ON [c].[Id] = [p].[ColorId]
LEFT JOIN [Ticket]	AS [t] ON [t].[PackageId] = [p].[Id]

CROSS APPLY
	(
		SELECT TOP 1 [Ticket].[Number]
		FROM [Ticket]
		WHERE [Ticket].[PackageId] = [p].[Id]
		ORDER BY [Ticket].[Id]
	) AS [FirstTicket]

GROUP BY [p].[Id]
		,[p].[Name]
		,[p].[IsOpened]
		,[p].[IsSpecial]
		,[p].[FirstDigit]
		,[p].[Nominal]
		,[p].[Note]
		,[p].[CreatedDate]
		,[c].[Id]
		,[c].[Name]

		,[s].[Id]
		,[s].[Name]

		,[FirstTicket].[Number]

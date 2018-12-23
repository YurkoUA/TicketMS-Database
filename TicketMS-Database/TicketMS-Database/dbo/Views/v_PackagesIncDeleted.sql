CREATE VIEW [dbo].[v_PackagesIncDeleted]
AS

SELECT	[p].[Id]			AS [PackageId],
		IIF([p].[IsSpecial] = 1, [p].[Name], CONCAT([s].[Name], '-', [c].[Name], IIF([FirstTicket].[Number] IS NOT NULL, CONCAT(' (', [FirstTicket].[Number], ')'), ''))) 
							AS [PackageName],
		[p].[IsOpened],
		[p].[IsSpecial],
		[p].[FirstDigit],
		[p].[Note],
		[p].[CreatedDate],
		COUNT([t].[Id])		AS [TicketsCount],
		[p].[IsDeleted],
		[p].[DeletedDate],

		-- Serial
		[s].[Id]			AS [SerialId],
		[s].[Name]			AS [SerialName],

		-- Color
		[c].[Id]			AS [ColorId],
		[c].[Name]			AS [ColorName],

		-- Nominal
		[n].[Id]			AS [NominalId],
		[n].[Value]

FROM [Package] AS [p]

LEFT JOIN [Serial]	AS [s] ON [s].[Id] = [p].[SerialId]
LEFT JOIN [Color]	AS [c] ON [c].[Id] = [p].[ColorId]
LEFT JOIN [Ticket]	AS [t] ON [t].[PackageId] = [p].[Id]
JOIN [Nominal] AS [n] ON [n].[Id] = [p].[NominalId]

OUTER APPLY
	(
		SELECT TOP 1 [Ticket].[Number]
		FROM [Ticket]
		WHERE [Ticket].[PackageId] = [p].[Id]
		ORDER BY [Ticket].[Id]
	) AS [FirstTicket]

GROUP BY [p].[Id],
		 [p].[Name],
		 [p].[IsOpened],
		 [p].[IsSpecial],
		 [p].[FirstDigit],
		 [p].[Note],
		 [p].[CreatedDate],
		 [p].[IsDeleted],
		 [p].[DeletedDate],

		 [c].[Id],
		 [c].[Name],

		 [s].[Id],
		 [s].[Name],

		 [n].[Id],
		 [n].[Value],
		 
		 [FirstTicket].[Number]
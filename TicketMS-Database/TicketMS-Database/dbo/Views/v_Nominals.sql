CREATE VIEW [dbo].[v_Nominals]
AS

SELECT	[n].[Id],
		[n].[Value],
		[n].[IsDefault],
		COALESCE([p].[PackagesCount], 0)	AS [PackagesCount],
		COALESCE([t].[TicketsCount], 0)		AS [TicketsCount]

FROM [Nominal] AS [n]

LEFT JOIN 
		(
			SELECT	[Package].[NominalId],
					COUNT(*) AS [PackagesCount]
			FROM [Package]
			GROUP BY [Package].[NominalId]
		) AS [p] ON [p].[NominalId] = [n].[Id]

LEFT JOIN
		(
			SELECT	[Ticket].[NominalId],
					COUNT(*) AS [TicketsCount]
			FROM [Ticket]
			GROUP BY [Ticket].[NominalId]
		) AS [t] ON [t].[NominalId] = [n].[Id]

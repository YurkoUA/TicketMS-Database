CREATE VIEW [dbo].[v_Nominals]
AS

SELECT	[n].[Id],
		[n].[Price],
		[n].[IsDefault],
		COALESCE([p].[PackagesCount], 0)	AS [PackagesCount],
		COALESCE([t].[TicketsCount], 0)		AS [TicketsCount]

FROM [Nominal] AS [n]

LEFT JOIN 
		(
			SELECT	[Package].[SerialId],
					COUNT(*) AS [PackagesCount]
			FROM [Package]
			GROUP BY [Package].[SerialId]
		) AS [p] ON [p].[SerialId] = [n].[Id]

LEFT JOIN
		(
			SELECT	[Ticket].[SerialId],
					COUNT(*) AS [TicketsCount]
			FROM [Ticket]
			GROUP BY [Ticket].[SerialId]
		) AS [t] ON [t].[SerialId] = [n].[Id]

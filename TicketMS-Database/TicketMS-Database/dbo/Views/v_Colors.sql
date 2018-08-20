CREATE VIEW [dbo].[v_Colors]
AS

SELECT	[c].[Id]	AS [Id],
		[c].[Name]	AS [Name],
		COALESCE([p].[PackagesCount], 0)	AS [PackagesCount],
		COALESCE([t].[TicketsCount], 0)		AS [TicketsCount]

FROM [Color] AS [c]

LEFT JOIN 
		(
			SELECT	[Package].[ColorId],
					COUNT(*) AS [PackagesCount]
			FROM [Package]
			GROUP BY [Package].[ColorId]
		) AS [p] ON [p].[ColorId] = [c].[Id]

LEFT JOIN
		(
			SELECT	[Ticket].[ColorId],
					COUNT(*) AS [TicketsCount]
			FROM [Ticket]
			GROUP BY [Ticket].[ColorId]
		) AS [t] ON [t].[ColorId] = [c].[Id]

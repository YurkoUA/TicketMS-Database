﻿CREATE VIEW [dbo].[v_SeriesExtended]
AS

SELECT	[s].[Id]	AS [Id]
		,[s].[Name]	AS [Name]
		,COALESCE([p].[PackagesCount], 0)	AS [PackagesCount]
		,COALESCE([t].[TicketsCount], 0)	AS [TicketsCount]

FROM [Serial] AS [s]

LEFT JOIN 
		(
			SELECT	[Package].[SerialId]
					,COUNT(*) AS [PackagesCount]
			FROM [Package]
			GROUP BY [Package].[SerialId]
		) AS [p] ON [p].[SerialId] = [s].[Id]

LEFT JOIN
		(
			SELECT	[Ticket].[SerialId]
					,COUNT(*) AS [TicketsCount]
			FROM [Ticket]
			GROUP BY [Ticket].[SerialId]
		) AS [t] ON [t].[SerialId] = [s].[Id]
CREATE VIEW [dbo].[v_TicketsUnallocated]
AS

SELECT [t].[Id]
		,[t].[Number]
		,[t].[SerialNumber]
		,[t].[CreatedDate]
		,[t].[Date]
		,[t].[Note]
		,LEFT([t].[Number], 1)				AS [FirstDigit]
		,[fn_Number_IsHappy]([t].[Number])	AS [IsHappy]

		,[s].[Id]							AS [SerialId]
		,[s].[Name]							AS [SerialName]

		,[c].[Id]							AS [ColorId]
		,[c].[Name]							AS [ColorName]

FROM [Ticket] AS [t]

JOIN [Serial] AS [s] ON [s].[Id] = [t].[SerialId]
JOIN [Color]  AS [c] ON [c].[Id] = [t].[ColorId]

WHERE [t].[PackageId] IS NULL

ORDER BY [t].[Number]
OFFSET 0 ROWS

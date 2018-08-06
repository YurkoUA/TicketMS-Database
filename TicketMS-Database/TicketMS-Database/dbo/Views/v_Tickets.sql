CREATE VIEW [dbo].[v_Tickets]
AS

SELECT	[t].[Id]
		,[t].[Number]
		,[t].[SerialNumber]
		,[t].[CreatedDate]
		,[t].[Date]
		,[t].[Note]
		,LEFT([t].[Number], 1)				AS [FirstDigit]
		,[fn_Number_IsHappy]([t].[Number])	AS [IsHappy]

		,[p].[Id]							AS [PackageId]
		,[p].[Name]							AS [PackageName]

		,[s].[Id]							AS [SerialId]
		,[s].[Name]							AS [SerialName]

		,[c].[Id]							AS [ColorId]
		,[c].[Name]							AS [ColorName]

		,[n].[Id]							AS [NominalId]
		,[n].[Price]

FROM [Ticket] AS [t]

JOIN [Serial] AS [s] ON [s].[Id] = [t].[SerialId]
JOIN [Color] AS [c] ON [c].[Id] = [t].[ColorId]
JOIN [Nominal] AS [n] ON [n].[Id] = [t].[NominalId]
LEFT JOIN [v_Packages] AS [p] ON [p].[Id] = [t].[PackageId]

ORDER BY [t].[Number]
OFFSET 0 ROWS

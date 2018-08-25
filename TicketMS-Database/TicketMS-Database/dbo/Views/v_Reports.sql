CREATE VIEW [dbo].[v_Reports]
AS

SELECT	[r].[Id]		AS [ReportId],
		[r].[Date],
		[r].[IsAutomatic],

		[d].[Id]		AS [DocumentId],
		[d].[FileUrl],

		[t].[Id]		AS [TypeId],
		[t].[Name]

FROM [Report] AS [r]
JOIN [ReportDocument] AS [d] ON [d].[ReportId] = [r].[Id]
JOIN [ReportType] AS [t] ON [t].[Id] = [d].[TypeId]

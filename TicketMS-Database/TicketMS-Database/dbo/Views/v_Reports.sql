CREATE VIEW [dbo].[v_Reports]
AS

SELECT	[r].[Id],
		[r].[Date],
		[r].[IsAutomatic],

		[d].[Id] AS [DocumentId],
		[d].[Type],
		[d].[FileUrl]

FROM [Report] AS [r]
JOIN [ReportDocument] AS [d]
	ON [d].[ReportId] = [r].[Id]

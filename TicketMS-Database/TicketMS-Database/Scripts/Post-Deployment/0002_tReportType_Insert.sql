DECLARE @ReportType_0002 TABLE	(
	[Id] INT,
	[Name] NVARCHAR(64)
)

INSERT INTO @ReportType_0002([Id], [Name])
VALUES	(1, N'Загальний звіт'),
		(2, N'Звіт по пачкам')

INSERT INTO [tReportType] ([Id], [Name])
SELECT temp.[Id], temp.[Name]
FROM @ReportType_0002 AS temp
LEFT JOIN [tReportType] AS actual ON actual.[Id] = temp.[Id]
WHERE actual.[Id] IS NULL
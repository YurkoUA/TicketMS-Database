CREATE TABLE [dbo].[ReportDocument]
(
	[Id]		INT IDENTITY(1, 1)	NOT NULL,
	[ReportId]	INT					NOT NULL,
	[TypeId]	INT					NOT NULL,
	[FileUrl]	NVARCHAR(MAX)		NOT NULL

	CONSTRAINT [PK_dbo.ReportDocument] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.ReportDocument_dbo.Report_ReportId] FOREIGN KEY ([ReportId]) REFERENCES [dbo].[Report] ([Id]),
	CONSTRAINT [FK_dbo.ReportDocument_dbo.Report_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[ReportType] ([Id])
)

GO
CREATE NONCLUSTERED INDEX [IX_ReportId]
	ON [dbo].[ReportDocument]([ReportId] ASC)

GO
CREATE NONCLUSTERED INDEX [IX_TypeId]
	ON [dbo].[ReportDocument]([TypeId] ASC)

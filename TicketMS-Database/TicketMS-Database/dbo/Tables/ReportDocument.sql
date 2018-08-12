CREATE TABLE [dbo].[ReportDocument]
(
	[Id]		INT IDENTITY(1, 1)	NOT NULL,
	[ReportId]	INT					NOT NULL,
	[Type]		INT					NOT NULL,
	[FileUrl]	NVARCHAR(MAX)		NOT NULL

	CONSTRAINT [PK_dbo.ReportDocument] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.ReportDocument_dbo.Report_ReportId] FOREIGN KEY ([ReportId]) REFERENCES [dbo].[Report] ([Id])
)

GO
CREATE NONCLUSTERED INDEX [IX_ReportId]
	ON [dbo].[ReportDocument]([ReportId] ASC)

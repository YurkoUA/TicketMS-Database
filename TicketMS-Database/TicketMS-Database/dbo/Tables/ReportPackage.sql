CREATE TABLE [dbo].[ReportPackage]
(
	[ReportId]		INT NOT NULL,
	[PackageId]		INT NOT NULL,
	[TicketsCount]	INT NOT NULL

	CONSTRAINT [PK_ReportPackage] PRIMARY KEY CLUSTERED ([ReportId] ASC, [PackageId] ASC),
	CONSTRAINT [FK_dbo.ReportPackage_dbo.Report_ReportId] FOREIGN KEY ([ReportId]) REFERENCES [dbo].[Report] ([Id]),
	CONSTRAINT [FK_dbo.ReportPackage_dbo.Package_PackageId] FOREIGN KEY ([PackageId]) REFERENCES [dbo].[Package] ([Id])
)

GO
CREATE NONCLUSTERED INDEX [IX_ReportId]
	ON [dbo].[ReportPackage]([ReportId] ASC)

GO
CREATE NONCLUSTERED INDEX [IX_PackageId]
	ON [dbo].[ReportPackage]([PackageId] ASC)

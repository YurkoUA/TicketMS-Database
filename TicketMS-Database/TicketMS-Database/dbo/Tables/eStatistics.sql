CREATE TABLE [dbo].[eStatistics]
(
	[Id]		INT NOT NULL,
	[Alias]		NVARCHAR(64) NOT NULL,
	[Title]		NVARCHAR(64) NOT NULL,
	[SPName]	NVARCHAR(64) NOT NULL,

	CONSTRAINT [PK_eStatistics] PRIMARY KEY CLUSTERED ([Id] ASC)
);

GO

CREATE NONCLUSTERED INDEX [IX_eStatistics_Alias]
	ON [dbo].[eStatistics] ([Alias] ASC)

CREATE TABLE [dbo].[Serial] (
    [Id]			INT				IDENTITY (1, 1) NOT NULL,
    [Name]			NVARCHAR (4)	NOT NULL,
    [Note]			NVARCHAR (128)	NULL,
	[IsDefault]		BIT				NOT NULL DEFAULT(0)
    CONSTRAINT [PK_dbo.Serial] PRIMARY KEY CLUSTERED ([Id] ASC)
);


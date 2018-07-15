CREATE TABLE [dbo].[Colors] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (32) NOT NULL,
    [RowVersion] ROWVERSION    NOT NULL,
    CONSTRAINT [PK_dbo.Colors] PRIMARY KEY CLUSTERED ([Id] ASC)
);


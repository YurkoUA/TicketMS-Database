CREATE TABLE [dbo].[tRole] (
    [Id]          INT           NOT NULL,
    [Name]        NVARCHAR (32) NOT NULL,
    [Description] NVARCHAR (32) NOT NULL,
    CONSTRAINT [PK_tRole] PRIMARY KEY CLUSTERED ([Id] ASC)
);


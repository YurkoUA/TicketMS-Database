CREATE TABLE [dbo].[Role] (
    [Id]          INT           NOT NULL,
    [Name]        NVARCHAR (32) NOT NULL,
    [Description] NVARCHAR (32) NOT NULL,
    CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED ([Id] ASC)
);


CREATE TABLE [dbo].[Roles] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (32) NOT NULL,
    [Description] NVARCHAR (32) NOT NULL,
    CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED ([Id] ASC)
);


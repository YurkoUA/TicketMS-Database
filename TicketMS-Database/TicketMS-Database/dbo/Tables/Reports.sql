CREATE TABLE [dbo].[Reports] (
    [Id]          INT      IDENTITY (1, 1) NOT NULL,
    [Date]        DATETIME NOT NULL,
    [IsAutomatic] BIT      NOT NULL,
    CONSTRAINT [PK_dbo.Reports] PRIMARY KEY CLUSTERED ([Id] ASC)
);


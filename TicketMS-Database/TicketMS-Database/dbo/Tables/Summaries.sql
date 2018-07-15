CREATE TABLE [dbo].[Summaries] (
    [Id]           INT      IDENTITY (1, 1) NOT NULL,
    [Date]         DATETIME NOT NULL,
    [Tickets]      INT      NOT NULL,
    [HappyTickets] INT      NOT NULL,
    [Packages]     INT      NOT NULL,
    CONSTRAINT [PK_dbo.Summaries] PRIMARY KEY CLUSTERED ([Id] ASC)
);


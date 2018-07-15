CREATE TABLE [dbo].[Tickets] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [RowVersion]   ROWVERSION     NOT NULL,
    [Number]       NVARCHAR (6)   NOT NULL,
    [PackageId]    INT            NULL,
    [ColorId]      INT            NOT NULL,
    [SerialId]     INT            NOT NULL,
    [SerialNumber] NVARCHAR (2)   NOT NULL,
    [Note]         NVARCHAR (128) NULL,
    [Date]         NVARCHAR (32)  NULL,
    [AddDate]      DATETIME       NOT NULL,
    CONSTRAINT [PK_dbo.Tickets] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Tickets_dbo.Colors_ColorId] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Colors] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.Tickets_dbo.Packages_PackageId] FOREIGN KEY ([PackageId]) REFERENCES [dbo].[Packages] ([Id]),
    CONSTRAINT [FK_dbo.Tickets_dbo.Serials_SerialId] FOREIGN KEY ([SerialId]) REFERENCES [dbo].[Serials] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_PackageId]
    ON [dbo].[Tickets]([PackageId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ColorId]
    ON [dbo].[Tickets]([ColorId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SerialId]
    ON [dbo].[Tickets]([SerialId] ASC);


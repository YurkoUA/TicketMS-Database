﻿CREATE TABLE [dbo].[Ticket] (
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
    CONSTRAINT [FK_dbo.Tickets_dbo.Colors_ColorId] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Color] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.Tickets_dbo.Packages_PackageId] FOREIGN KEY ([PackageId]) REFERENCES [dbo].[Package] ([Id]),
    CONSTRAINT [FK_dbo.Tickets_dbo.Serials_SerialId] FOREIGN KEY ([SerialId]) REFERENCES [dbo].[Serial] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_PackageId]
    ON [dbo].[Ticket]([PackageId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ColorId]
    ON [dbo].[Ticket]([ColorId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SerialId]
    ON [dbo].[Ticket]([SerialId] ASC);

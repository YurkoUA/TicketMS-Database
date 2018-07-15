CREATE TABLE [dbo].[Packages] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [RowVersion]  ROWVERSION     NOT NULL,
    [ColorId]     INT            NULL,
    [SerialId]    INT            NULL,
    [Nominal]     FLOAT (53)     NOT NULL,
    [IsOpened]    BIT            DEFAULT ((1)) NOT NULL,
    [Date]        DATETIME       NOT NULL,
    [Note]        NVARCHAR (128) NULL,
    [IsSpecial]   BIT            DEFAULT ((0)) NOT NULL,
    [FirstNumber] INT            NULL,
    [Name]        NVARCHAR (64)  NULL,
    CONSTRAINT [PK_dbo.Packages] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Packages_dbo.Colors_ColorId] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Colors] ([Id]),
    CONSTRAINT [FK_dbo.Packages_dbo.Serials_SerialId] FOREIGN KEY ([SerialId]) REFERENCES [dbo].[Serials] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ColorId]
    ON [dbo].[Packages]([ColorId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SerialId]
    ON [dbo].[Packages]([SerialId] ASC);


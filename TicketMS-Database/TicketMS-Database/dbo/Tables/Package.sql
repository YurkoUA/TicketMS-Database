CREATE TABLE [dbo].[Package] (
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
    CONSTRAINT [PK_dbo.Package] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Package_dbo.Color_ColorId] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Color] ([Id]),
    CONSTRAINT [FK_dbo.Package_dbo.Series_SerialId] FOREIGN KEY ([SerialId]) REFERENCES [dbo].[Serial] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ColorId]
    ON [dbo].[Package]([ColorId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SerialId]
    ON [dbo].[Package]([SerialId] ASC);


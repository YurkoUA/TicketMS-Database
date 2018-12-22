CREATE TABLE [dbo].[Package] (
	[Id]          INT            IDENTITY (1, 1) NOT NULL,
	[Name]        NVARCHAR (64)  NULL,
	[ColorId]     INT            NULL,
	[SerialId]    INT            NULL,
	[NominalId]	  INT			 NOT NULL,
	[IsOpened]    BIT            DEFAULT ((1)) NOT NULL,
	[CreatedDate] DATETIME       DEFAULT ((GETUTCDATE())) NOT NULL,
	[Note]        NVARCHAR (128) NULL,
	[IsSpecial]   BIT            DEFAULT ((0)) NOT NULL,
	[FirstDigit]  INT			 CHECK([FirstDigit] >= 0 AND [FirstDigit] <= 9)	NULL,
	[IsDeleted]	  BIT			 DEFAULT ((0)) NOT NULL,
	[DeletedDate] DATETIME		 NULL

	CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Package_Color] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Color] ([Id]),
	CONSTRAINT [FK_Package_Serial] FOREIGN KEY ([SerialId]) REFERENCES [dbo].[Serial] ([Id]),
	CONSTRAINT [FK_Package_Nominal] FOREIGN KEY ([NominalId]) REFERENCES [dbo].[Nominal] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ColorId]
	ON [dbo].[Package]([ColorId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SerialId]
	ON [dbo].[Package]([SerialId] ASC);
	
GO
CREATE NONCLUSTERED INDEX [IX_NominalId]
	ON [dbo].[Package]([NominalId] ASC);


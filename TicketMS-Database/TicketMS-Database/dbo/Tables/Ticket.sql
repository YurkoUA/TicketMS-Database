﻿CREATE TABLE [dbo].[Ticket] (
	[Id]           INT            IDENTITY (1, 1) NOT NULL,
	[Number]       NVARCHAR (6)   NOT NULL,
	[PackageId]    INT            NULL,
	[NominalId]	   INT			  NOT NULL,
	[ColorId]      INT            NOT NULL,
	[SerialId]     INT            NOT NULL,
	[SerialNumber] NVARCHAR (2)   NOT NULL,
	[Note]         NVARCHAR (128) NULL,
	[Date]         NVARCHAR (32)  NULL,
	[CreatedDate]  DATETIME       NOT NULL DEFAULT((GETUTCDATE()))

	CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Ticket_Color] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Color] ([Id]),
	CONSTRAINT [FK_Ticket_Package] FOREIGN KEY ([PackageId]) REFERENCES [dbo].[Package] ([Id]),
	CONSTRAINT [FK_Ticket_Serial] FOREIGN KEY ([SerialId]) REFERENCES [dbo].[Serial] ([Id]),
	CONSTRAINT [FK_Ticket_Nominal] FOREIGN KEY ([NominalId]) REFERENCES [dbo].[Nominal] ([Id])
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
	
GO
CREATE NONCLUSTERED INDEX [IX_NominalId]
	ON [dbo].[Ticket]([NominalId] ASC);


CREATE TABLE [dbo].[Color] (
	[Id]			INT           IDENTITY (1, 1) NOT NULL,
	[Name]			NVARCHAR (32) NOT NULL,
	[PaletteName]	NVARCHAR (32) NOT NULL,
	CONSTRAINT [PK_dbo.Color] PRIMARY KEY CLUSTERED ([Id] ASC)
);


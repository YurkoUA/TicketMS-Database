CREATE TABLE [dbo].[User] (
	[Id]           INT             IDENTITY (1, 1) NOT NULL,
	[Email]        NVARCHAR (128)  NOT NULL,
	[UserName]     NVARCHAR (64)   NOT NULL,
	[PasswordHash] VARBINARY (MAX) NOT NULL,
	[Salt]         VARBINARY (MAX) NOT NULL,
	[RoleId]       INT             NOT NULL,
	[TelegramId]   INT			   NULL

	CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_dbo.User_dbo.Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RoleId]
	ON [dbo].[User]([RoleId] ASC);


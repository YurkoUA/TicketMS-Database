CREATE TABLE [dbo].[User] (
	[Id]           INT             IDENTITY (1, 1) NOT NULL,
	[Email]        NVARCHAR (128)  NOT NULL,
	[UserName]     NVARCHAR (64)   NOT NULL,
	[PasswordHash] VARBINARY (MAX) NOT NULL,
	[Salt]         VARBINARY (MAX) NOT NULL,
	[RoleId]       INT             NOT NULL,
	[TelegramId]   INT			   NULL

	CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_User_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[eRole] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RoleId]
	ON [dbo].[User]([RoleId] ASC);


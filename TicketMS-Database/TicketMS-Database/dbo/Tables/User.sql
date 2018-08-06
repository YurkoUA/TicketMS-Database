CREATE TABLE [dbo].[User] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [Email]        NVARCHAR (64)   NOT NULL,
    [UserName]     NVARCHAR (64)   NOT NULL,
    [PasswordHash] VARBINARY (MAX) NOT NULL,
    [Salt]         VARBINARY (MAX) NOT NULL,
    [RoleId]       INT             NOT NULL,
    CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_RoleId]
    ON [dbo].[User]([RoleId] ASC);


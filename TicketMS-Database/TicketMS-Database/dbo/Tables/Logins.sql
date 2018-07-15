CREATE TABLE [dbo].[Logins] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [UserId]    INT            NOT NULL,
    [Date]      DATETIME       NOT NULL,
    [IpAddress] NVARCHAR (MAX) NOT NULL,
    [Browser]   NVARCHAR (MAX) NULL,
    [UserAgent] NVARCHAR (MAX) NULL,
    [Type]      NVARCHAR (MAX) NULL,
    [Host]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Logins] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Logins_dbo.Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[Logins]([UserId] ASC);


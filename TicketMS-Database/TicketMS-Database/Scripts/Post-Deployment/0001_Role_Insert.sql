DECLARE @Role_0001 TABLE	(
	[Id]			INT,
	[Name]			NVARCHAR(32),
	[Description]	NVARCHAR(32)
)

INSERT INTO @Role_0001([Id], [Name], [Description])
VALUES	(1, 'User', N'Користувач'),
		(2, 'Admin', N'Адміністратор')

INSERT INTO [Role] ([Id], [Name], [Description])
SELECT temp.[Id], temp.[Name], temp.[Description]
FROM @Role_0001 AS temp
LEFT JOIN [Role] AS actual ON actual.[Id] = temp.[Id]
WHERE actual.[Id] IS NULL
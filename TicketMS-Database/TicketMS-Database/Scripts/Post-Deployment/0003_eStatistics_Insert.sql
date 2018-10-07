DECLARE @Statistics_0003 TABLE (
	[Id] INT,
	[Alias] NVARCHAR(64),
	[Title] NVARCHAR(64),
	[SPName] NVARCHAR(64)
)


INSERT INTO @Statistics_0003([Id], [Alias], [Title], [SPName])
VALUES	(1, 'TicketsColor', N'Квитки за кольором', 'USP_Statistics_Colors'),
		(2, 'TicketsFirstDigit', N'Квитки за першою цифрою', 'USP_Statistics_FirstDigit'),
		(3, 'TicketsSerial', N'Квитки за серією', 'USP_Statistics_Series'),
		(4, 'TicketsFirstDigitHappy', N'Щасливі квитки за першою цифрою', 'USP_Statistics_HappyByFirstDigit'),
		(5, 'TicketsSerialHappy', N'Щасливі квитки за серією', 'USP_Statistics_HappyBySerial')

INSERT INTO [dbo].[eStatistics]([Id], [Alias], [Title], [SPName])
SELECT	temp.[Id], temp.[Alias], temp.[Title], temp.[SPName]
FROM @Statistics_0003 AS [temp]
LEFT JOIN [dbo].[eStatistics] AS [actual] ON [actual].[Id] = [temp].[Id]
WHERE [actual].[Id] IS NULL
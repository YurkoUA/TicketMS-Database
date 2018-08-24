CREATE PROCEDURE [dbo].[USP_Ticket_Get]
	@id INT
AS
	SELECT	[t].[Id],
			[t].[Number],
			[t].[SerialNumber],
			[t].[CreatedDate],
			[t].[Date],
			[t].[Note],
			[t].[FirstDigit],
			[t].[IsHappy],
			[dbo].[fn_Ticket_GetDuplicatesWithCount]([t].[Id]) AS [DuplicatesCount],

			-- Package
			[t].[PackageId]		AS [Id],
			[t].[PackageName]	AS [Name],

			-- Serial
			[t].[SerialId]		AS [Id],
			[t].[SerialName]	AS [Name],

			-- Color
			[t].[ColorId]		AS [Id],
			[t].[ColorName]		AS [Name],

			-- Nominal
			[t].[NominalId]		AS [Id],
			[t].[Value]


	FROM [v_Tickets] AS [t]
	WHERE [t].[Id] = @id

RETURN 0

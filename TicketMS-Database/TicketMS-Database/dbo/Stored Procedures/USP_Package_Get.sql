CREATE PROCEDURE [dbo].[USP_Package_Get]
	@id INT
AS
	SELECT	[p].[PackageId]		AS [Id],
			[p].[PackageName]	AS [Name],
			[p].[IsOpened],
			[p].[IsSpecial],
			[p].[FirstDigit],
			[p].[Note],
			[p].[CreatedDate],
			[p].[TicketsCount],
			[dbo].[fn_Ticket_FilterCount]([p].[FirstDigit], [p].[SerialId], [p].[ColorId], [p].[NominalId], 1) AS [UnallocatedToMoveCount],

			-- Serial
			[p].[SerialId]		AS [Id],
			[p].[SerialName]	AS [Name],

			-- Color
			[p].[ColorId]		AS [Id],
			[p].[ColorName]		AS [Name],

			-- Nominal
			[p].[NominalId]		AS [Id],
			[p].[Value]

	FROM [v_Packages] AS [p]
	WHERE [p].[PackageId] = @id

RETURN 0

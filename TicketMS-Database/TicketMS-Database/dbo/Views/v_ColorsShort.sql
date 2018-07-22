CREATE VIEW [dbo].[v_ColorsShort]
AS

SELECT	[Id]
		,[Name]
FROM [Color]
ORDER BY [Name]
OFFSET 0 ROWS

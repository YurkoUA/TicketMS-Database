CREATE VIEW [dbo].[v_SeriesShort]
AS

SELECT	[Id]
		,[Name]
FROM [Serial]
ORDER BY [Name]
OFFSET 0 ROWS

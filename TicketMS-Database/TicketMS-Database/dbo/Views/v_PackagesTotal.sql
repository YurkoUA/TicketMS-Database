CREATE VIEW [dbo].[v_PackagesTotal]
AS

SELECT	COUNT(*)											AS [TotalCount],
		SUM(CASE p.[IsOpened] WHEN 1 THEN 1 ELSE 0 END)		AS [OpenedCount],
		SUM(CASE p.[IsSpecial] WHEN 1 THEN 1 ELSE 0 END)	AS [SpecialCount]

FROM [Package] AS [p]
WHERE [p].[IsDeleted] = 0

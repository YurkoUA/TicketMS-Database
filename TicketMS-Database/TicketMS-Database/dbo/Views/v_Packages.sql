CREATE VIEW [dbo].[v_Packages]
AS

SELECT *
FROM [v_PackagesIncDeleted]
WHERE [IsDeleted] = 0

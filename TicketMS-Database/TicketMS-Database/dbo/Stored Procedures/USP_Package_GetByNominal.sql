CREATE PROCEDURE [dbo].[USP_Package_GetByNominal]
	@nominalId INT
AS
	SELECT * 
	FROM [v_Packages] 
	WHERE [NominalId] = @nominalId
	ORDER BY [PackageId] DESC
RETURN 0

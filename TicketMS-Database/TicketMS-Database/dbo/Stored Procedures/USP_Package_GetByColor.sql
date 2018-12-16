CREATE PROCEDURE [dbo].[USP_Package_GetByColor]
	@colorId INT
AS
	SELECT * 
	FROM [v_Packages] 
	WHERE [ColorId] = @colorId
	ORDER BY [PackageId] DESC
RETURN 0

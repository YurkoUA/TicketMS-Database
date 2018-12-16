CREATE PROCEDURE [dbo].[USP_Package_GetBySerial]
	@serialId INT
AS
	SELECT * 
	FROM [v_Packages] 
	WHERE [SerialId] = @serialId
	ORDER BY [PackageId] DESC
RETURN 0

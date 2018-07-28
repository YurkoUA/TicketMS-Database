CREATE PROCEDURE [dbo].[USP_Tickets_GetByPackage]
	@PackageId INT
AS
	SELECT * FROM [v_Tickets] WHERE [PackageId] = @PackageId
RETURN 0

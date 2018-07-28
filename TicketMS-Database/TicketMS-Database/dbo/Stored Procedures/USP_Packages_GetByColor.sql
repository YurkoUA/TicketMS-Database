CREATE PROCEDURE [dbo].[USP_Packages_GetByColor]
	@ColorId INT
AS
	SELECT * FROM [v_Packages] WHERE [ColorId] = @ColorId
RETURN 0

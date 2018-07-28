CREATE PROCEDURE [dbo].[USP_Packages_GetBySerial]
	@SerialId INT
AS
	SELECT * FROM [v_Packages] WHERE [SerialId] = @SerialId
RETURN 0

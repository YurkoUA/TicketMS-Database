CREATE PROCEDURE [dbo].[USP_Ticket_GetByPackage]
	@packageId INT
AS
	SELECT * FROM [v_Tickets] WHERE [PackageId] = @packageId
RETURN 0

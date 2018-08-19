CREATE FUNCTION [dbo].[fn_Ticket_CanBeEdited]
(
	@id			INT,
	@nominalId	INT,
	@colorId	INT,
	@serialId	INT
)
RETURNS BIT
AS
BEGIN
	DECLARE @packageId INT = [dbo].[fn_Ticket_GetPackageId](@id)

	IF @packageId IS NULL
		RETURN 1

	IF EXISTS (SELECT 1 FROM [Package] WHERE [Id] = @packageId 
										AND [NominalId] = @nominalId
										AND ([ColorId] = @colorId OR [ColorId] IS NULL)
										AND ([SerialId] = @serialId) OR [SerialId] IS NULL)
		RETURN 1

	RETURN 0
END

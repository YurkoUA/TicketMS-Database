CREATE PROCEDURE [dbo].[USP_Package_SetOpened]
	@id			INT,
	@isOpened	BIT
AS
	UPDATE [Package]
		SET [IsOpened] = @isOpened
		WHERE [Id] = @id
RETURN 0

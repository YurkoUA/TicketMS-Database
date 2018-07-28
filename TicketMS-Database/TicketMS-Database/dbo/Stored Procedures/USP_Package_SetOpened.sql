CREATE PROCEDURE [dbo].[USP_Package_SetOpened]
	@Id			INT,
	@IsOpened	BIT
AS
	UPDATE [Package]
		SET [IsOpened] = @IsOpened
		WHERE [Id] = @Id
RETURN 0

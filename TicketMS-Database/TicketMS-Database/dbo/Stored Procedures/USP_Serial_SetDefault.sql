CREATE PROCEDURE [dbo].[USP_Serial_SetDefault]
	@id INT
AS
	DECLARE @transactionName NVARCHAR(MAX) = 'Serial_SetDefault'
	
	BEGIN TRANSACTION @transactionName;

	BEGIN TRY
		UPDATE [Serial] SET
			[IsDefault] = 0
			WHERE [Id] != @id

		UPDATE [Serial] SET
			[IsDefault] = 1
			WHERE [Id] = @id
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION @transactionName;
		END;
		THROW;
	END CATCH;

	IF @@TRANCOUNT > 0
	BEGIN
		COMMIT TRANSACTION @TransactionName;
	END;
RETURN 0

CREATE PROCEDURE [dbo].[USP_Report_Create]
	@date			DATETIME,
	@isAutomatic	BIT,
	@documents		UDT_ReportDocument READONLY
AS
	DECLARE @transactionName NVARCHAR(MAX) = 'Report_Create'
	
	BEGIN TRANSACTION @transactionName;

	BEGIN TRY
		DECLARE @reportId INT

		INSERT INTO [Report]([Date], [IsAutomatic])
		VALUES (@date, @isAutomatic)

		SET @reportId = SCOPE_IDENTITY()

		INSERT INTO [ReportDocument]([ReportId], [TypeId], [FileUrl])
		SELECT @reportId, d.[TypeId], d.[FileUrl]
		FROM @documents AS [d]

		EXEC USP_ReportPackage_Insert @reportId
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
RETURN @reportId

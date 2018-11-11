CREATE PROCEDURE [dbo].[USP_Statistics_RunId]
	@id INT,
	@startDate DATETIME,
	@endDate DATETIME
AS
	DECLARE @spName NVARCHAR(64)

	SELECT @spName = [SPName]
	FROM [tStatistics]
	WHERE [Id] = @id

	IF @spName IS NOT NULL
	BEGIN
		DECLARE @query NVARCHAR(MAX) = CONCAT('EXEC ', @spName, ' "', @startDate, '", "', @endDate, '"')
		EXEC(@query)
	END

RETURN 0

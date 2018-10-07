CREATE PROCEDURE [dbo].[USP_Statistics_RunAlias]
	@alias NVARCHAR(64),
	@startDate DATETIME,
	@endDate DATETIME
AS
	DECLARE @spName NVARCHAR(64)

	SELECT @spName = [SPName]
	FROM [eStatistics]
	WHERE [Alias] = @alias

	IF @spName IS NOT NULL
	BEGIN
		DECLARE @query NVARCHAR(MAX) = CONCAT('EXEC ', @spName, ' "', @startDate, '", "', @endDate, '"')
		EXEC(@query)
	END
RETURN 0

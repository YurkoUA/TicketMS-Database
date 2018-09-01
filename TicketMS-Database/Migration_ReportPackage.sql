BEGIN TRANSACTION
	DECLARE @reportId INT
	DECLARE @reportDate DATETIME
	
	DECLARE @cursor CURSOR
	SET @cursor = CURSOR FORWARD_ONLY
		FOR SELECT r.[Id], r.[Date] FROM [Report] AS [r]
			WHERE r.[Id] NOT IN (SELECT [ReportId] FROM [ReportPackage])

	OPEN @cursor
	FETCH NEXT FROM @cursor INTO @reportId, @reportDate

	WHILE @@FETCH_STATUS = 0
		BEGIN;
			INSERT INTO [ReportPackage]([ReportId], [PackageId], [TicketsCount])
				SELECT @reportId, p.[Id], COUNT(*)
				FROM [Package] AS [p]
				JOIN [Ticket] AS [t] ON t.[PackageId] = p.[Id]

				WHERE p.[CreatedDate] <= @reportDate AND t.[CreatedDate] <= @reportDate
				GROUP BY p.[Id]

			
			FETCH NEXT FROM @cursor INTO @reportId, @reportDate
		END

	CLOSE @cursor
COMMIT TRANSACTION
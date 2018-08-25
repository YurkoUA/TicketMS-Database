CREATE PROCEDURE [dbo].[USP_Summary_Create]
AS
	DECLARE @packagesCount INT = (SELECT COUNT(*) FROM [Package])

	INSERT INTO [Summary] ([Date], [Tickets], [HappyTickets], [Packages])
	SELECT	GETUTCDATE(),
			COUNT(*),
			SUM(CASE [dbo].[fn_Number_IsHappy]([Number]) WHEN 1 THEN 1 ELSE 0 END),
			@packagesCount

			FROM [Ticket]
RETURN 0

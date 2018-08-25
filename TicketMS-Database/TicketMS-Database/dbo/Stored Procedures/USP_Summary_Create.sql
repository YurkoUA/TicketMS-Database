CREATE PROCEDURE [dbo].[USP_Summary_Create]
AS
	DECLARE @date DATETIME = GETUTCDATE()

	IF EXISTS (SELECT 1 FROM [Summary] WHERE YEAR([Date]) = YEAR(@date) AND MONTH([Date]) = MONTH(@date))
	BEGIN;
		THROW 50001, N'Підсумок за даний місяць вже існує.', 1;
	END

	DECLARE @packagesCount INT = (SELECT COUNT(*) FROM [Package])

	INSERT INTO [Summary] ([Date], [Tickets], [HappyTickets], [Packages])
	SELECT	@date,
			COUNT(*),
			SUM(CASE [dbo].[fn_Number_IsHappy]([Number]) WHEN 1 THEN 1 ELSE 0 END),
			@packagesCount

			FROM [Ticket]
RETURN 0

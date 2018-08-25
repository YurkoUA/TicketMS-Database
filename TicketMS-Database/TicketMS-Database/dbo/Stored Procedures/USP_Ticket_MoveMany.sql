CREATE PROCEDURE [dbo].[USP_Ticket_MoveMany]
	@ticketsIds	IntArrayType READONLY,
	@packageId	INT
AS
	IF ([dbo].[fn_Ticket_CanManyBeMoved](@ticketsIds, @packageId) = 0)
	BEGIN;
		THROW 50002, N'Квитки не можуть бути переміщені до пачки.', 1;
	END

	UPDATE [Ticket] SET [PackageId] = @packageId
	WHERE [Id] IN (SELECT [Item] FROM @ticketsIds)
RETURN 0

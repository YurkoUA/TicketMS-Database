CREATE PROCEDURE [dbo].[USP_Ticket_Edit]
	@id				INT,
	@nominalId		INT,
	@colorId		INT,
	@serialId		INT,
	@serialNumber	NVARCHAR(2),
	@note			NVARCHAR(128),
	@date			NVARCHAR(32)
AS
	DECLARE @number NVARCHAR(6) = [dbo].[fn_Ticket_GetNumber](@id)

	IF ([dbo].[fn_Ticket_Exists](@number, @colorId, @serialId, @serialNumber, @id) = 1)
	BEGIN;
		THROW 50002, N'Даний квиток вже існує.', 1;
	END

	IF ([dbo].[fn_Ticket_CanBeEdited](@id, @nominalId, @colorId, @serialId) = 0)
	BEGIN;
		THROW 50002, N'Квиток не може бути відредаговано, бо він не сумісний з пачкою.', 1;
	END

	UPDATE [Ticket] SET
		[NominalId] = @nominalId,
		[ColorId] = @colorId,
		[SerialId] = @serialId,
		[SerialNumber] = @serialNumber,
		[Note] = @note,
		[Date] = @date

	WHERE [Id] = @id

RETURN 0

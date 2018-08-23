CREATE PROCEDURE [dbo].[USP_Ticket_Edit]
	@id				INT,
	@number			NVARCHAR(6),
	@packageId		INT,
	@nominalId		INT,
	@colorId		INT,
	@serialId		INT,
	@serialNumber	NVARCHAR(2),
	@note			NVARCHAR(128),
	@date			NVARCHAR(32)
AS
	IF ([dbo].[fn_Ticket_Exists](@number, @colorId, @serialId, @serialNumber, @id) = 1)
	BEGIN;
		THROW 50002, N'Даний квиток вже існує.', 1;
	END

	UPDATE [Ticket] SET
		[Number] = @number,
		[PackageId] = @packageId,
		[NominalId] = @nominalId,
		[ColorId] = @colorId,
		[SerialId] = @serialId,
		[SerialNumber] = @serialNumber,
		[Note] = @note,
		[Date] = @date

	WHERE [Id] = @id

RETURN 0

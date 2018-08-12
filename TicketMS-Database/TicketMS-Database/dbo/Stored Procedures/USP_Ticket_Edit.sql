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

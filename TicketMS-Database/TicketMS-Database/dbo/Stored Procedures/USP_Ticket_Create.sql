CREATE PROCEDURE [dbo].[USP_Ticket_Create]
	@number			NVARCHAR(6),
	@packageId		INT,
	@nominalId		INT,
	@colorId		INT,
	@serialId		INT,
	@serialNumber	NVARCHAR(2),
	@note			NVARCHAR(128),
	@date			NVARCHAR(32)
AS
	DECLARE @id INT

	INSERT INTO [Ticket]([Number], [PackageId], [NominalId], [ColorId], [SerialId], [SerialNumber], [Note], [Date])
		VALUES(@number, @packageId, @nominalId, @colorId, @serialId, @serialNumber, @note, @date)

	SELECT @id = SCOPE_IDENTITY()

RETURN @id

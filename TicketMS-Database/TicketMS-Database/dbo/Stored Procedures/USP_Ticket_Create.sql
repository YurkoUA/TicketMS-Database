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
	IF ([dbo].[fn_Ticket_Exists](@number, @colorId, @serialId, @serialNumber) = 1)
	BEGIN;
		THROW 50001, N'Даний квиток вже існує.', 1;
	END

	INSERT INTO [Ticket]([Number], [PackageId], [NominalId], [ColorId], [SerialId], [SerialNumber], [Note], [Date])
		VALUES(@number, @packageId, @nominalId, @colorId, @serialId, @serialNumber, @note, @date)

	DECLARE @id INT = SCOPE_IDENTITY()

RETURN @id

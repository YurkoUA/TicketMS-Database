CREATE PROCEDURE [dbo].[USP_Ticket_Create]
	@number			NVARCHAR(6),
	@packageId		INT,
	@nominalId		INT,
	@colorId		INT,
	@serialId		INT,
	@serialNumber	NVARCHAR(2),
	@note			NVARCHAR(128),
	@date			NVARCHAR(32),

	@id				INT OUTPUT
AS
	IF ([dbo].[fn_Ticket_Exists](@number, @colorId, @serialId, @serialNumber, NULL) = 1)
	BEGIN;
		THROW 50001, N'Даний квиток вже існує.', 1;
	END

	IF @packageId IS NOT NULL
	BEGIN;
		IF ([dbo].[fn_Ticket_CanBeCreatedInPackage](@number, @packageId, @nominalId, @colorId, @serialId) = 0)
		BEGIN;
			THROW 50001, N'Квиток не сумісний за пачкою.', 1;
		END
	END

	INSERT INTO [Ticket]([Number], [PackageId], [NominalId], [ColorId], [SerialId], [SerialNumber], [Note], [Date])
		VALUES(@number, @packageId, @nominalId, @colorId, @serialId, @serialNumber, @note, @date)

	SET @id = SCOPE_IDENTITY()

RETURN 0

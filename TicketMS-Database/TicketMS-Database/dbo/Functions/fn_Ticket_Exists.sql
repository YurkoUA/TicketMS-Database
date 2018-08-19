CREATE FUNCTION [dbo].[fn_Ticket_Exists]
(
	@number			NVARCHAR(6),
	@colorId		INT,
	@serialId		INT,
	@serialNumber	NVARCHAR(2),
	@id				INT = NULL
)
RETURNS BIT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [Ticket] WHERE [Number] = @number
											AND [ColorId] = @colorId
											AND [SerialId] = @serialId
											AND [SerialNumber] = @serialNumber
											AND ([Id] = @id OR @id IS NULL))

			RETURN 1

	RETURN 0
END

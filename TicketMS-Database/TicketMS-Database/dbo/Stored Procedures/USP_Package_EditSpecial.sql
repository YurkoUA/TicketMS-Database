﻿CREATE PROCEDURE [dbo].[USP_Package_EditSpecial]
	@id			INT,
	@name		NVARCHAR (64),
	@colorId	INT,
	@serialId	INT,
	@nominalId	INT,
	@note		NVARCHAR(128)
AS
	UPDATE [Package] SET
		[Name] = @name,
		[ColorId] = @colorId,
		[SerialId] = @serialId,
		[NominalId] = @nominalId,
		[Note] = @note
	WHERE [Id] = @id

RETURN 0

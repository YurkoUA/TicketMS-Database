﻿CREATE PROCEDURE [dbo].[USP_Package_Delete]
	@id INT
AS
	IF ([dbo].[fn_Package_CanBeDeleted](@id) = 0)
	BEGIN;
		DECLARE @msg NVARCHAR(MAX) = N'Пачку не може бути видалено, оскільки вона містить квитки.';
		THROW 50003, @msg, 1;
	END

	UPDATE [Package] SET
		[IsDeleted] = 1,
		[DeletedDate] = GETUTCDATE()
	WHERE [Id] = @id
RETURN 0

CREATE PROCEDURE [dbo].[USP_Tickets_FindNumber]
	@Number NVARCHAR(6)
AS
	SELECT *
	FROM [v_Tickets] AS [t]
	WHERE [t].[Number] LIKE CONCAT('%', @Number, '%')

RETURN 0

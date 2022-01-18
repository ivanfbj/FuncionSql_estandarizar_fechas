-- =============================================
-- Author:		https://github.com/ivanfbj
-- Create date: 2022-01-17
-- Description:	Función que permite pasar el formato de fecha dd/mm/yy a dd/mm/yyyy, en caso de no tener el formato valido muestra mensaje
-- =============================================
CREATE FUNCTION [dbo].[f_validarFecha]
(
	-- Add the parameters for the function here
		@fecha VARCHAR(300)
)
RETURNS VARCHAR(300)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @nombre VARCHAR(300)

	-- Add the T-SQL statements to compute the return value here
	SET @nombre =

	CASE --Case 1
		WHEN ISDATE(@fecha) = 1
			THEN 
				CASE WHEN (TRY_CONVERT(date, @fecha, 103)) IS NOT NULL THEN convert(varchar,(TRY_CONVERT(date, @fecha, 103)),103)
						WHEN (TRY_CONVERT(date, @fecha, 3)) IS NOT NULL THEN convert(varchar,(TRY_CONVERT(date, @fecha, 3)),103)
				END
	ELSE 
		CASE WHEN @fecha = '' THEN 'FECHA VACIA' 
				WHEN (TRY_CONVERT(date, @fecha, 103)) IS NOT NULL THEN convert(varchar,(TRY_CONVERT(date, @fecha, 103)),103)
				WHEN (TRY_CONVERT(date, @fecha, 3)) IS NOT NULL THEN convert(varchar,(TRY_CONVERT(date, @fecha, 3)),103)
		ELSE 'Fecha invalida'
		END
	END--Case 1

	-- Return the result of the function
	RETURN @nombre
END;

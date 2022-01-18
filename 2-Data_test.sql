/*Si existe la tabla se elimina*/
IF OBJECT_ID (N'tblDates') IS NOT NULL  
    DROP TABLE tblDates;
GO

CREATE TABLE tblDates
(
	dates NVARCHAR(30)
);

INSERT INTO tblDates VALUES ('15/02/2022'),('01/01/21'),('03/02/2005'),('24/12/93'),('20/07/13'),('158745'),('NA'),(''),('10/08/66')

select
	dates
,	'Fecha_estandarizada'	=	dbo.f_validarFecha(dates)
from tblDates
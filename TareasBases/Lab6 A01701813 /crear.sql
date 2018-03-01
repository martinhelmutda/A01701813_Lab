create table Materiales(
	Clave numeric(5),
	Descripcion varchar(50),
	Costo numeric(8,2)
)

create table Proveedores(
	RFC varchar(12),
	RazonSocial varchar(50)
)

create table Proyectos(
	Numero numeric(5),
	Denominacion varchar(50)
)

create table Entregan(
	Clave numeric(5),
	RFC varchar(12),
	Numero numeric(5),
	Fecha datetime,
	Cantidad numeric(5)
)
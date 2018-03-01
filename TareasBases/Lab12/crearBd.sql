/*CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric (8,2)
)

CREATE TABLE Proveedores
(
  RFC char(13) not null,
  RazonSocial varchar(50)
)

CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)

CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
)


SET DATEFORMAT dmy
BULK INSERT a1701813.[Entregan]
   FROM 'e:\wwwroot\A1701813\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1701813.[Proveedores]
   FROM 'e:\wwwroot\A1701813\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1701813.[materiales]
   FROM 'e:\wwwroot\A1701813\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1701813.[Proyectos]
   FROM 'e:\wwwroot\A1701813\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
*/

INSERT INTO Materiales VALUES (1000, 'Hormigon', 1000);

SELECT * FROM Materiales

DELETE FROM Materiales WHERE Clave=100 and Costo=1000;

SELECT * FROM Materiales;

ALTER TABLE Materiales ADD CONSTRAINT llaveMateriales PRIMARY KEY (Clave);

insert INTO Materiales VALUES (1000, 'Hormigon', 1000);



ALTER TABLE Proyectos ADD CONSTRAINT llaveProyectos PRIMARY KEY (Numero);
ALTER TABLE Proveedores ADD CONSTRAINT llaveProveedores PRIMARY KEY (RFC);


--Debemos poner fecha en la primary key, de  lo contrario habrá duplicidad
ALTER TABLE Entregan ADD CONSTRAINT llaveEntrega PRIMARY KEY (Clave, RFC, Numero, Fecha);

SELECT * FROM Proyectos;
SELECT * FROM Proveedores;
SELECT * FROM Materiales;

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0) ;

SELECT * FROM Entregan;

Delete from Entregan where Clave = 0

ALTER TABLE entregan add constraint cfentreganclave
  foreign key (clave) references materiales(clave);

/*No se puede
INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0) ;*/

ALTER TABLE entregan add constraint Rfcentreganclave
  foreign key (RFC) references Proveedores(RFC);

ALTER TABLE entregan add constraint Numeroentregan
  foreign key (Numero) references Proyectos(Numero);

sp_helpconstraint Entregan;

INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);
SELECT * FROM Entregan;

Delete from entregan WHERE Cantidad=0;

ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ;

/* No se puede
INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);
The INSERT statement conflicted with the CHECK constraint "cantidad".
*/

sp_helpconstraint Entregan;
sp_helpconstraint Proveedores;
sp_helpconstraint Proyectos;
sp_helpconstraint Materiales;
 IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaMaterial' AND type = 'P')
                DROP PROCEDURE creaMaterial
            GO

            CREATE PROCEDURE creaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
            GO



 EXECUTE creaMaterial 5000,'Martillos Acme',250,15;


 SELECT * FROM Materiales

 IF EXISTS (SELECT name FROM sysobjects
                      WHERE name = 'modificaMaterial' AND type = 'P')
               DROP PROCEDURE modificaMaterial
           GO

           create procedure modificaMaterial
              @uclave NUMERIC(5,0),
              @udescripcion VARCHAR(50),
              @ucosto NUMERIC(8,2),
              @uimpuesto NUMERIC(6,2)
             AS
                 UPDATE Materiales SET
                   Clave=@uclave, Descripcion=@udescripcion, Costo=@ucosto, PorcentajeImpuesto=@uimpuesto
                  WHERE Clave=@uclave
             GO

 IF EXISTS (SELECT name FROM sysobjects
                      WHERE name = 'eliminaMaterial' AND type = 'P')
               DROP PROCEDURE eliminaMaterial
           GO

           create procedure eliminaMaterial
              @uclave NUMERIC(5,0)
             AS
                DELETE from Materiales
                WHERE Clave=@uclave
             GO


EXECUTE modificaMaterial 5000, 'Martillos Chidos', 300, 14;

SELECT * FROM Materiales

EXECUTE eliminaMaterial 5000;

SELECT * FROM Materiales



/*Ahora para proyectos*/

SELECT * FROM Proyectos;

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProyecto' AND type = 'P')
                DROP PROCEDURE creaProyecto
            GO

            CREATE PROCEDURE creaProyecto
                @unumero NUMERIC(5,0),
                @udenominacion VARCHAR(50)
            AS
                INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
            GO


 IF EXISTS (SELECT name FROM sysobjects
                      WHERE name = 'modificaProyecto' AND type = 'P')
               DROP PROCEDURE modificaProyecto
           GO

           create procedure modificaProyecto
              @unumero NUMERIC(5,0),
              @udenominacion VARCHAR(50)
             AS
                 UPDATE Proyectos SET
                  Numero=@unumero, Denominacion=@udenominacion
                  WHERE Numero=@unumero
             GO

 IF EXISTS (SELECT name FROM sysobjects
                      WHERE name = 'eliminaProyecto' AND type = 'P')
               DROP PROCEDURE eliminaProyecto
           GO

           create procedure eliminaProyecto
              @unumero NUMERIC(5,0)
             AS
                DELETE from Proyectos
                WHERE Numero=@unumero
             GO


EXECUTE creaProyecto 7000, 'Construcción del océano federal';

SELECT * FROM Proyectos;

EXECUTE modificaProyecto 7000, 'Construcción del museo ';

SELECT * FROM Proyectos;

EXECUTE eliminaProyecto 7000;

SELECT * FROM Proyectos;


 /*Ahora para proveedores*/

SELECT * from Proveedores;

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProveedor' AND type = 'P')
                DROP PROCEDURE creaProveedor
            GO

            CREATE PROCEDURE creaProveedor
                @urfc VARCHAR(13),
                @urazonsocial VARCHAR(50)
            AS
                INSERT INTO Proveedores VALUES(@urfc, @urazonsocial)
            GO


 IF EXISTS (SELECT name FROM sysobjects
                      WHERE name = 'modificaProveedor' AND type = 'P')
               DROP PROCEDURE modificaProveedor
           GO

           create procedure modificaProveedor
                @urfc VARCHAR(13),
                @urazonsocial VARCHAR(50)
             AS
                 UPDATE Proveedores SET
                  RFC=@urfc, RazonSocial=@urazonsocial
                  WHERE RFC=@urfc
             GO

 IF EXISTS (SELECT name FROM sysobjects
                      WHERE name = 'eliminaProveedor' AND type = 'P')
               DROP PROCEDURE eliminaProveedor
           GO

           create procedure eliminaProveedor
             @urfc VARCHAR(13)
             AS
                DELETE from Proveedores
                WHERE RFC=@urfc
             GO


EXECUTE creaProveedor 'RARARA8909', 'Juan el herrero';

SELECT * FROM Proveedores;

EXECUTE modificaProveedor 'RARARA8909', 'Herrería el Don Juan';

SELECT * FROM Proveedores;

EXECUTE eliminaProveedor 'RARARA8909';

SELECT * FROM Proveedores;

  /*Ahora para entregan*/

SELECT * from Entregan;

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaEntrega' AND type = 'P')
                DROP PROCEDURE creaEntrega
            GO

            CREATE PROCEDURE creaEntrega
              @uclave NUMERIC(5),
              @urfc VARCHAR(13),
              @unumero NUMERIC(5,0),
              @ufecha datetime,
              @ucantidad NUMERIC(8,2)
            AS
                INSERT INTO Entregan VALUES(@uclave, @urfc, @unumero, @ufecha, @ucantidad)
            GO


 IF EXISTS (SELECT name FROM sysobjects
                      WHERE name = 'modificaEntrega' AND type = 'P')
               DROP PROCEDURE modificaEntrega
           GO

           create procedure modificaEntrega
              @uclave NUMERIC(5),
              @urfc VARCHAR(13),
              @unumero NUMERIC(5,0),
              @ufecha datetime,
              @ucantidad NUMERIC(8,2)
             AS
                 UPDATE Entregan SET
                  RFC=@urfc, Clave=@uclave, Cantidad=@ucantidad, Fecha=@ufecha, Numero=@unumero
                  WHERE Clave=@uclave AND RFC=@urfc and Numero=@unumero and Fecha=@ufecha
             GO

 IF EXISTS (SELECT name FROM sysobjects
                      WHERE name = 'eliminaEntrega' AND type = 'P')
               DROP PROCEDURE eliminaEntrega
           GO

           create procedure eliminaEntrega
              @uclave NUMERIC(5),
              @urfc VARCHAR(13),
              @unumero NUMERIC(5,0),
              @ufecha datetime
             AS
                DELETE from Entregan
                WHERE Clave=@uclave AND RFC=@urfc and Numero=@unumero and Fecha=@ufecha
             GO


EXECUTE creaEntrega 5000,'RARARA8909', 7000, '2000/04/09', 234;

SELECT * FROM Entregan;

EXECUTE modificaEntrega 5000,'RARARA8909', 7000, '2000/04/09', 600;

SELECT * FROM Entregan;

EXECUTE eliminaEntrega 5000,'RARARA8909', 7000, '2000/04/09';

SELECT * FROM Entregan;


  IF EXISTS (SELECT name FROM sysobjects
                                       WHERE name = 'queryMaterial' AND type = 'P')
                                DROP PROCEDURE queryMaterial
                            GO

                            CREATE PROCEDURE queryMaterial
                                @udescripcion VARCHAR(50),
                                @ucosto NUMERIC(8,2)

                            AS
                                SELECT * FROM Materiales WHERE descripcion
                                LIKE '%'+@udescripcion+'%' AND costo > @ucosto
                            GO

 EXECUTE queryMaterial 'Lad',20;
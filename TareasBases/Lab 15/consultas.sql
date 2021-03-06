select * from materiales;

select * from materiales
where clave=1000;

select clave,rfc,fecha from entregan;

select * from materiales,entregan
where materiales.clave = entregan.clave;

select * from entregan,proyectos
where entregan.numero <= proyectos.numero;

(select * from entregan where clave=1450)
union
(select * from entregan where clave=1300);

select * from entregan where clave=1450
select * from entregan where clave=1300;

(select * from entregan)
EXCEPT (select * from entregan where clave=1000);


select * from entregan,materiales;

select * from materiales,entregan
where materiales.clave = entregan.clave
AND Fecha BETWEEN '2000/01/01' AND '2000/12/31';

set dateformat dmy;
select Descripcion from materiales,entregan
where materiales.clave = entregan.clave
AND Fecha BETWEEN '01/01/2000' AND '31/12/2000';

SELECT DISTINCT Descripcion from materiales,entregan
where materiales.clave = entregan.clave
AND Fecha BETWEEN '01/01/2000' AND '31/12/2000';

SELECT Entregan.Numero, Denominacion, Cantidad, Fecha
FROM Proyectos, Entregan
WHERE Entregan.Numero=Proyectos.Numero
ORDER BY Fecha DESC;

SELECT * FROM Materiales
WHERE Descripcion LIKE 'Si'

SELECT (Apellido + ', ' + Nombre) as Nombre FROM Personas;

DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar;

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
SELECT Numero FROM Entregan WHERE Numero LIKE '___6';

SELECT Clave,RFC,Numero,Fecha,Cantidad
FROM Entregan
WHERE Numero Between 5000 and 5010;

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists ( SELECT Proveedores.RFC
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ) ;

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010
AND RFC IN ( SELECT Proveedores.RFC
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] );

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010
AND RFC NOT IN ( SELECT Proveedores.RFC
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] );

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE  Cantidad > SOME (SELECT Cantidad
                  FROM Proveedores
                  WHERE Proveedores.rfc=Entregan.RFC
                  and Proveedores.RFC LIKE 'A%');


SELECT TOP 2 * FROM Proyectos;

--SELECT TOP Numero FROM Proyectos;

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2);
SELECT * FROM Materiales;
UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000;

SELECT Denominacion, sum(Cantidad*(Costo*PorcentajeImpuesto)) as TotalParcial
FROM Entregan, Materiales, Proyectos
WHERE Entregan.Clave=Materiales.Clave
AND Proyectos.Numero=Entregan.Numero
GROUP BY Denominacion;

CREATE VIEW vistosaUnion
  AS (select * from entregan where clave=1450)
union
(select * from entregan where clave=1300);

SELECT * FROM vistosaUnion;

create VIEW entregados2000
as (select Descripcion from materiales,entregan
where materiales.clave = entregan.clave
AND Fecha BETWEEN '01/01/2000' AND '31/12/2000');

SELECT * FROM entregados2000;

CREATE VIEW visto
  AS SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010
AND RFC NOT IN ( SELECT Proveedores.RFC
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] );

SELECT * FROM visto;

CREATE VIEW resta AS
(select * from entregan)
EXCEPT (select * from entregan where clave=1000);

SELECT * FROM resta;

CREATE VIEW primerasLetras
  AS SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';

SELECT * from primerasLetras;

SELECT Entregan.Clave,Descripcion
FROM Materiales, Proyectos, Entregan
WHERE Entregan.Numero=Proyectos.Numero
AND Entregan.Clave=Materiales.Clave
AND Denominacion='Mexico sin ti no estamos completos';

SELECT Entregan.Clave,Descripcion
FROM Materiales, Proveedores, Entregan
WHERE Entregan.RFC=Proveedores.RFC
AND Entregan.Clave=Materiales.Clave
AND RazonSocial='Acme tools';

SELECT Proveedores.RFC, RazonSocial
FROM Proveedores, Entregan
WHERE Entregan.RFC=Proveedores.RFC
AND Fecha BETWEEN '01/01/2000' and '31/12/2000'
AND Cantidad<300;

SELECT Descripcion, sum(Cantidad) as total
FROM materiales, Entregan
WHERE Entregan.Clave=Materiales.Clave
AND Fecha BETWEEN '01/01/2000' and '31/12/2000'
GROUP BY Descripcion;

create VIEW materiales2001 as
SELECT Descripcion, Cantidad, Fecha
FROM Entregan, Materiales
WHERE Entregan.Clave=Materiales.Clave
AND Fecha BETWEEN '01/01/2001' and '31/12/2001'


SELECT top 1 Descripcion, sum(Cantidad)
FROM materiales2001
GROUP BY Descripcion;

SELECT * FROM materiales2001;

SELECT Descripcion
FROM Materiales
WHERE Descripcion LIKE '%ub%';

SELECT Denominacion, sum(Cantidad*(Costo*PorcentajeImpuesto/100)) as TotalParcial
FROM Entregan, Materiales, Proyectos
WHERE Entregan.Clave=Materiales.Clave
AND Proyectos.Numero=Entregan.Numero
GROUP BY Denominacion;

CREATE VIEW educando AS
SELECT Denominacion, Entregan.rfc, RazonSocial
FROM Proveedores, Entregan, Proyectos
WHERE Entregan.RFC=Proveedores.RFC
AND Entregan.Numero=Proyectos.Numero
and Denominacion='Educando en Coahuila';

CREATE VIEW televisa AS
SELECT Denominacion, Entregan.rfc, RazonSocial
FROM Proveedores, Entregan, Proyectos
WHERE Entregan.RFC=Proveedores.RFC
AND Entregan.Numero=Proyectos.Numero
and Denominacion='Televisa en acción';

(SELECT * FROM televisa)
EXCEPT
(select * from educando);

SELECT DISTINCT Denominacion, Entregan.rfc, RazonSocial
FROM Proveedores, Entregan, Proyectos
WHERE Entregan.RFC=Proveedores.RFC
AND Entregan.Numero=Proyectos.Numero
and Denominacion='Televisa en acción'
AND Denominacion NOT IN
    (SELECT Denominacion
    FROM Proveedores, Entregan, Proyectos
    WHERE Entregan.RFC=Proveedores.RFC
    AND Entregan.Numero=Proyectos.Numero
    and Denominacion='Educando en Coahuila');


select costo, Descripcion
from Entregan , proyectos , Proveedores, materiales
where Entregan.Numero= Proyectos.Numero
      and Entregan.RFC= Proveedores.RFC
      and Entregan.Clave=Materiales.Clave
      and Denominacion='Televisa en acción'
      and Proveedores.RFC in (select Proveedores.RFC
                              from Entregan,  proyectos, Proveedores , Materiales
                              where Entregan.Numero= Proyectos.Numero
                              and Entregan.RFC= Proveedores.RFC
                              and Entregan.Clave=Materiales.Clave
                              and Denominacion='Educando en Coahuila')


select Descripcion, count(cantidad) as 'No. Veces',
(Costo+Costo*PorcentajeImpuesto/100)*COUNT(cantidad) as 'total'
from Entregan, materiales
where Entregan.Clave=Materiales.Clave
group by Descripcion,PorcentajeImpuesto,Costo
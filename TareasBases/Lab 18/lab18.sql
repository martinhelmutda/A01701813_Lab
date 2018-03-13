set DATEFORMAT dmy
select e.Clave, sum(Cantidad) as Cantidad, sum(Cantidad*Costo+(Costo*m.PorcentajeImpuesto/100)) as ImporteTotal
from Entregan e, Materiales m
WHERE e.Clave = m.Clave and Fecha between '01/01/1997' and '31/12/1997'
group by e.Clave;

SELECT * from Entregan;

SELECT RazonSocial, count(e.Clave) as CantidadEntregas, sum(Cantidad*Costo+(Costo*m.PorcentajeImpuesto/100)) as ImporteTotal
from Materiales m, Proveedores p, Entregan e
where m.Clave=e.Clave and p.RFC = e.RFC
group by RazonSocial;


SELECT RazonSocial, Entregan.rfc from Proveedores, Entregan
WHERE Proveedores.RFC=Entregan.RFC

--Por cada material obtener la clave y descripción del material, la cantidad total entregada,
-- la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas
--  de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.

select m.Clave, Descripcion, avg(cantidad) as CantidadPromedio,
  min(Cantidad) as MinimaCantidad, max(Cantidad) as MaximaCantidad,
  sum(Cantidad*Costo+(Costo*m.PorcentajeImpuesto/100)) as ImporteTotal
from Materiales m, Entregan e
where e.Clave = m.Clave
group by m.Clave, m.Descripcion
having avg(Cantidad)>400;

--Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado,
--  detallando la clave y descripción del material, excluyendo aquellos proveedores para los que
-- la cantidad promedio sea menor a 500.
SELECT RazonSocial, m.Clave, m.Descripcion, avg(Cantidad) as CantidadPromedio
from Entregan e, Materiales m, Proveedores p
where e.Clave=m.Clave and e.RFC=p.RFC
group by RazonSocial, m.Clave, m.Descripcion
having avg(Cantidad)< 500;

-- Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de
-- proveedores: aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para
-- los que la cantidad promedio entregada sea mayor a 450.
SELECT RazonSocial, m.Clave, m.Descripcion, avg(Cantidad) as CantidadPromedio
from Entregan e, Materiales m, Proveedores p
where e.Clave=m.Clave and e.RFC=p.RFC
group by RazonSocial, m.Clave, m.Descripcion
having avg(Cantidad) not between 370 and 450
order by 'CantidadPromedio';

--inserta cinco nuevos materiales.

INSERT INTO Materiales VALUES (1009, 'Hormigón', 500, 2.01);
INSERT INTO Materiales VALUES (1014, 'Tubería Bronce 1/4', 273, 2.33);
INSERT INTO Materiales VALUES (1003, 'Loseta metro', 810, 2.013)
INSERT INTO Materiales VALUES (1006, 'Alambre metro', 123, 2.1)
INSERT INTO Materiales VALUES (1007, 'Madera ', 480, 3.22);
SELECT * FROM Materialesb;

--Clave y descripción de los materiales que nunca han sido entregados.
select Clave, Descripcion from Materiales
where clave not in (select Clave from Entregan);

--Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México'
-- como al proyecto 'Querétaro Limpio'.
SELECT DISTINCT RazonSocial from Proveedores pv, Entregan e, Proyectos pr
WHERE  e.RFC=pv.RFC and e.Numero=pr.Numero And Denominacion='Vamos Mexico' AND RazonSocial in
(SELECT RazonSocial from Proveedores pv, Entregan e, Proyectos pr
  WHERE e.RFC=pv.RFC and e.Numero=pr.Numero and Denominacion = 'Queretaro Limpio');

--Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'.
SELECT Descripcion from Materiales
WHERE  Descripcion not in
(SELECT distinct descripcion from Materiales m, Entregan e, Proyectos pr
  WHERE e.Clave=m.Clave  and e.Numero=pr.Numero and Denominacion = 'CIT Yucatan');

--Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada
-- es mayor al promedio de la cantidad entregada por el proveedor con el RFC 'VAGO780901'.
SELECT RazonSocial, avg(Cantidad) as CantidadPromedio
from Proveedores p, Entregan e
where e.RFC=p.RFC
group by RazonSocial
having avg(Cantidad) > (select AVG(Cantidad) from entregan
where RFC='VAGO780901');

--RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas
-- cantidades totales entregadas en el 2000 fueron mayores a las cantidades totales entregadas en el 2001.
set DATEFORMAT dmy;
SELECT e.rfc, RazonSocial FROM Proveedores pv, Entregan e, Proyectos pr
where e.RFC=pv.RFC and e.Numero=pr.Numero and  Fecha between '01/01/2000' and '31/01/2000'
      and Denominacion='Infonavit Durango'
group by e.RFC, RazonSocial
having sum(Cantidad)>(select sum(Cantidad) from Proveedores pv, Entregan e, Proyectos pr
  where e.RFC=pv.RFC and e.Numero=pr.Numero and fecha between
						'01/01/2001' and '31/12/2001' and Denominacion='Infonavit Durango');



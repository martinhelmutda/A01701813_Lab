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
CREATE TABLE Clientes_Banca (
  NoCuenta VARCHAR(5) NOT NULL PRIMARY KEY,
  Nombre   VARCHAR(30),
  Saldo    NUMERIC(10, 2)
);

CREATE TABLE Tipos_Movimiento(
  ClaveM varchar(2) not null primary key,
  Descripcion varchar(30)
);

CREATE TABLE Movimiento (
  NoCuenta VARCHAR(5) FOREIGN KEY REFERENCES Clientes_Banca(NoCuenta),
  ClaveM   VARCHAR(2) FOREIGN KEY REFERENCES Tipos_Movimiento(ClaveM),
  Fecha    DATETIME,
  Monto    NUMERIC(10, 2)
);

BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1;

--Prueba de que se agregaron
select * from Clientes_Banca;

BEGIN TRANSACTION PRUEBA2
INSERT INTO Clientes_Banca VALUES('004','Ricardo Rios Maldonado',19000);
INSERT INTO Clientes_Banca VALUES('005','Pablo Ortiz Arana',15000);
INSERT INTO Clientes_Banca VALUES('006','Luis Manuel Alvarado',18000);

ROLLBACK TRANSACTION PRUEBA2;

--Prueba de que se agregaron
SELECT * FROM Clientes_Banca;

BEGIN TRANSACTION PRUEBA3
INSERT INTO Tipos_Movimiento VALUES('A','Retiro Cajero Automatico');
INSERT INTO Tipos_Movimiento VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3;

--Prueba de que se agregaron
SELECT * FROM Tipos_Movimiento

BEGIN TRANSACTION PRUEBA4
INSERT INTO Movimiento VALUES('001','A',GETDATE(),500);
UPDATE Clientes_Banca SET Saldo = Saldo -500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4;

--Prueba de que se agregaron
SELECT * FROM Clientes_Banca;

--Prueba de que se agregaron
SELECT * FROM Movimiento;

BEGIN TRANSACTION PRUEBA5
INSERT INTO Clientes_Banca VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO Clientes_Banca VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO Clientes_Banca VALUES('001','Oscar Perez Alvarado',8000);

IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END

--Prueba de que se agregaron
SELECT * FROM Materiales;
--Prueba de que se agregaron
SELECT * FROM Clientes_Banca;

GO

CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
  @NoCuenta varchar(5),
  @Monto numeric(10,2)
as
  BEGIN TRANSACTION PRUEBA4
  INSERT INTO Movimiento VALUES(@NoCuenta,'A',GETDATE(),@Monto);
  UPDATE Clientes_Banca SET Saldo = Saldo -@Monto
  WHERE NoCuenta=@NoCuenta
  IF @@ERROR = 0
  COMMIT TRANSACTION PRUEBA4
  ELSE
  BEGIN
  PRINT 'A transaction needs to be rolled back'
  ROLLBACK TRANSACTION PRUEBA4
END

GO
SELECT * FROM Clientes_Banca
EXECUTE REGISTRAR_RETIRO_CAJERO '001',200

SELECT * FROM Movimiento

GO

CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
@NoCuenta varchar(5),
@Monto		numeric(10,2)
AS
BEGIN TRANSACTION Retiro
INSERT INTO Movimiento VALUES(@NoCuenta,'B',GETDATE(),@Monto)
UPDATE Clientes_Banca SET Saldo=Saldo+@Monto
WHERE NoCuenta = @NoCuenta
IF @@ERROR = 0
COMMIT TRANSACTION Retiro
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION Retiro
END
GO

SELECT * FROM Movimiento
SELECT * FROM Clientes_Banca

EXECUTE REGISTRAR_DEPOSITO_VENTANILLA '001',500

SELECT * FROM Movimiento
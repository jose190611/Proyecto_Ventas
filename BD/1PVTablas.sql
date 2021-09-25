-----CREACION DE BASE DE DATOS PuntoVenta-----
DECLARE @msg VARCHAR(MAX);
---SI LA BD NO EXISTE LA CREAMOS---
IF NOT EXISTS(SELECT * FROM SYS.DATABASES WHERE name='PuntoVenta')
BEGIN
	CREATE DATABASE PuntoVenta;
	SET @msg = 'Base de datos PuntoVenta a sido creada';
	PRINT @msg;
END
ELSE
BEGIN
	---SI YA EXISTE LA BD MANDAMOS LA FECHA DE CREACION---
	SET @msg = 'La base de datos PuntoVenta ya existe'; 
	SET @msg= 'creada en '+CONVERT(VARCHAR(22),(SELECT create_date FROM sys.databases WHERE name='PuntoVenta'),22);
	PRINT @msg;
END
GO

USE PuntoVenta;
-----FIN CREACION DE BASE DE DATOS PuntoVenta-----



-----PROCESO PARA INSERTAR MENSAJES-----
---ESTE PROCESO ALMACENARA TODO MOVIMIENTO DE LA BD HACIA LA TABLA REPORTE---
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Msg')
PRINT 'Creando proceso SP_Msg';
ELSE
BEGIN
DROP PROCEDURE SP_Msg;
END
GO

GO
CREATE PROCEDURE SP_Msg @msg VARCHAR(MAX) AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	DECLARE @Fecha DATETIME;
	---ASIGNAMOS LA FECHA ACTUAL---
	SET @Fecha = (SELECT SYSDATETIME());
	SET @msg=@msg +' en fecha: ';
	---INSERTAMOS AL REPORTE---
	INSERT INTO Reporte VALUES (@msg,@Fecha);
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_MSG';
END CATCH
END
GO
---EXEC SP_Msg 'Hola';
-----FIN PROCESO PARA INSERTAR MENSAJES-----


-----CREAMOS TABLA REPORTE----
---LA TABLA ALMACENARA TODO MOVIMIENTO DE LA BD
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Reporte')
	BEGIN
	CREATE TABLE Reporte (
	Id_Reporte BIGINT IDENTITY (1,1) NOT NULL,
	Mensaje VARCHAR(MAX) NOT NULL,
	Fecha DATETIME NOT NULL
	);
	PRINT 'Se creo la tabla Reporte.';
	EXEC SP_Msg 'Se creo la tabla Reporte';
	END
ELSE
	BEGIN
	PRINT 'La tabla Reporte ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Reporte ya existente';
	END
GO
---SELECT   Mensaje+CONVERT(VARCHAR(20),SYSDATETIME(),22) FROM Reporte
-----FIN CREACION TABLA REPORTE-----



-----------CREACION DE TABLAS PADRES-----------


-----CREAMOS LA TABLA TIENDAS-----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Tiendas')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Tiendas (
	ClaTien VARCHAR(20) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Direccion VARCHAR(100) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Img IMAGE NOT NULL
	);
	PRINT 'Se creo la tabla Tiendas.';
	EXEC SP_Msg 'Se creo la tabla Tiendas';
END
ELSE
BEGIN
	PRINT 'La tabla Tiendas ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Tiendas ya existene';
END
GO
-----FIN DE LA TABLA TIENDA-----



-----CREAMOS LA TABLA PROVEEDORES-----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Proveedores')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Proveedores (
	ClaProv VARCHAR(20) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Correo VARCHAR(100),
	Direccion VARCHAR(100)
	);
	PRINT 'Se creo la tabla Proveedores.';
	EXEC SP_Msg 'Se creo la tabla Proveedores';
END
ELSE
BEGIN
	PRINT 'La tabla Proveedores ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Proveedores ya existene';
END
GO
-----------FIN TABLA PROVEEDORES-------------



-----CREAMOS LA TABLA UBICACIONES-----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Ubicaciones')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Ubicaciones (
	ClaUbic VARCHAR(20) NOT NULL,
	Lugar VARCHAR(50) NOT NULL
	);
	PRINT 'Se creo la tabla Ubicaciones.';
	EXEC SP_Msg 'Se creo la tabla Ubicaciones';
END
ELSE
BEGIN
	PRINT 'La tabla Ubicaciones ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Ubicaciones ya existene';
END
GO
-----------FIN TABLA UBICACIONES-------------


-----CREAMOS LA TABLA PRODUCTOS-----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Productos')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Productos (
	ClaProd VARCHAR(20) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	);
	PRINT 'Se creo la tabla Productos.';
	EXEC SP_Msg 'Se creo la tabla Productos';
END
ELSE
BEGIN
	PRINT 'La tabla Productos ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Productos ya existene';
END
GO
-----------FIN TABLA PRODUCTOS-------------



-----CREAMOS LA TABLA CLIENTES-----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Clientes')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Clientes (
	ClaClie VARCHAR(20) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Direccion VARCHAR(100),
	Correo VARCHAR(100)
	);
	PRINT 'Se creo la tabla Clientes.';
	EXEC SP_Msg 'Se creo la tabla Clientes';
END
ELSE
BEGIN
	PRINT 'La tabla Clientes ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Clientes ya existene';
END
GO
-----------FIN TABLA CLIENTES-------------



-----------FIN CREACION DE TABLAS PADRES-----------



-----------CREACION DE TABLAS HIJOS-----------



-----CREAMOS LA TABLA EMPLEADOS-----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Empleados')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Empleados (
	ClaEmpl VARCHAR(20) NOT NULL,
	ClaTien VARCHAR(20) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	Puesto VARCHAR(50)
	);
	PRINT 'Se creo la tabla Empleados.';
	EXEC SP_Msg 'Se creo la tabla Empleados';
END
ELSE
BEGIN
	PRINT 'La tabla Empleados ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Empleados ya existene';
END
GO
-----------FIN TABLA EMPLEADOS-------------




-----CREAMOS LA TABLA CUENTAS-----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Cuentas')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Cuentas (
	---VARBINARY PARA LA ENCRYPTACION DE LAS CUENTAS---
	ClaUsua BIGINT IDENTITY (1,1) NOT NULL, --- NO SE PUEDE CREAR USUARIO COMO LLAVE UNICA---
	----Column 'Usuario' in table 'Cuentas' is of a type that is invalid for use as a key column in an index.---
	Usuario VARBINARY(MAX) NOT NULL, ---LLAVE PRIMARAIA PARA LA EXISTENCIA DE UNA SOLA CUENTA
	Clave VARBINARY(MAX) NOT NULL,
	ClaEmpl VARCHAR(20) NOT NULL,
	Tipo VARCHAR(50) NOT NULL,
	Activo BIT NOT NULL,
	Acceso BIT NOT NULL
	);
	PRINT 'Se creo la tabla Cuentas.';
	EXEC SP_Msg 'Se creo la tabla Cuentas';
END
ELSE
BEGIN
	PRINT 'La tabla Cuentas ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Cuentas ya existene';
END
GO
-----------FIN TABLA CUENTAS-------------



-----CREAMOS LA TABLA VENTAS-----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Ventas')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Ventas (
	---VARBINARY PARA LA ENCRYPTACION DE LAS CUENTAS---
	ClaVent BIGINT IDENTITY (1,1) NOT NULL, ---LLAVE PRIMARAIA PARA LA EXISTENCIA DE UNA SOLA CUENTA
	ClaEmpl VARCHAR(20) NOT NULL, ---Empleado que vende---
	ClaClie VARCHAR(20) NOT NULL, ---A que cliente---
	Fecha DATETIME NOT NULL,
	Total MONEY NOT NULL
	);
	PRINT 'Se creo la tabla Ventas.';
	EXEC SP_Msg 'Se creo la tabla Ventas';
END
ELSE
BEGIN
	PRINT 'La tabla Ventas ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Ventas ya existene';
END
GO
-----------FIN TABLA VENTAS-------------



-----------FIN CREACION DE TABLAS HIJOS-----------



-----------Tablas para la normalizacion-------------



-----tabla Ticket------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Tickets')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE Tickets (
	---VARBINARY PARA LA ENCRYPTACION DE LAS CUENTAS---
	ClaProd VARCHAR(20) NOT NULL,
	ClaVent BIGINT NOT NULL,
	Cantidad INT NOT NULL,
	Precio MONEY NOT NULL,
	Importe MONEY NOT  NULL
	);
	PRINT 'Se creo la tabla Tickets.';
	EXEC SP_Msg 'Se creo la tabla Tickets';
END
ELSE
BEGIN
	PRINT 'La tabla Ticket ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla Ticket ya existene';
END
GO
-----FIN tabla Ticket------


-----tabla ProPro------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ProPro')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE ProPro (
	---VARBINARY PARA LA ENCRYPTACION DE LAS CUENTAS---
	ClaProd VARCHAR(20) NOT NULL,
	ClaProv VARCHAR(20) NOT NULL,
	ClaTien VARCHAR(20) NOT NULL,
	Marca VARCHAR(50) ---Para saber la marca del producto---
	);
	PRINT 'Se creo la tabla ProPro.';
	EXEC SP_Msg 'Se creo la tabla ProPro';
END
ELSE
BEGIN
	PRINT 'La tabla ProPro ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla ProPro ya existene';
END
GO
-----FIN tabla ProPro------



-----tabla ProTie------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ProTie')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE ProTie (
	---VARBINARY PARA LA ENCRYPTACION DE LAS CUENTAS---
	ClaProd VARCHAR(20) NOT NULL,
	ClaTien VARCHAR(20) NOT NULL,
	Costo MONEY NOT NULL, ---PRECIO AL QUE COMPRA EL PRODUCTO  SIN IVA---
	PreSug MONEY NOT NULL, ---PRECIO SUGERIDO DEL SISTEMA INCLUYE IVA + GANANCIA---
	Precio MONEY NOT NULL  ---PRECIO FINAL QUE ESTABLECE LA TIENDA----
	);
	PRINT 'Se creo la tabla ProTie.';
	EXEC SP_Msg 'Se creo la tabla ProTie';
END
ELSE
BEGIN
	PRINT 'La tabla ProTie ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla ProTie ya existene';
END
GO
-----FIN tabla ProTie------


-----tabla ProUbi------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ProUbi')
BEGIN
	---MINIMOS OCUPAREMOS UN NOMBRE PARA LA IDENTIFICACION---
	CREATE TABLE ProUbi (
	---VARBINARY PARA LA ENCRYPTACION DE LAS CUENTAS---
	ClaProd VARCHAR(20) NOT NULL,
	ClaUbic VARCHAR(20) NOT NULL,
	ClaTien VARCHAR(20) NOT NULL,
	Existencia INT NOT NULL
	);
	PRINT 'Se creo la tabla ProUbi.';
	EXEC SP_Msg 'Se creo la tabla ProUbi';
END
ELSE
BEGIN
	PRINT 'La tabla ProUbi ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla ProUbi ya existene';
END
GO
-----FIN tabla ProUbi-----



---Tabla TiePro--- Tabla de tiendas con proveedores
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='TiePro')
BEGIN
	CREATE TABLE TiePro (
		ClaTien VARCHAR(20) NOT NULL,
		ClaProv VARCHAR(20) NOT NULL
	);
	PRINT 'SE CREO LA TABLA TiePro.';
	EXEC SP_Msg 'SE creola tabla TiePro';
END
ELSE
BEGIN
	PRINT 'La tabla TiePro ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla TiePro ya existente';
END
GO
---FIN Tabla TiePro--- Tabla de tiendas con proveedores



---Tabla TiePro--- Tabla de tiendas con proveedores
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='TieUbi')
BEGIN
	CREATE TABLE TieUbi (
		ClaTien VARCHAR(20) NOT NULL,
		ClaUbic VARCHAR(20) NOT NULL
	);
	PRINT 'SE CREO LA TABLA TieUbi.';
	EXEC SP_Msg 'SE creola tabla TieUbi';
END
ELSE
BEGIN
	PRINT 'La tabla TieUbi ya existe.';
	EXEC SP_Msg 'Se intento crear la tabla TieUbi ya existente';
END
GO
---FIN Tabla TiePro--- Tabla de tiendas con proveedores


-----------FIN Tablas para la normalizacion-------------
-----PROCESO PARA INSERTAT Clientes-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Insertar_Clientes')
PRINT 'Creando proceso SP_Insertar_Clientes';
ELSE
BEGIN
DROP PROCEDURE SP_Insertar_Clientes;
END
GO

GO
CREATE PROCEDURE SP_Insertar_Clientes 
@Usuario VARCHAR(MAX),---Clave de usuario que realiza el movimiento---
@Nombre VARCHAR(MAX), ---Nombre del cliente---
@Telefono VARCHAR(MAX), ---Numero de telefono del cleinte---
@Direccion VARCHAR(MAX), ---Direccion del cliente---
@Correo VARCHAR(MAX), ---Correo del cliente---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);

DECLARE @ClaClie VARCHAR(MAX);
SET @ClaClie =  SUBSTRING(@Nombre,1,4)+SUBSTRING(@Telefono,7,4);---se genera clave unica para la unbicacion---

	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	---Si el usuario existe permitimos---
	IF( @Validacion = '1' )
		----Si la clave no exite en la BD quiere decir que podremos insertar----
		IF((SELECT COUNT(*) FROM Clientes WHERE ClaClie = @ClaClie)=0)
		BEGIN
			INSERT INTO Clientes VALUES (@ClaClie, @Nombre, @Telefono, @Direccion, @Correo);---Insertamos el registro---
			SET @Salida = 'Se ha guardado el cliente '+@Nombre;
			SET @Txt = 'El usuario '+@Usuario+' inserto al cliente '+@Nombre+' con clave '+@ClaClie;
			EXEC SP_Msg @Txt;---Mandamos a nuestro reporte---
		END
		ELSE
		BEGIN---Si la clve si esxie mandamos error de existencia---
			SET @Salida = 'La clave del cliente '+@ClaClie+' ya existe';
			SET @Txt = 'El usuario '+@Usuario+' intento insertar al cliente '+@Nombre+' con clave '+@ClaClie+' ya existente';
			EXEC SP_Msg @Txt;--informamos al reporte----
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento insertar al cliente '+@Nombre+' con clave '+@ClaClie+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Insertar_Clientes';
	SET @Salida  = 'Error al conectar al servidor';
END CATCH
END
GO
-----FIN PROCESO PARA INSERTAR CLIENTES-----



-----PROCESO PARA ELIMINAR CLIENTES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Eliminar_Clientes')
PRINT 'Creando proceso SP_Eliminar_Clientes';
ELSE
BEGIN
DROP PROCEDURE SP_Eliminar_Clientes;
END
GO

GO
CREATE PROCEDURE SP_Eliminar_Clientes 
@Usuario VARCHAR(MAX), ---Clave del usuario que realiza el movimientoo---
@ClaClie VARCHAR(MAX), ---Clave del cliente---
@Nombre VARCHAR(MAX),  ---Nombre del cliente---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	---Si el usuario existe permitimos---
	IF( @Validacion = '1' )
		---Si la clave exise podremos eliminar----
		IF((SELECT COUNT(*) FROM Clientes WHERE ClaClie = @ClaClie)=1)
		BEGIN
			DELETE Clientes WHERE ClaClie = @ClaClie; ---Eliminamos la tienda ---
			SET @Salida = 'Se ha eliminado al cliente '+@Nombre+'.';
			SET @Txt = 'El usuario '+@Usuario+' elimino al cliente '+@Nombre+' con clave '+@ClaClie;
			EXEC SP_Msg @Txt;---informaos al reporte---
		END
		ELSE
		BEGIN---si la clave ya no existe manamos error de existencia---
			SET @Salida = 'Error, el cliente con clave '+@ClaClie+' y ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento eliminar al cliente '+@Nombre+' con clave '+@ClaClie+' no existente';
			EXEC SP_Msg @Txt;---informamos al reporte---
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento eliminar al cliente '+@Nombre+' con clave '+@ClaClie+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Eliminar_Clientes';
	SET @Salida  = 'Error al conectar al servidor';
END CATCH
END
GO
-----FIN PROCESO PARA ELIMINAR CLIENTES-----


-----PROCESO PARA EDITAR CLIENTES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Editar_Clientes')
PRINT 'Creando proceso SP_Editar_Clientes';
ELSE
BEGIN
DROP PROCEDURE SP_Editar_Clientes;
END
GO


GO
CREATE PROCEDURE SP_Editar_Clientes 
@Usuario VARCHAR(MAX),---Clave de usuario que ace el movimiento---
@NewClave VARCHAR(MAX),---Nueva clave si se edita al cliente---
@ClaClie VARCHAR(MAX), ---Clave actual del cliente---
@Nombre VARCHAR(MAX), ---Nombre si se edita el cliente---
@Telefono VARCHAR(MAX), ---Telefono si se edia el cliente---
@Direccion VARCHAR(MAX), ---Direccion editada el cliente---
@Correo VARCHAR(MAX), ---Corrreo editado el cliente---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	---Si el usuario existe permitimos---
	IF( @Validacion = '1' )
		---Si la clave existe editamos---
		IF((SELECT COUNT(*) FROM Clientes WHERE ClaClie = @ClaClie)=1)
		BEGIN
			---Si la nueva clave a insertar no existe la insertamos ---
			IF((SELECT COUNT(*) FROM Clientes WHERE ClaClie = @NewClave)=0 OR (@ClaClie = @NewClave))
			BEGIN
				UPDATE Clientes SET ClaClie = @NewClave, Nombre =  @Nombre, Telefono = @Telefono, Direccion = @Direccion, Correo = @Correo WHERE ClaClie = @ClaClie;
				SET @Salida = 'Registro editado correctamente.';
				SET @Txt = 'El usuario '+@Usuario+' edito al cliente '+@ClaClie+'.';
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
			---Si la nueva clave ya existe no la insertamos
			ELSE
			BEGIN
				SET @Salida = 'Error, la clave '+@NewClave+' ya existe';
				SET @Txt = 'El usuario '+@Usuario+' intento editar al cliente '+@ClaClie+' con clave'+@NewClave+'ya existente';
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
		END
		ELSE
		BEGIN---si la clave a ediar no existe
			SET @Salida = 'Error, el cliente con clave '+@ClaClie+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento editar el cliente '+@ClaClie+' con clave '+@NewClave+' no existente';
			EXEC SP_Msg @Txt; ---informe al reporte---
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento editar al cliente '+@ClaClie+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Editar_Clientes';
	SET @Salida  = 'Error al conectar al servidor.';
END CATCH
END
GO
	-----FIN PROCESO PARA EDITAR CLIENTES-----



	-----PROCESO PARA MOSTRAR PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Mostrar_Clientes')
PRINT 'Creando proceso SP_Mostrar_Clientes';
ELSE
BEGIN
DROP PROCEDURE SP_Mostrar_Clientes;
END
GO

GO
CREATE PROCEDURE SP_Mostrar_Clientes 
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	SELECT ClaClie as 'Clave', Nombre, Telefono, Direccion, Correo FROM Clientes;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Mostrar_Clientes';
END CATCH
END
GO
-----FIN PROCESO PARA MOSTRAR PROVEEDORES------



-----PROCESO PARA BUSCAR PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Buscar_Cliente')
PRINT 'Creando proceso SP_Buscar_Cliente';
ELSE
BEGIN
DROP PROCEDURE SP_Buscar_Cliente;
END
GO

GO
CREATE PROCEDURE SP_Buscar_Cliente
@Valor VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
	SELECT ClaClie AS 'Clave', Nombre, Telefono, Direccion, Correo FROM Clientes 
	WHERE ClaClie LIKE '%'+@Valor+'%' OR Nombre LIKE '%'+@Valor+'%' 
	OR Telefono LIKE '%'+@Valor+'%' OR Correo LIKE '%'+@Valor+'%'
	OR Direccion LIKE '%'+@Valor+'%';
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Buscar_Proveedor';
END CATCH
END
GO
-----FIN PROCESO PARA BUSCAR PROVEEDORES-----





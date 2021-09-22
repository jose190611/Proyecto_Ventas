-----PROCESO PARA INSERTAT PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Insertar_Proveedores')
PRINT 'Creando proceso SP_Insertar_Proveedores';
ELSE
BEGIN
DROP PROCEDURE SP_Insertar_Proveedores;
END
GO

GO
CREATE PROCEDURE SP_Insertar_Proveedores 
@Usuario VARCHAR(MAX),---Clave de usuario que realiza el movimiento---
@ClaTien VARCHAR(MAX), --- Clave de la tienda del proveedor---
@Nombre VARCHAR(MAX), ---Nombre de proveedor---
@Telefono VARCHAR(MAX), ---Numero de telefono---
@Correo VARCHAR(MAX), ---Correo del proveedor---
@Direccion VARCHAR(MAX), ---Direccion del proveedor---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);

	DECLARE @ClaProv VARCHAR(MAX);
	SET @ClaProv =  SUBSTRING(@Nombre,1,4)+SUBSTRING(@Telefono,7,4);

	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	---Si el usuario existe permitimos---
	IF( @Validacion = '1' )
		----Si la clave no exite en la BD quiere decir que podremos insertar----
		IF((SELECT COUNT(*) FROM Proveedores WHERE ClaProv = @ClaProv)=0)
		BEGIN
			IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien) = 1)
			BEGIN
				INSERT INTO Proveedores VALUES (@ClaProv, @ClaTien, @Nombre, @Telefono, @Correo, @Direccion);---Insertamos el registro---
				SET @Salida = 'Se ha guardado el proveedor '+@nombre+'.';
				SET @Txt = 'El usuario '+@Usuario+' inserto el proveedor '+@Nombre+' con clave '+@ClaProv;
				EXEC SP_Msg @Txt;---Mandamos a nuestro reporte---
			END
			ELSE
			BEGIN
				SET @Salida = 'Error, la clave de la tienda '+@ClaTien+' no existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento insertar el proveedor '+@Nombre+' pero la tienda '+@ClaTien+' ya no existente';
				EXEC SP_Msg @Txt;--informamos al reporte----
			END
		END
		ELSE
		BEGIN---Si la clve si esxie mandamos error de existencia---
			SET @Salida = 'Error, la clave de proveedore '+@ClaProv+' ya existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento insertar el proveedor '+@Nombre+' con clave '+@ClaProv+' ya existente';
			EXEC SP_Msg @Txt;--informamos al reporte----
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento insertar el proveedor '+@Nombre+' con clave '+@ClaProv+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Insertar_Proveedores';
	SET @Salida = 'Ha ocurrido un error al insertar una proveedor.';
END CATCH
END
GO
-----FIN PROCESO PARA INSERTAR PROVEEDORES-----



-----PROCESO PARA ELIMINAR PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Eliminar_Proveedores')
PRINT 'Creando proceso SP_Eliminar_Proveedores';
ELSE
BEGIN
DROP PROCEDURE SP_Eliminar_Proveedores;
END
GO

GO
CREATE PROCEDURE SP_Eliminar_Proveedores 
@Usuario VARCHAR(MAX), ---Clave del usuario que realiza el movimientoo---
@ClaProv VARCHAR(MAX), ---Clave del proveedor---
@Nombre VARCHAR(MAX),  ---Nombre del proveedor---
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
		IF((SELECT COUNT(*) FROM Proveedores WHERE ClaProv = @ClaProv)=1)
		BEGIN
			DELETE Proveedores WHERE ClaProv = @ClaProv; ---Eliminamos la tienda ---
			SET @Salida = 'Se ha eliminado el proveedor '+@Nombre+'.';
			SET @Txt = 'El usuario '+@Usuario+' elimino el proveedor '+@Nombre+' con clave '+@ClaProv;
			EXEC SP_Msg @Txt;---informaos al reporte---
		END
		ELSE
		BEGIN---si la clave ya no existe manamos error de existencia---
			SET @Salida = 'Error, el proveedor con clave '+@ClaProv+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento eliminar el proveedor '+@Nombre+' con clave '+@ClaProv+' no existente';
			EXEC SP_Msg @Txt;---informamos al reporte---
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento eliminar el proveedor '+@Nombre+' con clave '+@ClaProv+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Eliminar_Proveedores';
	SET @Salida = 'Ha ocurrido un error al eliminar una proveedor.';
END CATCH
END
GO
-----FIN PROCESO PARA ELIMINAR Proveedores-----



-----PROCESO PARA EDITAR PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Editar_Proveedores')
PRINT 'Creando proceso SP_Editar_Proveedores';
ELSE
BEGIN
DROP PROCEDURE SP_Editar_Proveedores;
END
GO


GO
CREATE PROCEDURE SP_Editar_Proveedores 
@Usuario VARCHAR(MAX),---Clave de usuario que ace el movimiento---
@NewClave VARCHAR(MAX),---Nueva clave si se edita el proveedor---
@ClavProv VARCHAR(MAX), ---Clave actual del porveedor
@Nombre VARCHAR(MAX), ---Nombre si se edita del proveedor---
@Telefono VARCHAR(MAX), ---Telefono si se edia del proveedor---
@Correo VARCHAR(MAX), ---Corrreo editado del proveedor---
@Direccion VARCHAR(MAX), ---Direccion editada del proeedor---
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
		IF((SELECT COUNT(*) FROM Proveedores WHERE ClaProv = @ClavProv)=1)
		BEGIN
			---Si la nueva clave a insertar no existe la insertamos ---
			IF((SELECT COUNT(*) FROM Proveedores WHERE ClaProv = @NewClave)=0 OR (@ClavProv = @NewClave))
			BEGIN
				UPDATE Proveedores SET ClaProv = @NewClave, Nombre =  @Nombre, Telefono = @Telefono, Correo = @Correo, Direccion = @Direccion WHERE ClaProv = @ClavProv;
				SET @Salida = 'Registro editado correctamente';
				SET @Txt = 'El usuario '+@Usuario+' edito el proveedor '+@ClavProv;
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
			---Si la nueva clave ya existe no la insertamos
			ELSE
			BEGIN
				SET @Salida = 'Error, la clave '+@NewClave+' ya existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento editar un proveedor con clave'+@NewClave+'ya existente';
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
		END
		ELSE
		BEGIN---si la clave a ediar no existe
			SET @Salida = 'Error, el proveedor con clave '+@ClavProv+' no existe';
			SET @Txt = 'El usuario '+@Usuario+' intento editar el proveedor '+@Nombre+' con clave '+@ClavProv+' no existente';
			EXEC SP_Msg @Txt; ---informe al reporte---
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento editar el proveedor '+@Nombre+' con clave '+@NewClave+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Editar_Proveedores';
	SET @Salida = 'Ha ocurrido un error al editar una proveedor.';
END CATCH
END
GO
	-----FIN PROCESO PARA EDITAR PROVEEDORES-----



	-----PROCESO PARA MOSTRAR PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Mostrar_Proveedores')
PRINT 'Creando proceso SP_Mostrar_Proveedores';
ELSE
BEGIN
DROP PROCEDURE SP_Mostrar_Proveedores;
END
GO

GO
CREATE PROCEDURE SP_Mostrar_Proveedores 
@ClaProv VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	SELECT ClaProv as 'Clave', Nombre, Telefono, Correo, Direccion FROM Proveedores
	WHERE ClaTien = @ClaProv ORDER BY Nombre;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Buscar_Proveedores';
END CATCH
END
GO
-----FIN PROCESO PARA MOSTRAR PROVEEDORES------



-----PROCESO PARA BUSCAR PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Buscar_Proveedor')
PRINT 'Creando proceso SP_Buscar_Proveedor';
ELSE
BEGIN
DROP PROCEDURE SP_Buscar_Proveedor;
END
GO

GO
CREATE PROCEDURE SP_Buscar_Proveedor 
@Valor VARCHAR(MAX),
@ClaProv VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	SELECT ClaProv AS 'Clave', Nombre, Telefono, Correo, Direccion FROM Proveedores 
	WHERE ClaProv LIKE '%'+@Valor+'%' OR Nombre LIKE '%'+@Valor+'%' 
	OR Telefono LIKE '%'+@Valor+'%' OR Correo LIKE '%'+@Valor+'%'
	AND ClaTien = @ClaProv ORDER BY Nombre;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Buscar_Proveedor';
END CATCH
END
GO
-----FIN PROCESO PARA BUSCAR PROVEEDORES-----


INSERT INTO Proveedores VALUES ('Prov1', 'Empresa 1', '1234567890', 'Empresa1@gmail.com', 'Calle Empresa No 1');
INSERT INTO Proveedores VALUES ('Prov2', 'Empresa 2', '1234567890', 'Empresa2@gmail.com', 'Calle Empresa No 2');
INSERT INTO Proveedores VALUES ('Prov3', 'Empresa 3', '1234567890', 'Empresa3@gmail.com', 'Calle Empresa No 3');
INSERT INTO Proveedores VALUES ('Prov4', 'Empresa 4', '1234567890', 'Empresa4@gmail.com', 'Calle Empresa No 4');
INSERT INTO Proveedores VALUES ('Prov5', 'Empresa 5', '1234567890', 'Empresa5@gmail.com', 'Calle Empresa No 5');
INSERT INTO Proveedores VALUES ('Prov6', 'Empresa 6', '1234567890', 'Empresa6@gmail.com', 'Calle Empresa No 6');
INSERT INTO Proveedores VALUES ('Prov7', 'Empresa 7', '1234567890', 'Empresa7@gmail.com', 'Calle Empresa No 7');
INSERT INTO Proveedores VALUES ('Prov8', 'Empresa 8', '1234567890', 'Empresa8@gmail.com', 'Calle Empresa No 8');
INSERT INTO Proveedores VALUES ('Prov9', 'Empresa 9', '1234567890', 'Empresa9@gmail.com', 'Calle Empresa No 9');
INSERT INTO Proveedores VALUES ('Prov10', 'Empresa 10', '1234567890', 'Empresa10@gmail.com', 'Calle Empresa No 10');
INSERT INTO Proveedores VALUES ('Prov11', 'Empresa 11', '1234567890', 'Empresa11@gmail.com', 'Calle Empresa No 11');
INSERT INTO Proveedores VALUES ('Prov12', 'Empresa 12', '1234567890', 'Empresa12@gmail.com', 'Calle Empresa No 12');
INSERT INTO Proveedores VALUES ('Prov13', 'Empresa 13', '1234567890', 'Empresa13@gmail.com', 'Calle Empresa No 13');
INSERT INTO Proveedores VALUES ('Prov14', 'Empresa 14', '1234567890', 'Empresa14@gmail.com', 'Calle Empresa No 14');
INSERT INTO Proveedores VALUES ('Prov15', 'Empresa 15', '1234567890', 'Empresa15@gmail.com', 'Calle Empresa No 15');
INSERT INTO Proveedores VALUES ('Prov16', 'Empresa 16', '1234567890', 'Empresa16@gmail.com', 'Calle Empresa No 16');
INSERT INTO Proveedores VALUES ('Prov17', 'Empresa 17', '1234567890', 'Empresa17@gmail.com', 'Calle Empresa No 17');
INSERT INTO Proveedores VALUES ('Prov18', 'Empresa 18', '1234567890', 'Empresa18@gmail.com', 'Calle Empresa No 18');
INSERT INTO Proveedores VALUES ('Prov19', 'Empresa 19', '1234567890', 'Empresa19@gmail.com', 'Calle Empresa No 19');
INSERT INTO Proveedores VALUES ('Prov20', 'Empresa 20', '1234567890', 'Empresa20@gmail.com', 'Calle Empresa No 20');
INSERT INTO Proveedores VALUES ('Prov21', 'Empresa 21', '1234567890', 'Empresa21@gmail.com', 'Calle Empresa No 21');
INSERT INTO Proveedores VALUES ('Prov22', 'Empresa 22', '1234567890', 'Empresa22@gmail.com', 'Calle Empresa No 22');
INSERT INTO Proveedores VALUES ('Prov23', 'Empresa 23', '1234567890', 'Empresa23@gmail.com', 'Calle Empresa No 23');
INSERT INTO Proveedores VALUES ('Prov24', 'Empresa 24', '1234567890', 'Empresa24@gmail.com', 'Calle Empresa No 24');
INSERT INTO Proveedores VALUES ('Prov25', 'Empresa 25', '1234567890', 'Empresa25@gmail.com', 'Calle Empresa No 25');
INSERT INTO Proveedores VALUES ('Prov26', 'Empresa 26', '1234567890', 'Empresa26@gmail.com', 'Calle Empresa No 26');
INSERT INTO Proveedores VALUES ('Prov27', 'Empresa 27', '1234567890', 'Empresa27@gmail.com', 'Calle Empresa No 27');
INSERT INTO Proveedores VALUES ('Prov28', 'Empresa 28', '1234567890', 'Empresa28@gmail.com', 'Calle Empresa No 28');
INSERT INTO Proveedores VALUES ('Prov29', 'Empresa 29', '1234567890', 'Empresa29@gmail.com', 'Calle Empresa No 29');
INSERT INTO Proveedores VALUES ('Prov30', 'Empresa 30', '1234567890', 'Empresa30@gmail.com', 'Calle Empresa No 30');
-----PROCESO PARA INSERTAT UBICACIONES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Insertar_Ubicaciones')
PRINT 'Creando proceso SP_Insertar_Ubicaciones';
ELSE
BEGIN
DROP PROCEDURE SP_Insertar_Ubicaciones;
END
GO

GO
CREATE PROCEDURE SP_Insertar_Ubicaciones 
@Usuario VARCHAR(MAX),---Clave de usuario que realiza el movimiento---
@ClaTien VARCHAR(MAX),
@Lugar VARCHAR(MAX), ---Nombre de lugar---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
DECLARE @ClaUbic VARCHAR(MAX);
DECLARE @Num VARCHAR(MAX);
SET @Num = ROUND(((99 - 1) * RAND() + 1), 0);
SET @ClaUbic =  SUBSTRING(@Lugar,1,4)+@Num;---se genera clave unica para la unbicacion---

	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	---Si el usuario existe permitimos---
	IF( @Validacion = '1' )
		----Si la clave no exite en la BD quiere decir que podremos insertar----
		IF((SELECT COUNT(*) FROM Ubicaciones WHERE ClaUbic = @ClaUbic)=0)
		BEGIN
			---Si la tienda exite insetamos---
			IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien)=1)
			BEGIN
				INSERT INTO Ubicaciones VALUES (@ClaUbic, @ClaTien, @Lugar);---Insertamos el registro---
				SET @Salida = 'Se ha guardado la ubicacion '+@Lugar+'.';
				SET @Txt = 'El usuario '+@Usuario+' inserto el lugar '+@Lugar+' con clave '+@ClaUbic;
				EXEC SP_Msg @Txt;---Mandamos a nuestro reporte---
			END
			ELSE
			BEGIN
				SET @Salida = 'Error, la clave de la tienda '+@ClaTien+' no existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento insertar la ubicacion '+@Lugar+' pero la tienda'+@ClaTien+' ya no existente';
				EXEC SP_Msg @Txt;--informamos al reporte----
			END
		END
		ELSE
		BEGIN---Si la clvae si esxie mandamos error de existencia---
			SET @Salida = 'Error, la clave de lugar '+@ClaUbic+' ya existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento insertar la ubicacion '+@Lugar+' con clave '+@ClaUbic+' ya existente';
			EXEC SP_Msg @Txt;--informamos al reporte----
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento insertar el lugar '+@Lugar+' con clave '+@ClaUbic+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Insertar_Ubicaciones';
	SET @Salida = 'Ha ocurrido un error al insertar una ubicación.';
END CATCH
END
GO
-----FIN PROCESO PARA INSERTAR Ubicaciones-----



-----PROCESO PARA ELIMINAR UBICACIONES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Eliminar_Ubicaciones')
PRINT 'Creando proceso SP_Eliminar_Ubicaciones';
ELSE
BEGIN
DROP PROCEDURE SP_Eliminar_Ubicaciones;
END
GO

GO
CREATE PROCEDURE SP_Eliminar_Ubicaciones 
@Usuario VARCHAR(MAX), ---Clave del usuario que realiza el movimientoo---
@ClaUbic VARCHAR(MAX), ---Clave de la ubicacion---
@Lugar VARCHAR(MAX),  ---Nombre de la ubicacion---
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
		IF((SELECT COUNT(*) FROM Ubicaciones WHERE ClaUbic = @ClaUbic)=1)
		BEGIN
			DELETE Ubicaciones WHERE ClaUbic = @ClaUbic; ---Eliminamos la tienda ---
			SET @Salida = 'Se ha eliminado el lugar '+@Lugar+'.';
			SET @Txt = 'El usuario '+@Usuario+' elimino el lugar '+@Lugar+' con clave '+@ClaUbic;
			EXEC SP_Msg @Txt;---informaos al reporte---
		END
		ELSE
		BEGIN---si la clave ya no existe manamos error de existencia---
			SET @Salida = 'Error, el lugar con clave '+@ClaUbic+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento eliminar el lugar '+@Lugar+' con clave '+@ClaUbic+' no existente';
			EXEC SP_Msg @Txt;---informamos al reporte---
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento eliminar el lugar '+@Lugar+' con clave '+@ClaUbic+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Eliminar_Ubicaciones';
	SET @Salida = 'Ha ocurrido un error al eliminar una ubicación.';
END CATCH
END
GO
-----FIN PROCESO PARA ELIMINAR UBICACIONES-----



-----PROCESO PARA EDITAR UBICACIONES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Editar_Ubicaciones')
PRINT 'Creando proceso SP_Editar_Ubicaciones';
ELSE
BEGIN
DROP PROCEDURE SP_Editar_Ubicaciones;
END
GO

GO
CREATE PROCEDURE SP_Editar_Ubicaciones 
@Usuario VARCHAR(MAX),---Clave de usuario que ace el movimiento---
@NewClave VARCHAR(MAX),---Nueva clave si se edita la ubicacion---
@ClaUbic VARCHAR(MAX), ---Clave actual de la ubicacion---
@Lugar VARCHAR(MAX), ---Nombre si se edita lugar de ubbicacion---
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
		IF((SELECT COUNT(*) FROM Ubicaciones WHERE ClaUbic = @ClaUbic)=1)
		BEGIN
			---Si la nueva clave a insertar no existe la insertamos ---
			IF((SELECT COUNT(*) FROM Ubicaciones WHERE ClaUbic = @NewClave)=0 OR (@ClaUbic = @NewClave))
			BEGIN
				UPDATE Ubicaciones SET ClaUbic = @NewClave, Lugar=@Lugar WHERE ClaUbic = @ClaUbic;
				SET @Salida = 'Registro editado correctamente.';
				SET @Txt = 'El usuario '+@Usuario+' edito el lugar '+@ClaUbic;
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
			---Si la nueva clave ya existe no la insertamos
			ELSE
			BEGIN
				SET @Salida = 'Error, la clave '+@NewClave+' ya existe, intenta otra.';
				SET @Txt = 'El usuario '+@Usuario+' intento editar el lugar '+@ClaUbic+' con clave '+@NewClave+' ya existente';
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
		END
		ELSE
		BEGIN---si la clave a ediar no existe
			SET @Salida = 'Error, el lugar con clave '+@ClaUbic+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento editar el lugar '+@ClaUbic+' con clave '+@NewClave+' no existente';
			EXEC SP_Msg @Txt; ---informe al reporte---
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento editar el lugar '+@ClaUbic+' con clave '+@NewClave+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Editar_Ubicaciones';
	SET @Salida = 'Ha ocurrido un error al editar una ubicación.';
END CATCH
END
GO
	-----FIN PROCESO PARA EDITAR UBICACIONES-----



	-----PROCESO PARA MOSTRAR UBICACIONES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Mostrar_Ubicaciones')
PRINT 'Creando proceso SP_Mostrar_Ubicaciones' ;
ELSE
BEGIN
DROP PROCEDURE SP_Mostrar_Ubicaciones;
END
GO

GO
CREATE PROCEDURE SP_Mostrar_Ubicaciones 
@ClaTien VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	SELECT ClaUbic as 'Clave', Lugar FROM Ubicaciones
		WHERE ClaTien = @ClaTien;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Mostrar_Ubicaciones';
END CATCH
END
GO
-----FIN PROCESO PARA MOSTRAR UBICACIONES------



-----PROCESO PARA BUSCAR PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Buscar_Ubicacion')
PRINT 'Creando proceso SP_Buscar_Ubicacion';
ELSE
BEGIN
DROP PROCEDURE SP_Buscar_Ubicacion;
END
GO

GO
CREATE PROCEDURE SP_Buscar_Ubicacion 
@Valor VARCHAR(MAX),
@ClaTien VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	SELECT ClaUbic AS 'Clave', Lugar FROM Ubicaciones 
		WHERE ClaUbic LIKE '%'+@Valor+'%' OR Lugar LIKE '%'+@Valor+'%'
		AND ClaTien = @ClaTien;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Buscar_Ubicacion';
END CATCH
END
GO
-----FIN PROCESO PARA BUSCAR UBICACIONES-----
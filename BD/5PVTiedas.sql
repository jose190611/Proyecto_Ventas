-----PROCESO PARA INSERTAT TIENDAS-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Insertar_Tiedas')
PRINT 'Creando proceso';
ELSE
BEGIN
DROP PROCEDURE SP_Insertar_Tiedas;
END
GO

GO
CREATE PROCEDURE SP_Insertar_Tiedas 
@Usuario VARCHAR(MAX),
@Nombre VARCHAR(Max),
@Direccion VARCHAR(MAX),
@Telefono VARCHAR(MAX),
@Img IMAGE,
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
DECLARE @ClaTien VARCHAR(MAX);
SET @ClaTien =  SUBSTRING(@Nombre,1,4)+SUBSTRING(@Telefono,7,4);

	---Si el usuario existe permitimos---
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )
		----Si la clave no exite en la BD quiere decir que podremos insertar----
		IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien)=0)
		BEGIN
			INSERT INTO Tiendas VALUES (@ClaTien, @Nombre, @Direccion, @Telefono, @Img);---Insertamos el registro---
			SET @Salida = 'Se ha guardado la tienda '+@nombre+'.';
			SET @Txt = 'El usuario '+@Usuario+' inserto la tienda '+@Nombre+' con clave '+@ClaTien;
			EXEC SP_Msg @Txt;---Mandamos a nuestro reporte---
		END
		ELSE
		BEGIN---Si la clve si esxie mandamos error de existencia---
			SET @Salida = 'Error, la clave de tienda '+@ClaTien+' ya existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento insertar la tienda '+@Nombre+' con clave '+@ClaTien+' ya existente';
			EXEC SP_Msg @Txt;--informamos al reporte----
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento insertar la tienda '+@Nombre+' con clave '+@ClaTien+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Insertar_Tiedas';
	SET @Salida = 'Ha ocurrido un error al insertar una tienda.';
END CATCH
END
GO
-----FIN PROCESO PARA INSERTAR TIENDAS-----




-----PROCESO PARA ELIMINAR TIENDAS-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Eliminar_Tiedas')
PRINT 'Creando proceso';
ELSE
BEGIN
DROP PROCEDURE SP_Eliminar_Tiedas;
END
GO

GO
CREATE PROCEDURE SP_Eliminar_Tiedas 
@Usuario VARCHAR(MAX),
@ClaTien VARCHAR(MAX),
@Nombre VARCHAR(MAX),
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
	---Si el usuario existe en la BD permitimos---
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )
		---Si la clave exise podremos eliminar----
		IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien AND Nombre = @Nombre)=1)
		BEGIN
			DELETE Tiendas WHERE ClaTien = @ClaTien; ---Eliminamos la tienda ---
			SET @Salida = 'Se ha eliminado la tienda '+@Nombre+'.';
			SET @Txt = 'El usuario '+@Usuario+' elimino la tienda '+@Nombre+' con clave '+@ClaTien;
			EXEC SP_Msg @Txt;---informaos al reporte---
		END
		ELSE
		BEGIN---si la clave ya no existe manamos error de existencia---
			SET @Salida = 'Error, la tienda con clave '+@ClaTien+' no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento eliminar la tienda '+@Nombre+' con clave '+@ClaTien+' no existente';
			EXEC SP_Msg @Txt;---informamos al reporte---
		END
	ELSE
	BEGIN---si el usuaro ya no existe ---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento eliminar la tienda '+@Nombre+' con clave '+@ClaTien+'. '+@Validacion;
		EXEC SP_Msg @Txt;--informe al reporte----
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Eliminar_Tiedas';
	SET @Salida = 'Ha ocurrido un error al eliminar una tienda.';
END CATCH
END
GO
-----FIN PROCESO PARA ELIMINAR TIENDAS-----



-----PROCESO PARA EDITAR TIENDAS-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Editar_Tiedas')
PRINT 'Creando proceso';
ELSE
BEGIN
DROP PROCEDURE SP_Editar_Tiedas;
END
GO

GO
CREATE PROCEDURE SP_Editar_Tiedas 
@Usuario VARCHAR(MAX),
@NewClave VARCHAR(MAX),
@ClaTien VARCHAR(MAX),
@Nombre VARCHAR(MAX),
@Direccion VARCHAR(MAX),
@Telefono VARCHAR(MAX),
@Img IMAGE,
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
	---Si el usuario ya existe----
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )
		---Si la clave existe editamos---
		IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien)=1)
		BEGIN
			---Si la nueva clave no existe insertamos o si la clave sigue siendo la misma a la nueva clave----
			IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @NewClave)=0 OR @ClaTien = @NewClave)
			BEGIN
				----Edidtamos---
				UPDATE Tiendas SET ClaTien = @NewClave, Nombre =  @Nombre,
				Direccion = @Direccion, Telefono = @Telefono,
				Img = @Img WHERE ClaTien = @ClaTien;
				SET @Salida = 'Tienda editada correctamente.';
				SET @Txt = 'El usuario '+@Usuario+' edito la tienda '+@ClaTien+' por clave nuevo '+@NewClave;
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
			---si ya existe no insertamos---
			ELSE
			BEGIN
				SET @Salida = 'Error, la clave '+@NewClave+' ya existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento editar una tienda con clave'+@NewClave+'ya existente';
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
		END
		ELSE
		BEGIN---si la clave a ediar no existe
			SET @Salida = 'Error, la tienda con clave '+@ClaTien+' no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento editar la tienda '+@Nombre+' con clave '+@ClaTien+' no existente';
			EXEC SP_Msg @Txt; ---informe al reporte---
		END
	ELSE
	BEGIN---si el usuario no existe---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento editar la tienda '+@Nombre+' con clave '+@ClaTien+'. '+@Validacion;
		EXEC SP_Msg @Txt;--informamos al repore---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Editar_Tiedas';
	SET @Salida = 'Ha ocurrido un error al editar una tienda.';
END CATCH
END
GO
-----FIN PROCESO PARA EDITAR TIENDAS-----



	-----PROCESO PARA MOSTRAR TODAS TIENDAS-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Buscar_Tiendas')
PRINT 'Creando proceso SP_Buscar_Tiendas';
ELSE
BEGIN
DROP PROCEDURE SP_Buscar_Tiendas;
END
GO

GO
CREATE PROCEDURE SP_Buscar_Tiendas AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	SELECT ClaTien AS 'Clave', Nombre AS 'Tienda', Direccion, Telefono FROM Tiendas ORDER BY ClaTien;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Buscar_Tiendas';
	EXEC SP_Msg 'Ha ocurrido un error en SP_Buscar_Tiendas';
END CATCH
END
GO
-----FIN PROCESO PARA MOSTRAR TODAS LAS TIENDAS-----



-----PROCESO PARA BUSCAR TIENDA-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Buscar_Tienda')
PRINT 'Creando proceso';
ELSE
BEGIN
DROP PROCEDURE SP_Buscar_Tienda;
END
GO


GO
CREATE PROCEDURE SP_Buscar_Tienda
@Clave VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
		
		--- LIKE % PARA HACER BUSQUEDAS QUE SEAN SEMEJANES---
	SELECT ClaTien AS 'Clave', Nombre AS 'Tienda', Direccion, Telefono, Img FROM Tiendas 
		WHERE ClaTien LIKE '%'+@Clave+'%' OR Nombre LIKE '%'+@Clave+'%'
		OR Direccion LIKE '%'+@Clave+'%' OR Telefono LIKE '%'+@Clave+'%';

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Buscar_Tienda';
	EXEC SP_Msg 'Ha ocurrido un error en SP_Buscar_Tienda';
END CATCH
END
GO
-----FIN PROCESO PARA BUSCAR TIENDA-----





----------PROCESO DE CARGA DE TABLERO PARA CARGAR LA INFORMACION DEL USUARIO QUE INGRESA AL SISTEMA----------
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Tablero')
PRINT 'Creando proceso';
ELSE
BEGIN
DROP PROCEDURE SP_Tablero;
END
GO

GO
CREATE PROCEDURE SP_Tablero @Usuario VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
	SELECT  CONVERT(VARCHAR,DECRYPTBYKEY(Cuentas.Usuario)) AS 'Usuario',Tiendas.ClaTien,Cuentas.Tipo,Empleados.Nombre,Tiendas.Img FROM Cuentas
		INNER JOIN Empleados ON Cuentas.ClaEmpl = Empleados.ClaEmpl
		INNER JOIN Tiendas ON Tiendas.ClaTien = Empleados.ClaTien
		WHERE DECRYPTBYKEY(Usuario) = @Usuario;
	CLOSE SYMMETRIC KEY LlaveEcriptacion;
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Tablero';
	CLOSE SYMMETRIC KEY LlaveEcriptacion;
END CATCH
END
GO

---Fimn PROCESO DE CARGA DE TABLERO PARA CARGAR LA INFORMACION DEL USUARIO QUE INGRESA AL SISTEMA---


OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
	SELECT  CONVERT(VARCHAR,DECRYPTBYKEY(Cuentas.Usuario)) AS 'Usuario',Cuentas.Tipo,Empleados.Nombre,Tiendas.Img FROM Cuentas
	INNER JOIN Empleados ON Cuentas.ClaEmpl = Empleados.ClaEmpl
	INNER JOIN Tiendas ON Tiendas.ClaTien = Empleados.ClaTien
	WHERE DECRYPTBYKEY(Usuario) = 'ADMI'
CLOSE SYMMETRIC KEY LlaveEcriptacion;











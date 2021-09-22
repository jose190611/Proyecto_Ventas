-----PROCESO PARA INSERTAT EMPLEADOS-----
---El proceso para realizar un nuevo registro de empleado---
---se forzara a que cuando se cree un empleado este se cree una cuenta para el empleado---
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Insertar_Empleados')
PRINT 'Creando proceso SP_Insertar_Empleados';
ELSE
BEGIN
DROP PROCEDURE SP_Insertar_Empleados;
END
GO


GO
CREATE PROCEDURE SP_Insertar_Empleados	 
@Usuario VARCHAR(MAX), ---Para saber que usuario crea al nuevo empleado---
@ClaTien VARCHAR(MAX), ---Clave de la tienda a la que pertenesera el nuevo empleado---
@Nombre VARCHAR(MAX), ---Nombre de empleado---
@Telefono VARCHAR(MAX), ---Numero telefonico---
@Puesto VARCHAR(MAX), ---Puesto que tiene el empleado---
@Tipo VARCHAR(MAX), ---Tipo de usuario , ADMINISTRADOR, USUARIO---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);

	----La Clave del empleado sera generado de forma auomatica----
	---con el nombre de empleado y los ultimos 4 digitos de su numero telefonico---
	--verificamos existencia del empleado---
	DECLARE @ClaEmpl VARCHAR(MAX);
	SET @ClaEmpl = SUBSTRING(@Nombre,1,4)+SUBSTRING(@Telefono,7, 4);

	---Si el usuario existe permitimos---
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )
		IF((SELECT COUNT(*) FROM Empleados WHERE ClaEmpl = @ClaEmpl) = 0 )
		BEGIN
			IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien) = 1)
			BEGIN
				INSERT INTO Empleados VALUES (@ClaEmpl,@ClaTien, @Nombre, @Telefono, @Puesto);---Insertamos el registro---
				---creacion de la cuenta personal---
				---para la creacion de la cuenta el usuario y contraseña sera---
				--los 4 primero digitos del nombre de empleado segido de los ultimos 4 digitos del numero telefonico---
				---es decir la clave del empleado---
				OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
								---USR     PASS  CLV TIENDA  A U  AT AC	
				INSERT INTO Cuentas VALUES (ENCRYPTBYKEY(KEY_GUID('LlaveEcriptacion'),@ClaEmpl),ENCRYPTBYKEY(KEY_GUID('LlaveEcriptacion'),@ClaEmpl),@ClaEmpl,@Tipo,1,0);
				CLOSE SYMMETRIC KEY LlaveEcriptacion;

				SET @Salida = 'Se ha creado al usuario'+@nombre+'. Cuenta de usuario y contraseña: '+@ClaEmpl+'.';
				SET @Txt = 'El usuario '+@Usuario+' creo una nueva cuenta del usuario '+@Nombre;
				EXEC SP_Msg @Txt;---Mandamos a nuestro reporte---
			END
			ELSE
			BEGIN
				SET @Salida = 'Error, la clave de tienda '+@ClaTien+' no existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento crear un usuario '+@Nombre+' con clave '+@ClaEmpl+' pero la tienda'+@ClaTien+'ya no existente';
				EXEC SP_Msg @Txt;--informamos al reporte----
			END
		END
		ELSE
		BEGIN---Si la clave si esxie mandamos error de existencia---
			SET @Salida = 'Error, el usuario '+@nombre+' ya existe, intenta otro.';
			SET @Txt = 'El usuario '+@Usuario+' intento crear un usuario '+@Nombre+' con clave '+@ClaEmpl+' ya existente';
			EXEC SP_Msg @Txt;--informamos al reporte----
		END
	ELSE
	BEGIN---Si el usuario ya no existe mandamos error de usuario---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento crear al usuario '+@Nombre+' con clave '+@ClaEmpl+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Insertar_Empleado';
	SET @Salida = 'Ha ocurrido un error al insertar un empleado.';
	CLOSE SYMMETRIC KEY LlaveEcriptacion;
END CATCH
END
GO
-----FIN PROCESO PARA INSERTAR EMPLEADOS-CUENTAS-----




-----PROCESO PARA ELIMINAR EMPLEADOS-CUENTAS-----
---El proceso de eilimacion de empleado-cuentas--
---si al eliminar un empleado por efecto de relacion---
---la cuenta se eliminaraa---
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Eliminar_Empleados')
PRINT 'Creando proceso SP_Eliminar_Empleados';
ELSE
BEGIN
DROP PROCEDURE SP_Eliminar_Empleados;
END
GO

GO
CREATE PROCEDURE SP_Eliminar_Empleados 
@Usuario VARCHAR(MAX), --- usuario que esta eliminando--
@ClaEmpl VARCHAR(MAX), --- Clave de empleado a eliminar---
@Nombre VARCHAR(MAX), --- Nombre de empleado a eliminar---
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
		IF((SELECT COUNT(*) FROM Empleados WHERE ClaEmpl = @ClaEmpl AND Nombre =  @Nombre)=1)
		BEGIN
			DELETE Empleados WHERE ClaEmpl = @ClaEmpl; ---Eliminamos la tienda ---
			SET @Salida = 'Se ha eliminado el empleado '+@Nombre+'.';
			SET @Txt = 'El usuario '+@Usuario+' elimino al empleado '+@Nombre+' con clave '+@ClaEmpl;
			EXEC SP_Msg @Txt;---informaos al reporte---
		END
		ELSE
		BEGIN---si la clave ya no existe manamos error de existencia---
			SET @Salida = 'Error, el usuario '+@Nombre+' no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento eliminar al empleado '+@Nombre+' con clave '+@ClaEmpl+' no existente';
			EXEC SP_Msg @Txt;---informamos al reporte---
		END
	ELSE
	BEGIN---si el usuaro ya no existe ---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento eliminar al empleado '+@Nombre+' con clave '+@ClaEmpl+'. '+@Validacion;
		EXEC SP_Msg @Txt;--informe al reporte----
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Eliminar_Empleados';
	SET @Salida = 'Ha ocurrido un error al eliminar un empleado.';
END CATCH
END
GO
-----FIN PROCESO PARA ELIMINAR EMPLEADOS-----



---PROCESO PARA EDITAR EMPLEADOS----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Editar_Empleados')
PRINT 'Creando proceso SP_Editar_Empleados';
ELSE
BEGIN
DROP PROCEDURE SP_Editar_Empleados;
END
GO

GO
CREATE PROCEDURE SP_Editar_Empleados 
@Usuario VARCHAR(MAX), ---Clave de usuario actual que hace cambiso---
@ClaTien VARCHAR(MAX), ---Clave de la tienda a la que pertenesera el nuevo empleado---
@Puesto VARCHAR(MAX), ---Puesto que tiene el empleado---
@Tipo VARCHAR(MAX), ---Tipo de usuario , ADMINISTRADOR, USUARIO---
@ClaEmpl VARCHAR(MAX), --- Clave del usuario---
@Nombre VARCHAR(MAX), --- Nombre del empleado---
@Activo BIT, --- POR SI DECEAN DESACIVAR LA CUENTA---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
DECLARE @Nom VARCHAR(MAX);
	---Si el usuario ya existe----
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )
		----Si la tieda existe editamos---
		IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien)=1)
		BEGIN
			----Si el usuario existe----
			IF((SELECT COUNT(*) FROM Empleados WHERE ClaEmpl = @ClaEmpl)=1)			
			BEGIN
				--Edidtamos---
				UPDATE Empleados SET Puesto =  @Puesto WHERE ClaEmpl = @ClaEmpl;
				UPDATE Cuentas SET Tipo = @Tipo, Activo = @Activo WHERE ClaEmpl = @ClaEmpl;
				SET @Salida = 'Se edito correcctamente al usuario '+@Nombre+'.';
				SET @Txt = 'El usuario '+@Usuario+' edito al usuario'+@ClaEmpl+' por puesto '+@Puesto+', Tipo '+@Tipo+' y Cuenta '+CAST(@Activo AS VARCHAR);
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
			---si ya existe no insertamos---
			ELSE
			BEGIN
				SET @Salida = 'Error, La clave '+@ClaEmpl+' del usuario ya no existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento editar al empleado '+@Nombre+'y ya no existente';
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
		END
		ELSE
		BEGIN---si la clave a ediar no existe
			SET @Salida = 'Error, La tienda con clave '+@ClaTien+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento editar al usuario '+@Nombre+' pero la Tienda ya no existente';
			EXEC SP_Msg @Txt; ---informe al reporte---
		END
	ELSE
	BEGIN---si el usuario no existe---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento editar al usuario '+@Nombre+'. '+@Validacion;
		EXEC SP_Msg @Txt;--informamos al repore---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Editar_Empleados';
	SET @Salida = 'Ha ocurrido un error al editar un empleado.';
END CATCH
END
GO
---FIN PROCESO PARA EDITAR EMPLEADOS-----




---PROCESO PARA EDITAR CUENTA----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Editar_Cuentas')
PRINT 'Creando proceso SP_Editar_Cuentas';
ELSE
BEGIN
DROP PROCEDURE SP_Editar_Cuentas;
END
GO

GO
CREATE PROCEDURE SP_Editar_Cuentas 
@Usuario VARCHAR(MAX), ---Nombre de usuario actual---
@ClaEmpl VARCHAR(MAX), ---Clave de empleado---
@ClaTien VARCHAR(MAX), ---Clave de la tienda a la que pertenesera el nuevo empleado---
@Nombre VARCHAR(MAX), ---Nombre de empleado---
@Telefono VARCHAR(MAX), ---Numero telefonico---
@Usr VARCHAR(MAX), --- por si cambia su usuario de login---
@Clave VARCHAR(MAX), --- por si cambian su calve de login---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
DECLARE @Nom VARCHAR(MAX);
	---Si el usuario ya existe----
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )
		----Si la tieda existe editamos---
		IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien)=1)
		BEGIN
			OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
			----Si cambia de usuario y este es nuevo o igual al usuario actual puede editar----
			IF ((SELECT COUNT(*) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usr COLLATE SQL_Latin1_General_CP1_CS_AS)=0 OR (@Usuario = @Usr))			
			BEGIN
				--Edidtamos---
				UPDATE Empleados SET Nombre =  @Nombre, Telefono = @Telefono WHERE ClaEmpl = @ClaEmpl;
				UPDATE Cuentas SET Usuario = ENCRYPTBYKEY(KEY_GUID('LlaveEcriptacion'),@Usr),
				Clave = ENCRYPTBYKEY(KEY_GUID('LlaveEcriptacion'),@Clave), Acceso = 0 WHERE ClaEmpl = @ClaEmpl;

				SET @Salida = 'Se edito correctamente tu cuenta.';
				SET @Txt = 'El usuario '+@Usuario+' edito su cuenta con nombre'+@Nombre+'telefo'+@Telefono+' y nueva cuenta';
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
			---si ya existe no insertamos---
			ELSE
			BEGIN
				SET @Salida = 'Error, La clave '+@Usr+' ya existe, intenta otra.';
				SET @Txt = 'El usuario '+@Usuario+' intento editar su cuenta con usuario '+@Usr+' pero ya existe';
				EXEC SP_Msg @Txt;--.Informamos al reporte---
			END
		END
		ELSE
		BEGIN---si la clave a ediar no existe
			SET @Salida = 'Error, La tienda con clave '+@ClaTien+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento editar al usuario '+@Nombre+' pero la Tienda ya no existente';
			EXEC SP_Msg @Txt; ---informe al reporte---
		END
	ELSE
	BEGIN---si el usuario no existe---
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento editar al usuario '+@Nombre+' . '+@Validacion;
		EXEC SP_Msg @Txt;--informamos al repore---
	END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Editar_Empleados';
	SET @Salida = 'Ha ocurrido un error al editar la cuenta.';
END CATCH
END
GO
---FIN PROCESO PARA EDITAR CUENTA-----





	-----PROCESO PARA MOSTRAR EMPLEADOS-----
	---SOlO SE MOSTRARAN EMPLEADOS PERTENECIENTES A ESA TIENDA---
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Buscar_Empleados')
PRINT 'Creando proceso SP_Buscar_Empleados';
ELSE
BEGIN
DROP PROCEDURE SP_Buscar_Empleados;
END
GO

GO
CREATE PROCEDURE SP_Buscar_Empleados 
@ClaTien VARCHAR(MAX) ---recibo la clave de la tienda para mostar solo empleados de esa tienda---
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	SELECT Cuentas.ClaEmpl, ClaTien, Nombre,Puesto, Tipo FROM Empleados
	INNER JOIN Cuentas ON Empleados.ClaEmpl = Cuentas.ClaEmpl 
	WHERE ClaTien = @ClaTien ORDER BY Nombre;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Buscar_Empleados';
END CATCH
END
GO
-----FIN PROCESO PARA MOSTRAR TODAS LOS EMPLEADOS-----



-----PROCESO PARA BUSCAR EMPLEADO-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Buscar_Empleado')
PRINT 'Creando proceso SP_Buscar_Empleado';
ELSE
BEGIN
DROP PROCEDURE SP_Buscar_Empleado;
END
GO

 

GO
CREATE PROCEDURE SP_Buscar_Empleado
@Valor VARCHAR(MAX),
@ClaTien VARCHAR(MAX) 
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
		--- LIKE % PARA HACER BUSQUEDAS QUE SEAN SEMEJANES---
	SELECT Cuentas.ClaEmpl, ClaTien, Nombre,Puesto, Tipo FROM Empleados
	INNER JOIN Cuentas ON Empleados.ClaEmpl = Cuentas.ClaEmpl 
	WHERE Cuentas.ClaEmpl LIKE '%'+@Valor+'%'
	OR Nombre LIKE '%'+@Valor+'%'
	AND ClaTien = @ClaTien;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Buscar_Empleado';
END CATCH
END
GO
-----FIN PROCESO PARA BUSCAR EMPLEADO-----
USE Puntoventa;

-----CREAMOS LA LLAVE MAESTRA Y EL CERTIFICADO-----
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'c0ntras3ñ@_muy_dificil';
CREATE CERTIFICATE Certificado WITH SUBJECT = 'c0ntras3ñ@_muy_dificil';
CREATE SYMMETRIC KEY LlaveEcriptacion WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE Certificado;
GO
-----FIN DE LA LLAVE MAESTRA-------


/*
CERTIFICATE -> Certificado
SYMMETRIC KEY -> LlaveEcriptacion
*/

---Para poder agregar un amistrador de la tienda 
---SELECT * FROM Tienda

/*
-----------CREACION DE UN USAURIO ENCRYPTADO PRUEBAS-----------
SELECT * FROM Empleados
INSERT INTO Empleados VALUES ('EMPL2','TIEN1','Claudio Alonso DR', 7771234567, 'Aministrador' );

SELECT * FROM Cuentas
GO
OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
DECLARE @Usuario VARCHAR(MAX);
DECLARE @msg VARCHAR(MAX);
SET @Usuario = 'ADMI';
IF((SELECT COUNT(*) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario)=0)
BEGIN
INSERT INTO Cuentas VALUES('EMPL2',ENCRYPTBYKEY(KEY_GUID('LlaveEcriptacion'),@Usuario),ENCRYPTBYKEY(KEY_GUID('LlaveEcriptacion'),@Usuario),'Administrador',0,0);
SET @msg = 'SE CREO AL USUARIO '+@Usuario;
EXEC SP_Msg @msg;
END
CLOSE SYMMETRIC KEY LlaveEcriptacion;
GO

---PARA LA DESENCRYPTACION
OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
SELECT  CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)),CONVERT(VARCHAR,DECRYPTBYKEY(Clave)) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = 'ADMIN'
CLOSE SYMMETRIC KEY LlaveEcriptacion;
GO

*/

--- 1 -> cuenta validada---
--- 2 -> cuenta desactivada---
--- 3 -> cuenta con acceso----
--- 4 -> cuenta inexistente---
----------PROCESO DE VALIDACION----------
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Validacion')
PRINT 'Creando proceso SP_Validacion';
ELSE
BEGIN
DROP PROCEDURE SP_Validacion;
END
GO

GO
CREATE PROCEDURE SP_Validacion 
@Usuario VARCHAR(MAX),
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
---ABRIMOS NUESTRA LLAVE PARA DESENCRYPTAR----
OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
	---SI EL USUARIO Y CLAVE SON CORRECTAS---
	IF ((SELECT COUNT(*) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS)=1)
		---SI EL USUARIO ES CORRECTO VERIFICACMOS SI YA EXISTE UN ACCESO--- 
			IF((SELECT CAST(Acceso AS VARCHAR) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS)='1')
			BEGIN
				---VERIFICAMOS SI LA CUENTA ESTA ACTIVA---
				IF((SELECT CAST(Activo AS VARCHAR) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS)='1')
				BEGIN
					---CUENTA VALIDADA---
					SET @Salida = '1';
				END
				---SI LA CUENA NO ESTA ACTIVA----
				ELSE
				BEGIN
					SET @Salida = 'Error, Cuenta desactivada.';
				END
			END
			---SI YA NO CUENTA CON ACCESO---
			ELSE
			BEGIN
				SET @Salida = 'Error, La cuenta ya no tiene acceso.';
			END
	---SI EL USUARIO NO EXISTE---
	ELSE
	BEGIN
		SET @Salida = 'Error, Cuenta inexistente.';
	END
CLOSE SYMMETRIC KEY LlaveEcriptacion;
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Validacion'; ---INFROMAMOS AL REPORTE---
	SET @Salida = 'Ha ocurrido un error al intentar validar tú usuario.';
	CLOSE SYMMETRIC KEY LlaveEcriptacion; 
END CATCH
END
GO
/*
DECLARE @Salida VARCHAR(MAX);
EXEC SP_Login 'ADMI','ADMI',@Salida OUTPUT;
SELECT @Salida;
*/
---SELECT * FROM Cuentas
----------FIN PROCESO DE VALIDACION----------



----------PROCESO DE LOGIN----------
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Login')
PRINT 'Creando proceso SP_Login';
ELSE
BEGIN
DROP PROCEDURE SP_Login;
END
GO

GO
CREATE PROCEDURE SP_Login 
@Usuario VARCHAR(MAX),
@Clave VARCHAR(MAX),
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
---ABRIMOS NUESTRA LLAVE PARA DESENCRYPTAR----
OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
	---SI EL USUARIO Y CLAVE SON CORRECTAS---
	IF ((SELECT COUNT(*) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS AND CONVERT(VARCHAR,DECRYPTBYKEY(Clave)) = @Clave COLLATE SQL_Latin1_General_CP1_CS_AS)=1)
		---SI EL USUARIO ES CORRECTO VERIFICACMOS SI YA EXISTE UN ACCESO EN OTRO EQUIPO--- 
			IF((SELECT CAST(Acceso AS VARCHAR) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS)='0')
			BEGIN
				---VERIFICAMOS SI LA CUENTA ESTA ACTIVA---
				IF((SELECT CAST(Activo AS VARCHAR) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS)='1')
				BEGIN
					---ACTUALIZAMOS SU ACCSO SI SE LOGIO CORRECTAMENTE---
					UPDATE Cuentas SET Acceso=1 WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS;
					SET @Salida = 'Iniciando sesion. !Bienvenido¡.';
					SET @Txt = 'El usuario '+@Usuario+' ha iniciando sesión';
					EXEC SP_Msg @Txt; ---INFROMAMOS AL REPORTE---
				END
				---SI LA CUENA NO ESTA ACTIVA----
				ELSE
				BEGIN
					SET @Salida = 'Error, tu cuenta esta desactivada.';
					SET @txt = 'El usuario '+@Usuario+' intento ingresar al sistema con cuenta desactivada';
					EXEC SP_Msg @Txt;---INFROMAMOS AL REPORTE---
				END
			END
			---SI YA EXISTE UN ACCESO EN OTRO EQUIPO
			ELSE
			BEGIN
				SET @Salida = 'Error, ya tienes iniciada tu sesión en otro equipo.';
				SET @txt = 'El usuario '+@Usuario+' intento ingresar al sistema con cuenta iniciada';
				EXEC SP_Msg @Txt;---INFROMAMOS AL REPORTE---
			END
	---SI EL USUARIO Y CLAVE SON INCORRECTAS---
	ELSE
	BEGIN
		SET @Salida = 'Error, Usuario o contraseña invalida.';
		SET @txt = 'El usuario '+@Usuario+' intento ingresar al sistema';
		EXEC SP_Msg @Txt; ---INFROMAMOS AL REPORTE---
	END
CLOSE SYMMETRIC KEY LlaveEcriptacion;
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Login'; ---INFROMAMOS AL REPORTE---
	SET @Salida = 'Ha ocurrido un error al iniciar cerrar sesión.';
	CLOSE SYMMETRIC KEY LlaveEcriptacion; 
END CATCH
END
GO
/*
DECLARE @Salida VARCHAR(MAX);
EXEC SP_Login 'ADMI','ADMI',@Salida OUTPUT;
SELECT @Salida;
*/
---SELECT * FROM Cuentas
----------FIN PROCESO DE LOGIN----------



-----PROCESO PARA CERRAR SECCION-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Cerrar_Login')
PRINT 'Creando proceso SP_Cerrar_Login';
ELSE
BEGIN
DROP PROCEDURE SP_Cerrar_Login;
END
GO

GO
CREATE PROCEDURE SP_Cerrar_Login 
@Usuario VARCHAR(MAX),
@Salida VARCHAR(MAX) OUTPUT
AS BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
---ABRIMOS NUESTRA LLAVE PARA DESENCRYPTAR----
OPEN SYMMETRIC KEY LlaveEcriptacion DECRYPTION BY CERTIFICATE Certificado;
	---SI EL USUARIO Existe---
	IF((SELECT COUNT(*) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS)= 1)
		---SI EL USUARIO ES CORRECTO VERIFICACMOS SI SU ACCESO EXISTE PARA CERRARLO--- 
		IF((SELECT CAST(Activo AS VARCHAR) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS)='1')
		BEGIN
			---VERIFICAMOS QUE LA CUENTA ESTE ACIVA---
			IF((SELECT CAST(Acceso AS VARCHAR) FROM Cuentas WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS)='1')
			BEGIN
				---ACTUALIZAMOS SU ACCESO SI SE LOGIO CORRECTAMENTE---
				UPDATE Cuentas SET Acceso=0 WHERE CONVERT(VARCHAR,DECRYPTBYKEY(Usuario)) = @Usuario COLLATE SQL_Latin1_General_CP1_CS_AS;
				SET @Salida = 'Cerrando sesión. ¡Hasta pronto!.';
				SET @Txt = 'El usuario '+@Usuario+' ha cerrado sesión';
				EXEC SP_Msg @Txt;
			END
			---SI LA CUENTA ESTA INACTIVA---
			ELSE
			BEGIN
				SET @Salida = 'Error, tú sesión ya ha sido cerrada.';
				SET @txt = 'El usuario '+@Usuario+' intento cerrar al sistema con cuenta cerrada';
				EXEC SP_Msg @Txt;
			END
		END
		---SI YA EXISTE UN ACCESO EN OTRO EQUIPO
		ELSE
		BEGIN
			SET @Salida = 'Error, tu cuenta esta desactivada.';
			SET @txt = 'El usuario '+@Usuario+' intento cerrar el sistema con cuenta desactivada.';
			EXEC SP_Msg @Txt;---INFROMAMOS AL REPORTE---
			
		END
	---SI EL USUARIO Y CLAVE SON INCORRECTAS---
	ELSE
	BEGIN
		SET @Salida = 'Error, tú usuario ya no existe.';
		SET @txt = 'El usuario '+@Usuario+' intento cerrar al sistema y no existe';
		EXEC SP_Msg @Txt;
	END
CLOSE SYMMETRIC KEY LlaveEcriptacion;
COMMIT TRANSACTION
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION
SET @Salida = 'Ha ocurrido un error al intentar cerrar sesión.';
EXEC  SP_Msg 'Ha ocurrido un error en SP_Cerrar_Login';
CLOSE SYMMETRIC KEY LlaveEcriptacion;
END CATCH

END
GO
/*
DECLARE @Salida VARCHAR(MAX);
EXEC SP_Cerrar_Login 'ADMI',@Salida OUTPUT;
SELECT @Salida

SELECT * FROM Tiendas
SELECT * FROM Cuentas
SELECT * FROM Empleados
*/
-----FIN PROCESO CERRAR SECCION-----


-----INSERCION DE TIENDA, Empleado y Cuenta para pruebas------




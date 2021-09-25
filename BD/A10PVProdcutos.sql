USE PuntoVenta;

USE PuntoVenta;
-----PROCESO PARA INSERTAT PRODUCTOS-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Insertar_Productos')
PRINT 'Creando proceso SP_Insertar_Productos';
ELSE
BEGIN
DROP PROCEDURE SP_Insertar_Productos;
END
GO


GO
CREATE PROCEDURE SP_Insertar_Productos
@Usuario VARCHAR(MAX), ---Usuario que ingresa el producto---
@ClaTien VARCHAR(MAX), ---Clave de la tienda---
@ClaProd VARCHAR(MAX), ---Clave o codigo del producto--
@Nombre VARCHAR(MAX), ---Nombbre del producto---
@ClaProv VARCHAR(MAX), ---Clave del proveedor--
@Marca VARCHAR(MAX), ---Marca del producto---
@Costo VARCHAR(MAX), ---Costo al que se compra---
@PreSug VARCHAR(MAX), ---Precio sugerido---
@Precio VARCHAR(MAX), ---Precio Final---
@Existencia INT,      ---Total de productos---
@ClaUbic VARCHAR(MAX),---Clave de donde se ubicara---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )---Si el usuario esta validado entro---
		IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien)=1)---Si existe la tienda---
			IF((SELECT COUNT(*) FROM Ubicaciones WHERE ClaUbic = @ClaUbic)= 1)---Si existe la ubicacion
				IF((SELECT COUNT(*) FROM Proveedores WHERE ClaProv = @ClaProv)=1)---Si el proveedor existe
					IF((SELECT COUNT(*) FROM Productos WHERE ClaProd = @ClaProd)=1) ---Si la clave existe---
						IF((SELECT COUNT(*) FROM ProTie WHERE ClaProd = @ClaProd AND ClaTien = @ClaTien)=1)---S hay relacion con la tienda---
							IF((SELECT COUNT(*) FROM ProPro WHERE ClaProd = @ClaProd AND ClaProv = @ClaProv AND ClaTien = @ClaTien)=1) --- si hay relacion con el proveedor
							BEGIN
								IF((SELECT COUNT(*) FROM ProUbi WHERE ClaProd = @ClaProd AND ClaUbic = @ClaUbic AND ClaTien = @ClaTien)=1)---Si ya tiene relacion con su ubicacion---
								BEGIN
									UPDATE ProUbi SET Existencia = (Existencia +  @Existencia) WHERE ClaProd = @ClaProd AND ClaUbic = @ClaUbic AND ClaTien = @ClaTien;
									SET @Salida = 'Se han agregado más productos '+@Nombre+' al inventario '+(SELECT Lugar FROM Ubicaciones WHERE ClaUbic = @ClaUbic)+'.';
									SET @Txt = 'El usuario '+@Usuario+'agrego nuevo producto '+@Nombre+' con clave '+@ClaProd+'. Tienda '+@ClaTien+', Proveedor '+@ClaProv+', Ubicado en '+@ClaUbic;
									EXEC SP_Msg @Txt;--informamos al reporte----
								END
								ELSE---Si no tiene ese producto ubicado
								BEGIN
									INSERT INTO ProUbi VALUES (@ClaProd, @ClaUbic, @ClaTien, @Existencia)
									SET @Salida = 'Se han agregado productos '+@Nombre+' al inventario de '+(SELECT Lugar FROM Ubicaciones WHERE ClaUbic = @ClaUbic)+'.';
									SET @Txt = 'El usuario '+@Usuario+' inserto el producto '+@Nombre+' con clave '+@ClaProd+'. Tienda '+@ClaTien+', Proveedor '+@ClaProv+', Ubicado en '+@ClaUbic;
									EXEC SP_Msg @Txt;--informamos al reporte----
								END
							END
							ELSE---Si no hay relacion con el porveedor---
							BEGIN
								INSERT INTO ProPro VALUES (@ClaProd, @ClaProv, @ClaTien, @Marca);
								IF((SELECT COUNT(*) FROM ProUbi WHERE ClaProd = @ClaProd AND ClaUbic = @ClaUbic AND ClaTien = @ClaTien)=1)---Si ya tiene relacion con su ubicacion---
								BEGIN	
									UPDATE ProUbi SET Existencia = (Existencia +  @Existencia) WHERE ClaProd = @ClaProd AND ClaUbic = @ClaUbic AND ClaTien = @ClaTien;
									SET @Salida = 'Se han agregado productos '+@Nombre+' al inventario de '+(SELECT Lugar FROM Ubicaciones WHERE ClaUbic = @ClaUbic)+'.';
									SET @Txt = 'El usuario '+@Usuario+' inserto el producto '+@Nombre+' con clave '+@ClaProd+'. Tienda '+@ClaTien+', Proveedor '+@ClaProv+', Ubicado en '+@ClaUbic;
									EXEC SP_Msg @Txt;--informamos al reporte----
								END
								ELSE---Si no tiene ese producto ubicado
								BEGIN
									INSERT INTO ProUbi VALUES (@ClaProd, @ClaUbic, @ClaTien, @Existencia)
									SET @Salida = 'Se han agregado productos '+@Nombre+' al inventario de '+(SELECT Lugar FROM Ubicaciones WHERE ClaUbic = @ClaUbic)+'.';
									SET @Txt = 'El usuario '+@Usuario+' inserto el producto '+@Nombre+' con clave '+@ClaProd+'. Tienda '+@ClaTien+', Proveedor '+@ClaProv+', Ubicado en '+@ClaUbic;
									EXEC SP_Msg @Txt;--informamos al reporte----
								END
							END
						ELSE ---Si no hay relacion en la tienda---
						BEGIN
							INSERT INTO ProTie VALUES (@ClaProd, @ClaTien, @Costo, @PreSug, @Precio);
							INSERT INTO ProPro VALUES (@ClaProd, @ClaProv, @ClaTien, @Marca);
							INSERT INTO ProUbi VALUES (@ClaProd, @ClaUbic, @ClaTien, @Existencia)
							SET @Salida = 'Se ha insertado el producto '+@Nombre+' al inventario';
							SET @Txt = 'El usuario '+@Usuario+' relaciono el producto '+@Nombre+' con clave '+@ClaProd+'. Tienda '+@ClaTien+', Proveedor '+@ClaProv+', Ubicacion '+@ClaUbic;
							EXEC SP_Msg @Txt;--informamos al reporte----
						END
					ELSE ---Si el producto no existe en la tabla lo metemos---
					BEGIN
						INSERT INTO Productos VALUES (@ClaProd, @Nombre);
						INSERT INTO ProTie VALUES (@ClaProd, @ClaTien, @Costo, @PreSug, @Precio);
						INSERT INTO ProPro VALUES (@ClaProd, @ClaProv, @ClaTien, @Marca);
						INSERT INTO ProUbi VALUES (@ClaProd, @ClaUbic, @ClaTien, @Existencia)
						SET @Salida = 'Se ha insertado el producto '+@Nombre+' al inventario';
						SET @Txt = 'El usuario '+@Usuario+' inserto el producto '+@Nombre+' con clave '+@ClaProd+'. Tienda '+@ClaTien+', Proveedor '+@ClaProv+', Ubicacion '+@ClaUbic;
						EXEC SP_Msg @Txt;--informamos al reporte----
					END
				ELSE----SI EL PROVEEDOR NO EXISTE---
				BEGIN
					SET @Salida = 'Error, la clave del proveedor '+@ClaProv+' ya no existe.';
					SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+' pero el proveedor ya no existente';
					EXEC SP_Msg @Txt;--informamos al reporte----
				END
			ELSE---LA CLAVE DE LA UBICACION NO EXISTE---
			BEGIN 
				SET @Salida = 'Error, la clave del lugar '+@ClaUbic+' ya no existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+' pero el lugar ya no existente';
				EXEC SP_Msg @Txt;--informamos al reporte----
			END
		ELSE ---LA CLAVE DE LA TIENDA NO EXISTE
		BEGIN
			SET @Salida = 'Error, la clave de tienda '+@ClaTien+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+' pero la tienda ya no existente';
			EXEC SP_Msg @Txt;--informamos al reporte----
		END
	ELSE---si el usuario no esta validado---
	BEGIN
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Insertar_Productos';
	SET @Salida = 'Ha ocurrido un error al insertar un producto.';
END CATCH
END
GO
-----FIN PROCESO PARA INSERTAR PRODUCTOS-----




-----PROCESO PARA INSERTAT PRODUCTO DE TIENDASS-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Eliminar_Productos')
PRINT 'Creando proceso SP_Eliminar_Productos';
ELSE
BEGIN
DROP PROCEDURE SP_Eliminar_Productos;
END
GO


GO
CREATE PROCEDURE SP_Eliminar_Productos
@Usuario VARCHAR(MAX), ---Usuario que ingresa el producto---
@ClaTien VARCHAR(MAX), ---Clave de la tienda---
@ClaProd VARCHAR(MAX), ---Clave o codigo del producto--
@Nombre VARCHAR(MAX), ---Nombbre del producto---
@ClaProv VARCHAR(MAX), ---Clave del proveedor--
@ClaUbic VARCHAR(MAX),---Clave de donde se ubicara---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )---Si el usuario esta validado entro---
		IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien)=1)---Si existe la tienda---
			IF((SELECT COUNT(*) FROM Ubicaciones WHERE ClaUbic = @ClaUbic)= 1)---Si existe la ubicacion
				IF((SELECT COUNT(*) FROM Proveedores WHERE ClaProv = @ClaProv)=1)---Si el proveedor existe
					IF((SELECT COUNT(*) FROM Productos WHERE ClaProd = @ClaProd)=1) ---Si la clave existe---
					BEGIN
						DELETE FROM ProTie WHERE ClaProd = @ClaProd AND ClaTien = @ClaTien;---Se elimina relacion con la tienda--
						DELETE FROM ProPro WHERE ClaProd = @ClaProd AND ClaProv = @ClaProv AND ClaTien = @ClaTien; --Se elimina relacion con el poreveedor---
						DELETE FROM ProUbi WHERE ClaProd = @ClaProd AND ClaUbic = @ClaUbic AND ClaTien = @ClaTien; --Se elimina relacion con la ubicacion---
						SET @Salida = 'Se han elimiado todos los producto '+@Nombre+' del lugar '+(SELECT Lugar FROM Ubicaciones WHERE ClaUbic = @ClaUbic)+'.';
						SET @Txt = 'El usuario '+@Usuario+' elimino todos los producto '+@Nombre+' con clave '+@ClaProd+'de '+(SELECT Lugar FROM Ubicaciones WHERE ClaUbic = @ClaUbic);
						EXEC SP_Msg @Txt;--informamos al reporte----
					END
					ELSE ---Si el producto no existe en la tabla lo metemos---
					BEGIN
						SET @Salida = 'Error, el producto '+@Nombre+' no existe.';
						SET @Txt = 'El usuario '+@Usuario+' intento eliminar el producto '+@Nombre+' con clave '+@ClaProd+'. Pero no existe';
						EXEC SP_Msg @Txt;--informamos al reporte----
					END
				ELSE----SI EL PROVEEDOR NO EXISTE---
				BEGIN
					SET @Salida = 'Error, la clave del proveedor '+@ClaProv+' ya no existe.';
					SET @Txt = 'El usuario '+@Usuario+' intento Eliminar el producto '+@Nombre+' con clave '+@ClaProd+' pero el proveedor ya no existente';
					EXEC SP_Msg @Txt;--informamos al reporte----
				END
			ELSE---LA CLAVE DE LA UBICACION NO EXISTE---
			BEGIN 
				SET @Salida = 'Error, la clave del lugar '+@ClaUbic+' ya no existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento eliminar el producto '+@Nombre+' con clave '+@ClaProd+' pero el lugar ya no existente';
				EXEC SP_Msg @Txt;--informamos al reporte----
			END
		ELSE ---LA CLAVE DE LA TIENDA NO EXISTE
		BEGIN
			SET @Salida = 'Error, la clave de tienda '+@ClaTien+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento eliminar el producto '+@Nombre+' con clave '+@ClaProd+' pero la tienda ya no existente';
			EXEC SP_Msg @Txt;--informamos al reporte----
		END
	ELSE---si el usuario no esta validado---
	BEGIN
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Eliminar_Productos';
	SET @Salida = 'Ha ocurrido un error al insertar un producto.';
END CATCH
END
GO
-----FIN PROCESO PARA ELIMINAR PRODUCTOS DE TIENDAS-----



-----PROCESO PARA EDITAR PRODUCTOS-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Editar_Productos')
PRINT 'Creando proceso SP_Editar_Productos';
ELSE
BEGIN
DROP PROCEDURE SP_Editar_Productos;
END
GO


GO
CREATE PROCEDURE SP_Editar_Productos
@Usuario VARCHAR(MAX), ---Usuario que ingresa el producto---permanente
@ClaTien VARCHAR(MAX), ---Clave de la tienda--- permanete
@ClaProd VARCHAR(MAX), ---Clave o codigo del producto--
@NewClaProd VARCHAR(MAX),---Si cambia la clave del producto---
@Nombre VARCHAR(MAX), ---Nombbre del producto---
@ClaProv VARCHAR(MAX), ---Clave del proveedor--
@NewClaProv VARCHAR (MAX), ---Si cambian de proveedor---
@Marca VARCHAR(MAX), ---Marca del producto---
@Costo VARCHAR(MAX), ---Costo al que se compra---
@PreSug VARCHAR(MAX), ---Precio sugerido---
@Precio VARCHAR(MAX), ---Precio Final---
@Existencia INT,      ---Total de productos---
@ClaUbic VARCHAR(MAX),---Clave de donde se ubicara---
@NewClaUbic VARCHAR(MAX), --Nueva clave de ubicacion---
@Salida VARCHAR(MAX) OUTPUT
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
DECLARE @Txt VARCHAR(MAX);
	DECLARE @Validacion VARCHAR(MAX);
	EXEC SP_Validacion @Usuario,@Validacion OUTPUT;
	IF( @Validacion = '1' )---Si el usuario esta validado entro---
		IF((SELECT COUNT(*) FROM Tiendas WHERE ClaTien = @ClaTien)=1)---Si existe la tienda---
			IF((SELECT COUNT(*) FROM Ubicaciones WHERE ClaUbic = @NewClaUbic)= 1)---Si existe la ubicacion
				IF((SELECT COUNT(*) FROM Proveedores WHERE ClaProv = @NewClaProv)=1)---Si el proveedor existe
					IF((SELECT COUNT(*) FROM Productos WHERE ClaProd = @NewClaProd)=1) ---Si la clave existe---
						SELECT '';
					ELSE ---Si el producto no existe en la tabla lo metemos---
					BEGIN
						SET @Salida = 'Se ha insertado el producto '+@Nombre+' al inventario';
						SET @Txt = 'El usuario '+@Usuario+' inserto el producto '+@Nombre+' con clave '+@ClaProd+'. Tienda '+@ClaTien+', Proveedor '+@ClaProv+', Ubicacion '+@ClaUbic;
						EXEC SP_Msg @Txt;--informamos al reporte----
					END
				ELSE----SI EL PROVEEDOR NO EXISTE---
				BEGIN
					SET @Salida = 'Error, la clave del proveedor '+@ClaProv+' ya no existe.';
					SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+' pero el proveedor ya no existente';
					EXEC SP_Msg @Txt;--informamos al reporte----
				END
			ELSE---LA CLAVE DE LA UBICACION NO EXISTE---
			BEGIN 
				SET @Salida = 'Error, la clave del lugar '+@ClaUbic+' ya no existe.';
				SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+' pero el lugar ya no existente';
				EXEC SP_Msg @Txt;--informamos al reporte----
			END
		ELSE ---LA CLAVE DE LA TIENDA NO EXISTE
		BEGIN
			SET @Salida = 'Error, la clave de tienda '+@ClaTien+' ya no existe.';
			SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+' pero la tienda ya no existente';
			EXEC SP_Msg @Txt;--informamos al reporte----
		END
	ELSE---si el usuario no esta validado---
	BEGIN
		SET @Salida = @Validacion;
		SET @Txt = 'El usuario '+@Usuario+' intento insertar el prodcuto '+@Nombre+' con clave '+@ClaProd+'. '+@Validacion;
		EXEC SP_Msg @Txt;---informamos al reporte---
	END

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	EXEC SP_Msg 'Ha ocurrido un error en SP_Editar_Productos';
	SET @Salida = 'Ha ocurrido un error al insertar un producto.';
END CATCH
END
GO
-----FIN PROCESO PARA INSERTAR PRODUCTOS-----




	-----PROCESO PARA MOSTRAR PRODUCTOS
	-----
IF NOT EXISTS(SELECT * FROM sys.procedures WHERE name = 'SP_Mostrar_Proveedores')
PRINT 'Creando proceso SP_Mostrar_Proveedores';
ELSE
BEGIN
DROP PROCEDURE SP_Mostrar_Proveedores;
END
GO

GO
CREATE PROCEDURE SP_Mostrar_Proveedores 
@ClaTien VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	
	SELECT  T.Nombre,P.ClaProd, P.Nombre, PR.Costo, PR.PreSug, PR.Precio, PU.Existencia, PU.ClaUbic FROM Productos AS P
	INNER JOIN ProTie AS PR ON P.ClaProd = PR.ClaProd
	INNER JOIN Tiendas AS T ON T.ClaTien = PR.ClaTien
	INNER JOIN ProUbi AS PU ON P.ClaProd = PU.ClaProd
	INNER JOIN Tiendas ON T.ClaTien = PU.ClaTien
	WHERE T.ClaTien = 'TIEN2' AND PU.ClaUbic = 'BODE'
	GROUP BY  P.ClaProd, P.Nombre, PR.Costo, PR.PreSug, PR.Precio, PU.Existencia, PU.ClaUbic,T.Nombre

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Buscar_Proveedores';
END CATCH
END
GO
-----FIN PROCESO PARA MOSTRAR PRODUCTOS------


@Usuario VARCHAR(MAX), ---Usuario que ingresa el producto---
@ClaTien VARCHAR(MAX), ---Clave de la tienda---
@ClaProd VARCHAR(MAX), ---Clave o codigo del producto--
@Nombre VARCHAR(MAX), ---Nombbre del producto---
@ClaProv VARCHAR(MAX), ---Clave del proveedor--
@Marca VARCHAR(MAX), ---Marca del producto---
@Costo VARCHAR(MAX), ---Costo al que se compra---
@PreSug VARCHAR(MAX), ---Precio sugerido---
@Precio VARCHAR(MAX), ---Precio Final---
@Existencia INT,      ---Total de productos---
@ClaUbic VARCHAR(MAX),---Clave de donde se ubicara---
@Salida VARCHAR(MAX) OUTPUT


SELECT * FROM Productos
SELECT * FROM ProUbi


-----PROCESO PARA BUSCAR PRODUCTO-----
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
@ClaTien VARCHAR(MAX)
AS
BEGIN
BEGIN TRANSACTION
BEGIN TRY
	SELECT Tiendas.ClaTien,Proveedores.ClaProv,Proveedores.Nombre,Proveedores.Telefono,Proveedores.Correo,Proveedores.Direccion FROM Proveedores 
	INNER JOIN TiePro ON Proveedores.ClaProv = TiePro.ClaProv
	INNER JOIN Tiendas ON Tiendas.ClaTien = TiePro.ClaTien
	WHERE (Proveedores.ClaProv LIKE '%'+@Valor+'%' OR Proveedores.Nombre LIKE '%'+@Valor+'%' 
	OR Proveedores.Telefono LIKE '%'+@Valor+'%' OR Proveedores.Correo LIKE '%'+@Valor+'%')
	AND (Tiendas.ClaTien = @ClaTien) ORDER BY Nombre;
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'Ha ocurrido un error en SP_Buscar_Proveedor';
END CATCH
END
GO
-----FIN PROCESO PARA BUSCAR PRODUCTO-----

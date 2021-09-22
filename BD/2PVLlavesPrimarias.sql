-----------CREACION LLAVES PRIMARIAS-----------


-----------LA LLAVE PRIMARIA DE LA TABLA TIENDA--------
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Tiendas_ClaTien')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Tiendas')
		 BEGIN
		 ALTER TABLE Tiendas ADD CONSTRAINT PK_Tiendas_ClaTien PRIMARY KEY(ClaTien);
		 PRINT 'Se creo contraint PK_Tiendas_ClaTien'
		 EXEC SP_Msg 'Se creo un constraint PK_Tiendas_ClaTien en la tabla Tiendas';
		 END
	  ELSE
		BEGIN
		 EXEC SP_Msg 'Se intento crear llave primaria en la tabla Tiendas';
	     PRINT 'La tabla Tiendas ya tiene llave primaria';
		 END
   END
ELSE
	BEGIN
	EXEC SP_Msg 'Se intento crear un constraint con el nombre PK_Tiendas_ClaTien';
    PRINT 'Ya existe un contraint con el nombre PK_Tiendas_ClaTien';
	END
GO
-----------FIN DE LA LLAVE PRIMARIA DE LA TABLA TIENDA--------



-----LLAVE PRIMARIA PARA LA TABLA PROVEEDORES-----
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Proveedores_ClaProv')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Proveedores')
		 BEGIN
		 ALTER TABLE Proveedores ADD CONSTRAINT PK_Proveedores_ClaProv PRIMARY KEY(ClaProv);
		 PRINT 'Se creo contraint PK_Proveedores_ClaProv'
		 EXEC SP_Msg 'Se creo un constraint PK_Proveedores_ClaProv en la tabla Proveedores';
		 END
	  ELSE
		BEGIN
		 EXEC SP_Msg 'Se intento crear llave primaria en la tabla Proveedores';
	     PRINT 'La tabla Proveedores ya tiene llave primaria';
		 END
   END
ELSE
	BEGIN
	EXEC SP_Msg 'Se intento crear un constraint con el nombre PK_Proveedores_ClaProv';
    PRINT 'Ya existe un contraint con el nombre PK_Proveedores_ClaProv';
	END
GO
-----------FIN DE LA LLAVE PRIMARIA DE LA TABLA PROVEEDORES--------



-----LLAVE PRIMARIA PARA LA TABLA UBICACIONES-----
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Ubicaciones_ClaUbic')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Ubicaciones')
		 BEGIN
		 ALTER TABLE Ubicaciones ADD CONSTRAINT PK_Ubicaciones_ClaUbic PRIMARY KEY(ClaUbic);
		 PRINT 'Se creo contraint PK_Ubicaciones_ClaUbic'
		 EXEC SP_Msg 'Se creo un constraint PK_Ubicaciones_ClaUbic en la tabla Ubicaciones';
		 END
	  ELSE
		BEGIN
		 EXEC SP_Msg 'Se intento crear llave primaria en la tabla Ubicaciones';
	     PRINT 'La tabla Ubicaciones ya tiene llave primaria';
		 END
   END
ELSE
	BEGIN
	EXEC SP_Msg 'Se intento crear un constraint con el nombre PK_Ubicaciones_ClaUbic';
    PRINT 'Ya existe un contraint con el nombre PK_Ubicaciones_ClaUbic';
	END
GO
-----------FIN DE LA LLAVE PRIMARIA DE LA TABLA UBICACIONES--------




-----LLAVE PRIMARIA PARA LA TABLA PRODUCTOS-----
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Productos_ClaProd')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Productos')
		 BEGIN
		 ALTER TABLE Productos ADD CONSTRAINT PK_Productos_ClaProd PRIMARY KEY(ClaProd);
		 PRINT 'Se creo contraint PK_Productos_ClaProd'
		 EXEC SP_Msg 'Se creo un constraint PK_Productos_ClaProd en la tabla Productos';
		 END
	  ELSE
		BEGIN
		 EXEC SP_Msg 'Se intento crear llave primaria en la tabla Productos';
	     PRINT 'La tabla Productos ya tiene llave primaria';
		 END
   END
ELSE
	BEGIN
	EXEC SP_Msg 'Se intento crear un constraint con el nombre PK_Productos_ClaProd';
    PRINT 'Ya existe un contraint con el nombre PK_Productos_ClaProd';
	END
GO
-----------FIN DE LA LLAVE PRIMARIA DE LA TABLA PRODUCTOS--------



-----LLAVE PRIMARIA PARA LA TABLA CLIENTES-----
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Clientes_ClaClie')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Clientes')
		 BEGIN
		 ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes_ClaClie PRIMARY KEY(ClaClie);
		 PRINT 'Se creo contraint PK_Clientes_ClaClie'
		 EXEC SP_Msg 'Se creo un constraint PK_Clientes_ClaClie en la tabla Clientes';
		 END
	  ELSE
		BEGIN
		 EXEC SP_Msg 'Se intento crear llave primaria en la tabla Clientes';
	     PRINT 'La tabla Clientes ya tiene llave primaria';
		 END
   END
ELSE
	BEGIN
	EXEC SP_Msg 'Se intento crear un constraint con el nombre PK_Clientes_ClaClie';
    PRINT 'Ya existe un contraint con el nombre PK_Clientes_ClaClie';
	END
GO
-----------FIN DE LA LLAVE PRIMARIA DE LA TABLA CLIENTES--------



-----LLAVE PRIMARIA PARA LA TABLA EMPLEADOS-----
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Empleados_ClaEmpl')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Empleados')
		 BEGIN
		 ALTER TABLE Empleados ADD CONSTRAINT PK_Empleados_ClaEmpl PRIMARY KEY(ClaEmpl);
		 PRINT 'Se creo contraint PK_Empleados_ClaEmpl'
		 EXEC SP_Msg 'Se creo un constraint PK_Empleados_ClaEmpl en la tabla Empleados';
		 END
	  ELSE
		BEGIN
		 EXEC SP_Msg 'Se intento crear llave primaria en la tabla Empleados';
	     PRINT 'La tabla Empleados ya tiene llave primaria';
		 END
   END
ELSE
	BEGIN
	EXEC SP_Msg 'Se intento crear un constraint con el nombre PK_Empleados_ClaEmpl';
    PRINT 'Ya existe un contraint con el nombre PK_Empleados_ClaEmpl';
	END
GO
-----------FIN DE LA LLAVE PRIMARIA DE LA TABLA EMPLEADOS--------



-----LLAVE PRIMARIA PARA LA TABLA CUENTAS-----
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Cuentas_ClaUsua')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Cuentas')
		 BEGIN
		 ALTER TABLE Cuentas ADD CONSTRAINT PK_Cuentas_ClaUsua PRIMARY KEY(ClaUsua);
		 PRINT 'Se creo contraint PK_Cuentas_ClaUsua'
		 EXEC SP_Msg 'Se creo un constraint PK_Cuentas_ClaUsua en la tabla Cuentas';
		 END
	  ELSE
		BEGIN
		 EXEC SP_Msg 'Se intento crear llave primaria en la tabla Cuentas';
	     PRINT 'La tabla Cuentas ya tiene llave primaria';
		 END
   END
ELSE
	BEGIN
	EXEC SP_Msg 'Se intento crear un constraint con el nombre PK_Cuentas_ClaUsua';
    PRINT 'Ya existe un contraint con el nombre PK_Cuentas_ClaUsua';
	END
GO
-----------FIN DE LA LLAVE PRIMARIA DE LA TABLA CUENTAS--------



-----LLAVE PRIMARIA PARA LA TABLA VENTAS-----
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Ventas_ClaVent')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Ventas')
		 BEGIN
		 ALTER TABLE Ventas ADD CONSTRAINT PK_Ventas_ClaVent PRIMARY KEY(ClaVent);
		 PRINT 'Se creo contraint PK_Ventas_ClaVent'
		 EXEC SP_Msg 'Se creo un constraint PK_Ventas_ClaVent en la tabla Ventas';
		 END
	  ELSE
		BEGIN
		 EXEC SP_Msg 'Se intento crear llave primaria en la tabla Ventas';
	     PRINT 'La tabla Ventas ya tiene llave primaria';
		 END
   END
ELSE
	BEGIN
	EXEC SP_Msg 'Se intento crear un constraint con el nombre PK_Cuentas_Usuario';
    PRINT 'Ya existe un contraint con el nombre PK_Ventas_ClaVent';
	END
GO
-----------FIN DE LA LLAVE PRIMARIA DE LA TABLA VENTAS--------

--*********************************************************************--

----------Llave primaria de tablas de normalizacion-------------



---llave de los tickets---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'Pk_Tickets_ClaProd_ClaVent')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='Tickets')

		 ALTER TABLE Tickets ADD CONSTRAINT Pk_Tickets_ClaProd_ClaVent PRIMARY KEY(ClaProd,ClaVent);
	  ELSE
	     PRINT 'La tabla Tickets ya tiene una llave primaria';
   END
ELSE
   PRINT 'Ya existe un Constraint con el nombre Pk_Tickets_ClaProd_ClaVent';

GO
---Fin llave de los tickets---


---llave de los ProPro---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'Pk_ProPro_ClaProd_ClaProv_ClaTien')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='ProPro')

		 ALTER TABLE ProPro ADD CONSTRAINT Pk_ProPro_ClaProd_ClaProv_ClaTien PRIMARY KEY(ClaProd,ClaProv);
	  ELSE
	     PRINT 'La tabla ProPro ya tiene una llave primaria';
   END
ELSE
   PRINT 'Ya existe un Constraint con el nombre Pk_ProPro_ClaProd_ClaProv_ClaTien';

GO
---Fin llave de los ProPro---


---llave de los ProTie---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'Pk_ProTie_ClaProd_ClaTien')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='ProTie')

		 ALTER TABLE ProTie ADD CONSTRAINT Pk_ProTie_ClaProd_ClaTien PRIMARY KEY(ClaProd,ClaTien);
	  ELSE
	     PRINT 'La tabla ProTien ya tiene una llave primaria';
   END
ELSE
   PRINT 'Ya existe un Constraint con el nombre Pk_ProTie_ClaProd_ClaTien';

GO
---Fin llave de los ProTien---


---llave de los ProUbi---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'Pk_ProUbi_ClaProd_ClaUbic_ClaTien')
   BEGIN
      IF NOT EXISTS(SELECT A.CONSTRAINT_NAME,A.TABLE_NAME, B.COLUMN_NAME
  		 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A 
		 INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS B 
		   ON A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
		 WHERE CONSTRAINT_TYPE='PRIMARY KEY' AND B.TABLE_NAME='ProUbi')

		 ALTER TABLE ProUbi ADD CONSTRAINT Pk_ProUbi_ClaProd_ClaUbic_ClaTien PRIMARY KEY(ClaProd,ClaUbic);
	  ELSE
	     PRINT 'La tabla ProUbic ya tiene una llave primaria';
   END
ELSE
   PRINT 'Ya existe un Constraint con el nombre Pk_ProUbi_ClaProd_ClaUbic_ClaTien';

GO
---Fin llave de los ProUbi---


----------fin Llave primaria de tablas de normalizacion-------------


-----------FIN CREACION LLAVES PRIMARIAS-----------
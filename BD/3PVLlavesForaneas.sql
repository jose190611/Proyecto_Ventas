
-----------CREACION LLAVES FORANEAS TENIENDO COMO REFERENCIA-----------
-----------FK_TABLA-ORIGEN_TABLA-DESTINO_CLAVEARELACIONAR----------- 



---LLAVE FORANEA CON LA TABLA PROVEEDORES Y PROPRO---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Proveedores_ProPro_ClaProv')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Proveedores' AND c.COLUMN_NAME = 'ClaProv' AND d.TABLE_NAME = 'ProPro' AND e.COLUMN_NAME = 'ClaProv'))
	BEGIN
	ALTER TABLE ProPro ADD CONSTRAINT FK_Proveedores_ProPro_ClaProv FOREIGN KEY (ClaProv) 
	REFERENCES Proveedores (ClaProv) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo constraint FK_Proveedores_ProPro_ClaProv';
	EXEC SP_Msg 'Se creo un constraint FK_Proveedores_ProPro_ClaProv con las tablas Proveedores y ProPro';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Proveedores y ProPro';
	  PRINT 'La tabla ProPro ya tiene una llave foranea con la abla Proveedores';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Proveedores_ProPro_ClaProv';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Proveedores_ProPro_ClaProv';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA PROVEEDORES Y ProPro---



---LLAVE FORANEA CON LA TABLA PRODUCTOS Y PROPRO---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Productos_ProPro_ClaProd')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Productos' AND c.COLUMN_NAME = 'ClaProd' AND d.TABLE_NAME = 'ProPro' AND e.COLUMN_NAME = 'ClaProd'))
	BEGIN
	ALTER TABLE ProPro ADD CONSTRAINT FK_Productos_ProPro_ClaProd FOREIGN KEY (ClaProd) 
	REFERENCES Productos (ClaProd) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo constraint FK_Productos_ProPro_ClaProd';
	EXEC SP_Msg 'Se creo un constraint FK_Productos_ProPro_ClaProd con las tablas Productos y ProPro';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Productos y ProPro';
	  PRINT 'La tabla ProPro ya tiene una llave foranea con la abla Productos';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Productos_ProPro_ClaProd';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Productos_ProPro_ClaProd';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA PROVEEDORES Y ProPro---





---LLAVE FORANEA CON LA TABLA UBICACIONES Y PROUBIC---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Ubicaciones_ProUbi_ClaUbic')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Ubicaciones' AND c.COLUMN_NAME = 'ClaUbic' AND d.TABLE_NAME = 'ProUbi' AND e.COLUMN_NAME = 'ClaUbic'))
	BEGIN
	ALTER TABLE ProUbi ADD CONSTRAINT FK_Ubicaciones_ProUbi_ClaUbic FOREIGN KEY (ClaUbic) 
	REFERENCES Ubicaciones (ClaUbic) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Ubicaciones_ProUbi_ClaUbic';
	EXEC SP_Msg 'Se creo un constraint FK_Ubicaciones_ProUbi_ClaUbic con las tablas Ubicaciones y ProUbi';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Ubicaciones y ProUbi';
	  PRINT 'La tabla ProUbi ya tiene una llave foranea con la abla Ubicaciones';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Ubicaciones_ProUbi_ClaUbic';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Ubicaciones_ProUbi_ClaUbic';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA UBICACIONES Y PRODUCTOS---




---LLAVE FORANEA CON LA TABLA PRODUCTOS Y PROUBIC---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Productos_ProUbi_ClaProd')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Productos' AND c.COLUMN_NAME = 'ClaProd' AND d.TABLE_NAME = 'ProUbi' AND e.COLUMN_NAME = 'ClaProd'))
	BEGIN
	ALTER TABLE ProUbi ADD CONSTRAINT FK_Productos_ProUbi_ClaProd FOREIGN KEY (ClaProd) 
	REFERENCES Productos (ClaProd) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Productos_ProUbi_ClaProd';
	EXEC SP_Msg 'Se creo un constraint FK_Productos_ProUbi_ClaProd con las tablas Productos y ProUbi';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Productos y ProUbi';
	  PRINT 'La tabla ProUbi ya tiene una llave foranea con la abla Productos';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Productos_ProUbi_ClaProd';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Productos_ProUbi_ClaProd';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA PRODUCTOS Y PROUBIC---





---LLAVE FORANEA CON LA TABLA TIENDAS Y PROTIE---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Tiendas_ProTie_ClaTien')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Tiendas' AND c.COLUMN_NAME = 'ClaTien' AND d.TABLE_NAME = 'ProTie' AND e.COLUMN_NAME = 'ClaTien'))
	BEGIN
	ALTER TABLE ProTie ADD CONSTRAINT FK_Tiendas_ProTie_ClaTien FOREIGN KEY (ClaTien) 
	REFERENCES Tiendas (ClaTien) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Tiendas_ProTie_ClaTien';
	EXEC SP_Msg 'Se creo un constraint FK_Tiendas_ProTie_ClaTien con las tablas Tienda y ProTie';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Tienda y ProTie';
	  PRINT 'La tabla ProTie ya tiene una llave foranea con la tabla Tienda';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Tiendas_ProTie_ClaTien';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Tiendas_ProTie_ClaTien';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA TIENDA Y PROTIE---




---LLAVE FORANEA CON LA TABLA PRODUCTOS Y PROTIE---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Productos_ProTie_ClaProd')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Productos' AND c.COLUMN_NAME = 'ClaProd' AND d.TABLE_NAME = 'ProTie' AND e.COLUMN_NAME = 'ClaProd'))
	BEGIN
	ALTER TABLE ProTie ADD CONSTRAINT FK_Productos_ProTie_ClaProd FOREIGN KEY (ClaProd) 
	REFERENCES Productos (ClaProd) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Productos_ProTie_ClaProd';
	EXEC SP_Msg 'Se creo un constraint FK_Productos_ProTie_ClaProd con las tablas Productos y ProTie';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Productos y ProTie';
	  PRINT 'La tabla ProTie ya tiene una llave foranea con la tabla Productos';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Productos_ProTie_ClaProd';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Productos_ProTie_ClaProd';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA PRODUCTOS Y PROTIE---




---LLAVE FORANEA CON LA TABLA TIENDA Y PROVEEDORES---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Tiendas_Proveedores_ClaTien')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Tiendas' AND c.COLUMN_NAME = 'ClaTien' AND d.TABLE_NAME = 'Proveedores' AND e.COLUMN_NAME = 'ClaTien'))
	BEGIN
	ALTER TABLE Proveedores ADD CONSTRAINT FK_Tiendas_Proveedores_ClaTien FOREIGN KEY (ClaTien) 
	REFERENCES Tiendas (ClaTien) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Tiendas_Proveedores_ClaTien';
	EXEC SP_Msg 'Se creo un constraint FK_Tiendas_Proveedores_ClaTien con las tablas Tiendas y Proveedores';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Tiendas y Proveedores';
	  PRINT 'La tabla Tiendas ya tiene una llave foranea con la tabla Proveedores';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Tiendas_Proveedores_ClaTien';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Tiendas_Proveedores_ClaTien';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA TIENDA Y PROPRO---




---LLAVE FORANEA CON LA TABLA TIENDA Y UBICACIONES---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Tiendas_Ubicaciones_ClaTien')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Tiendas' AND c.COLUMN_NAME = 'ClaTien' AND d.TABLE_NAME = 'Ubicaciones' AND e.COLUMN_NAME = 'ClaTien'))
	BEGIN
	ALTER TABLE Ubicaciones ADD CONSTRAINT FK_Tiendas_Ubicaciones_ClaTien FOREIGN KEY (ClaTien) 
	REFERENCES Tiendas (ClaTien) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Tiendas_Ubicaciones_ClaTien';
	EXEC SP_Msg 'Se creo un constraint FK_Tiendas_Ubicaciones_ClaTien con las tablas Tiendas y Ubicaciones';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Tiendas y Ubicaciones';
	  PRINT 'La tabla Tiendas ya tiene una llave foranea con la abla Ubicaciones';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Tiendas_Ubicaciones_ClaTien';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Tiendas_Ubicaciones_ClaTien';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA TIENDA Y PROPRO---



---LLAVE FORANEA CON LA TABLA TIENDA Y EMPLEADOS---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Tiendas_Empleados_ClaTien')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Tiendas' AND c.COLUMN_NAME = 'ClaTien' AND d.TABLE_NAME = 'Empleados' AND e.COLUMN_NAME = 'ClaTien'))
	BEGIN
	ALTER TABLE Empleados ADD CONSTRAINT FK_Tiendas_Empleados_ClaTien FOREIGN KEY (ClaTien) 
	REFERENCES Tiendas (ClaTien) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Tiendas_Empleados_ClaTien';
	EXEC SP_Msg 'Se creo un constraint FK_Tiendas_Empleados_ClaTien con las tablas Tiendas y Empleados';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Tiendas y Empleados';
	  PRINT 'La tabla Tiendas ya tiene una llave foranea con la abla Empleados';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Tiendas_Empleados_ClaTien';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Tiendas_Empleados_ClaTien';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA UBICACIONES Y PRODUCTOS---



---LLAVE FORANEA CON LA TABLA EMPLEADOS Y CUENTAS---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Empleados_Cuentas_ClaEmpl')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Empleados' AND c.COLUMN_NAME = 'ClaEmpl' AND d.TABLE_NAME = 'Cuentas' AND e.COLUMN_NAME = 'ClaEmpl'))
	BEGIN
	ALTER TABLE Cuentas ADD CONSTRAINT FK_Empleados_Cuentas_ClaEmpl FOREIGN KEY (ClaEmpl) 
	REFERENCES Empleados (ClaEmpl) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Empleados_Cuentas_ClaEmpl';
	EXEC SP_Msg 'Se creo un constraint FK_Empleados_Cuentas_ClaEmpl con las tablas Empleados y Cuentas';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Empleados y Cuentas';
	  PRINT 'La tabla Cuentas ya tiene una llave foranea con la abla Empleados';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Empleados_Cuentas_ClaEmpl';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Empleados_Cuentas_ClaEmpl';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA EMPLEADOS Y CUENTAS---






---LLAVE FORANEA CON LA TABLA EMPLEADOS Y VENTAS---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Empleados_Ventas_ClaEmpl')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Empleados' AND c.COLUMN_NAME = 'ClaEmpl' AND d.TABLE_NAME = 'Ventas' AND e.COLUMN_NAME = 'ClaEmpl'))
	BEGIN
	ALTER TABLE Ventas ADD CONSTRAINT FK_Empleados_Ventas_ClaEmpl FOREIGN KEY (ClaEmpl) 
	REFERENCES Empleados (ClaEmpl) ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Empleados_Ventas_ClaEmpl';
	EXEC SP_Msg 'Se creo un constraint FK_Empleados_Ventas_ClaEmpl con las tablas Empleados y Ventas';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Empleados y Ventas';
	  PRINT 'La tabla Ventas ya tiene una llave foranea con la tabla Empleados';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Empleados_Ventas_ClaEmpl';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Empleados_Ventas_ClaEmpl';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA EMPLEADOS Y VENTAS---



---LLAVE FORANEA CON LA TABLA CLIENTES Y VENTAS---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Clientes_Ventas_ClaClie')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Clientes' AND c.COLUMN_NAME = 'ClaClie' AND d.TABLE_NAME = 'Ventas' AND e.COLUMN_NAME = 'ClaClie'))
	BEGIN
	ALTER TABLE Ventas ADD CONSTRAINT FK_Clientes_Ventas_ClaClie FOREIGN KEY (ClaClie) 
	REFERENCES Clientes (ClaClie)  ON UPDATE CASCADE ON DELETE CASCADE; 
	PRINT 'Se creo contraint FK_Clientes_Ventas_ClaClie';
	EXEC SP_Msg 'Se creo un constraint FK_Clientes_Ventas_ClaClie con las tablas Clientes y Ventas';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Clientes y Ventas';
	  PRINT 'La tabla Ventas ya tiene una llave foranea con la tabla Clientes';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Clientes_Ventas_ClaClie';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Clientes_Ventas_ClaClie';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA CLIENTES Y VENTAS---





---LLAVE FORANEA CON LA TABLA PRODUCTOS Y Tickts---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Productos_Tickts_ClaProd')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Productos' AND c.COLUMN_NAME = 'ClaProd' AND d.TABLE_NAME = 'Tickets' AND e.COLUMN_NAME = 'ClaProd'))
	BEGIN
	ALTER TABLE Tickets ADD CONSTRAINT FK_Productos_Tickts_ClaProd FOREIGN KEY (ClaProd) 
	REFERENCES Productos (ClaProd)  ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Productos_Tickts_ClaProd';
	EXEC SP_Msg 'Se creo un constraint FK_Productos_Tickts_ClaProd con las tablas Productos y Tickts';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Productos y Tickts';
	  PRINT 'La tabla Tickts ya tiene una llave foranea con la tabla Productos';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Productos_Tickts_ClaProd';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Productos_Tickts_ClaProd';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA PRODUCTOS Y VENTAS---




---LLAVE FORANEA CON LA TABLA Ventas Y Tickts---
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_Ventas_Tickts_ClaVent')
  BEGIN
    IF NOT EXISTS(SELECT  a.CONSTRAINT_NAME AS FKConstraintName, b.TABLE_NAME AS FKTable, 
	                 c.COLUMN_NAME AS FKColumn, d.TABLE_NAME AS PKTable, e.COLUMN_NAME AS PKColumn
       FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS a
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS b ON a.CONSTRAINT_NAME = b.CONSTRAINT_NAME
       INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS d ON a.UNIQUE_CONSTRAINT_NAME = d.CONSTRAINT_NAME
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON a.CONSTRAINT_NAME = c.CONSTRAINT_NAME
	INNER JOIN (SELECT f.TABLE_NAME, g.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS f
	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE g ON f.CONSTRAINT_NAME = g.CONSTRAINT_NAME
	WHERE f.CONSTRAINT_TYPE = 'PRIMARY KEY') e ON e.TABLE_NAME = d.TABLE_NAME
	AND (b.TABLE_NAME = 'Ventas' AND c.COLUMN_NAME = 'ClaVent' AND d.TABLE_NAME = 'Tickets' AND e.COLUMN_NAME = 'ClaVents'))
	BEGIN
	ALTER TABLE Tickets ADD CONSTRAINT FK_Ventas_Tickts_ClaVent FOREIGN KEY (ClaVent) 
	REFERENCES Ventas (ClaVent)  ON UPDATE CASCADE ON DELETE CASCADE;
	PRINT 'Se creo contraint FK_Ventas_Tickts_ClaVent';
	EXEC SP_Msg 'Se creo un constraint FK_Ventas_Tickts_ClaVent con las tablas Ventas y Tickts';
	END
    ELSE
	 BEGIN
	  EXEC SP_Msg 'Se intento crear una llave foranea con las tablas Ventas y Tickts';
	  PRINT 'La tabla Tickts ya tiene una llave foranea con la tabla Ventas';
	 END
   END
ELSE
	BEGIN
	  EXEC SP_Msg 'Se intento crear un cosntraint con el nombre FK_Ventas_Tickts_ClaVent';
	  PRINT 'Ya existe un cosntraint con el nombre FK_Ventas_Tickts_ClaVent';
	 END
GO
---FIN DE LA LLAVE FORANEA CON LA TABLA PRODUCTOS Y VENTAS---




-----------FIN CREACION LLAVES FORANEAS-----------





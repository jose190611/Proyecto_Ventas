using System;
using System.Collections.Generic;
using System.Text;
//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código que permitirá la conexión a la base de datos
// Fecha: 06/ Septiembre / 2021           Hora: 20:39 hrs
//---------------------------------------------------------------------------------------------------------------------
namespace AccesoBD.Conexion
{
    public class CadenaConexion
    {
        public static string CadenaCon
        {
            get
            {
                return @"DATA SOURCE =DESKTOP-GC9FD1T; PERSIST SECURITY INFO = True;
                         Initial Catalog = PuntoVenta; USER ID = sa; PASSWORD = Batcontry07*;";
            }
        }
    }
}
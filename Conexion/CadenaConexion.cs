﻿using System;
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
                return @"DATA SOURCE =DESKTOP-J7MR0VK; PERSIST SECURITY INFO = True;
                         Initial Catalog = PuntoVenta; USER ID = josereyes; PASSWORD = 990611;";
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Text;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código modelo de la tabla Proveedores
// Fecha: 06/ Septiembre / 2021           Hora: 20:39 hrs
//---------------------------------------------------------------------------------------------------------------------

namespace AccesoBD.Modelos
{
    public class ModeloProveedores
    {
        public string ClaProv { get; set; }
        public string Nombre { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public string Direccion { get; set; }
    }
}

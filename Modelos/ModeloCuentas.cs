using System;
using System.Collections.Generic;
using System.Text;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código modelo de la tabla Cuentas
// Fecha: 06/ Septiembre / 2021           Hora: 20:39 hrs
//---------------------------------------------------------------------------------------------------------------------

namespace AccesoBD.Modelos
{
    public class ModeloCuentas
    {
        public string ClaUsua { get; set; }
        public string Usuario { get; set; } //Según mapeo de SQL a C# el tipo Varbinary se usa con un Byte[]
        public string Clave { get; set; }
        public string ClaEmpl { get; set; }
        public string Tipo { get; set; }
        public Boolean Activo { get; set; }
        public Boolean Acceso { get; set; }

    }
}

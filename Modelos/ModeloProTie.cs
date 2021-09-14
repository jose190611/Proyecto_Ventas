using System;
using System.Collections.Generic;
using System.Text;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código modelo de la tabla ProTie
// Fecha: 06/ Septiembre / 2021           Hora: 20:39 hrs
//---------------------------------------------------------------------------------------------------------------------

namespace AccesoBD.Modelos
{
    public class ModeloProTie
    {
        public string ClaProd { get; set; }
        public string ClaTien { get; set; }
        public Decimal Costo { get; set; }
        public Decimal Precio { get; set; }

    }
}

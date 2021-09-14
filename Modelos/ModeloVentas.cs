using System;
using System.Collections.Generic;
using System.Text;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código modelo de la tabla Ventas
// Fecha: 06/ Septiembre / 2021           Hora: 20:39 hrs
//---------------------------------------------------------------------------------------------------------------------
namespace AccesoBD.Modelos
{
    public class ModeloVentas
    {
        public Int64 ClaVent { get; set; }
        public string ClaEmpl { get; set; }
        public string ClaClie { get; set; }
        public DateTime Fecha { get; set; }
        public Decimal Total { get; set; }

    }
}

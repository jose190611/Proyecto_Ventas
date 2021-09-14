using System;
using System.Collections.Generic;
using System.Text;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código modelo de la tabla Tickets
// Fecha: 06/ Septiembre / 2021           Hora: 20:39 hrs
//---------------------------------------------------------------------------------------------------------------------

namespace AccesoBD.Modelos
{
    public class ModeloTickets
    {
        public string ClaProd { get; set; }
        public Int64 ClaVent { get; set; }
        public int Cantidad { get; set; }
        public Decimal Precio { get; set; }
        public Decimal Importe { get; set; }
    }
}

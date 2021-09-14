using System;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código modelo de la tabla Tiendas
// Fecha: 06/ Septiembre / 2021           Hora: 20:39 hrs
//---------------------------------------------------------------------------------------------------------------------

namespace AccesoBD.Modelos
{
    public class ModeloTiendas
    {
        public string ClaTien { get; set; }
        public string NuevaClave { get; set; }
        public string Usuario { get; set; }
        public string Nombre { get; set; }
        public byte[] Imagen { get; set; }
    }

    public class ModeloBusquedaTienda
    {
        public string ClaTien { get; set; }
        public string Nombre { get; set; }
    }
}

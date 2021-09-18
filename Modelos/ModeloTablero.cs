using System;
using System.Collections.Generic;
using System.Text;

namespace AccesoBD.Modelos
{
    public class ModeloTablero
    {
        public string Usuario { get; set; }
        public string Tipo { get; set; }
        public string Nombre { get; set; }
        public Byte[] Imagen { get; set; }
    }
}

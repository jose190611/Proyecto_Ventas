using System;
using System.Collections.Generic;
using System.Text;
using AccesoBD.Modelos;
using AccesoBD.Acceso;

namespace Negocio.BL
{
    public class TableroBL
    {
        public List<ModeloTablero> ConsultaTablero(string usuario)
        {
            ModeloTablero tablero = new ModeloTablero();
            Tablero tab = new Tablero();

            tablero.Usuario = usuario;

            var lista =tab.Consultar(tablero);
            return lista;

        }
    }
}

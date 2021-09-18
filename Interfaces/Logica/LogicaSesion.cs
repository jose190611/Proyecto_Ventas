using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Negocio.BL;

namespace Interfaces.Logica
{
   public class LogicaSesion
    {
        public string IniciarNuevaSesion(TextBox usuario, TextBox contra)
        {
            Sesiones se = new Sesiones();
            var x =se.NuevaSesion(usuario.Text,contra.Text);
            return x;
        }

        public string CerrarSesiones(string usuario)
        {
            Sesiones se = new Sesiones();
            var x = se.CerrarSesion(usuario);
            return x;
        }
    }
}

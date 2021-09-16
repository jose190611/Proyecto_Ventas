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
        public void IniciarNuevaSesion(TextBox usuario, TextBox contra)
        {
            Sesiones se = new Sesiones();
            se.NuevaSesion(usuario.Text,contra.Text);
        }
    }
}

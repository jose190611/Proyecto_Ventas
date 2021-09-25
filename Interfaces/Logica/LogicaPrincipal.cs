using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Negocio.BL;
using FontAwesome.Sharp;

namespace Interfaces.Logica
{
    public class LogicaPrincipal
    {
        public void ConsultaUsuarioTablero(TextBox usuario, Label user, Label Tipo, Label Nombre, PictureBox Img)
        {
            var i = Encoding.ASCII.GetBytes("");
            TableroBL tab = new TableroBL();
            var lista = tab.ConsultaTablero(usuario.Text);
            foreach (var x in lista)
            {
                user.Text = x.Usuario;
                Tipo.Text = x.Tipo;
                Nombre.Text = x.Nombre;
                //i = x.Imagen;
            }
            
        }

        public void ReducirMenu(IconButton b, Panel p, Timer t)
        {
            while (t.Enabled)//Ciclo iterativo que funcionará mientras el timer esté activo
            {
                p.Width -= 6;//Por cada tick del timer se reducirá en 1 el largo del panel
                if (p.Width == 80)// cuando llegue a 50 hará lo siguiente
                {
                    p.Width = 80;
                    b.IconChar = IconChar.AngleDoubleRight;//Cambiar ícono del botón
                    b.IconColor = Color.DarkBlue;
                    b.BringToFront();
                    b.Location = new Point(10,6);//Nueva posicion del Botón menu
                    t.Enabled = false;//Deshabilitar el timer
                }                  
            }
        }

        public void AmpliarMenu(IconButton b , Panel p, Timer t)
        {
            while(t.Enabled)//Ciclo iterativo que funcionará mientras el timer esté activo
            {
                p.Width += 6;//Por cada tick del timer el largo se sumara en 1
                if (p.Width == 200)// Cuando llegue a 200 px hará lo siguiente
                {
                    p.Width = 200;
                    b.IconChar = IconChar.AngleDoubleLeft;//Cambiar ícono del boton menu
                    b.IconColor = Color.DarkBlue;
                    b.BringToFront();
                    b.Location = new Point(10, 6);//Nueva posición del botón
                    t.Enabled = false;//Deshabilitar el timer
                }
            }
        }
    }
}

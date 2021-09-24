using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Interfaces.Logica
{
    public class Formularios
    {
        public Form FormularioActivo = null;
        public void AbrirFormularioHijo(Form formHijo,Panel contenedor)
        {
            if(FormularioActivo != null)
            {
                FormularioActivo.Close();
            }
            FormularioActivo = formHijo;
            formHijo.TopLevel = false;
            formHijo.FormBorderStyle = FormBorderStyle.None;
            formHijo.Dock = DockStyle.Fill;
            contenedor.Controls.Add(formHijo);
            formHijo.BringToFront();
            formHijo.Show();
            
        }
            
    }
}

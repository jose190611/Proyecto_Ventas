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
        public bool EstaAbiertoElFormulario(string nombreForm)
        {
            Form existe = Application.OpenForms.OfType<Form>().Where(pre => pre.Name == nombreForm).SingleOrDefault<Form>();

            if (existe != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            
    }
}

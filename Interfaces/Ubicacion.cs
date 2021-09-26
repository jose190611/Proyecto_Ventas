using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Interfaces
{
    public partial class Ubicacion : Form
    {
        public Ubicacion()
        {
            InitializeComponent();
        }

        private void btnCerrarFormulario_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

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
    public partial class I_Sesion : Form
    {
        public I_Sesion()
        {
            InitializeComponent();
        }

        private void I_Sesion_Load(object sender, EventArgs e)
        {
            if (this.Visible == true)
            {
                txtusuario.ForeColor = Color.FromArgb(227, 217, 214);
                txtcontra.ForeColor = Color.FromArgb(227, 217, 214);
            }
        }

        private void txtusuario_TextChanged(object sender, EventArgs e)
        {
            txtusuario.ForeColor = Color.Black;
        }

        private void txtcontra_TextChanged(object sender, EventArgs e)
        {
            txtcontra.ForeColor = Color.Black;
        }
    }
}

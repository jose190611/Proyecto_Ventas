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
    public partial class Principal : Form
    {
        public Principal()
        {
            InitializeComponent();

            #region Adaptar_Formulario
            this.Location = Screen.PrimaryScreen.WorkingArea.Location;
            this.Size = Screen.PrimaryScreen.WorkingArea.Size;
            #endregion
        }

        private void Principal_Load(object sender, EventArgs e)
        {
            
        }
    }
}

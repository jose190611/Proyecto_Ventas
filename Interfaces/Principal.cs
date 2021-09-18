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
            this.FormBorderStyle = FormBorderStyle.None;
        }

        private void pbCerrar_MouseHover(object sender, EventArgs e)
        {
            pbCerrar.IconChar = FontAwesome.Sharp.IconChar.DoorOpen;
            pbCerrar.BackColor = Color.FromArgb(252, 27, 20);
            pbCerrar.IconColor = Color.White;
        }

        private void pbCerrar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void pbMaximizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
        }

        private void pbMinimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pbMinimizar_MouseHover(object sender, EventArgs e)
        {
            pbMinimizar.BackColor = Color.FromArgb(125, 249, 0);
            pbMinimizar.IconColor = Color.FromArgb(39, 137, 0);
        }

        private void pbMaximizar_MouseHover(object sender, EventArgs e)
        {
            pbMaximizar.IconColor = Color.FromArgb(0,0,0);
            pbMaximizar.BackColor = Color.FromArgb(255, 241, 70);
        }

        private void pbCerrar_MouseLeave(object sender, EventArgs e)
        {
            pbCerrar.IconChar = FontAwesome.Sharp.IconChar.DoorClosed;
            pbCerrar.BackColor = Color.Transparent;
            pbCerrar.IconColor = Color.FromArgb(236, 5, 1);
        }

        private void pbMaximizar_MouseLeave(object sender, EventArgs e)
        {
            pbMaximizar.BackColor = Color.Transparent;
            pbMaximizar.IconColor = Color.FromArgb(255, 206, 6);
        }

        private void pbMinimizar_MouseLeave(object sender, EventArgs e)
        {
            pbMinimizar.BackColor = Color.Transparent;
            pbMinimizar.IconColor = Color.FromArgb(51, 241, 5);
        }
    }
}

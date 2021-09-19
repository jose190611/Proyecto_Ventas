using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Interfaces.Logica;

namespace Interfaces
{
    public partial class Principal : Form
    {
<<<<<<< HEAD

=======
        #region MoverForm
        //--------------------Movimiento de formulario sin bordes-----------------------------------------
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);
        //------------------------------------------------------------------------------------------------
        #endregion 
>>>>>>> master
        public Principal()
        {
            InitializeComponent();

            #region Adaptar_Formulario
            this.Location = Screen.PrimaryScreen.WorkingArea.Location;
            this.Size = new Size(Screen.PrimaryScreen.WorkingArea.Width,Screen.PrimaryScreen.WorkingArea.Height);
            #endregion
            this.FormBorderStyle = FormBorderStyle.None;
            this.Dock = DockStyle.Fill;
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
            var x = MessageBox.Show("¿Estás seguro de cerrar el programa?", "ADVERTENCIA", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information);
            if (x == DialogResult.Yes)
            {
                MessageBox.Show("Estamos cerrando tu sesión: " + "ADMI", "Cerrar Sesión", MessageBoxButtons.OK, MessageBoxIcon.Information);
                LogicaSesion se = new LogicaSesion();
                se.CerrarSesiones("ADMI");
                Application.Exit();
            }else if (x == DialogResult.No || x == DialogResult.Cancel)
            {
                MessageBox.Show("No se cerro" + "ADMI", "Cerrar Sesión", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

        }

        private void pbMaximizar_Click(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Maximized)
            {
                this.WindowState = FormWindowState.Normal;
                pbMaximizar.IconChar = FontAwesome.Sharp.IconChar.Clone;

            }else if (WindowState != FormWindowState.Maximized)
            {
                var workingArea = Screen.FromHandle(Handle).WorkingArea;
                MaximizedBounds = new Rectangle(0, 0, workingArea.Width, workingArea.Height);
                this.WindowState = FormWindowState.Maximized;
                pbMaximizar.IconChar = FontAwesome.Sharp.IconChar.CompressAlt;

            }

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

<<<<<<< HEAD
    }
=======
        private void btnmenu_Click(object sender, EventArgs e)
        {
            timermenu.Start();
        }

        private void timermenu_Tick(object sender, EventArgs e)
        {

            if (panelmenu.Width == 200)
            {
                LogicaPrincipal p = new LogicaPrincipal();
                p.ReducirMenu(btnmenu, panelmenu, timermenu);

            }
            else if (panelmenu.Width == 50)
            {
                LogicaPrincipal p = new LogicaPrincipal();
                p.AmpliarMenu(btnmenu, panelmenu,timermenu);
            }
        }

        #region RevisarEsteCodigo
        private void tiempoMenu_Tick(object sender, EventArgs e)
        {
            LogicaPrincipal p = new LogicaPrincipal();
            p.ReducirMenu(btnmenu, panelmenu, timermenu);
            tiempoMenu.Stop();
        }

        private void panelmenu_MouseLeave(object sender, EventArgs e)
        {
            if (panelmenu.Width == 200)
                tiempoMenu.Enabled = true;
        }
        #endregion

        private void panelHerramientas_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
    }    
>>>>>>> master
}

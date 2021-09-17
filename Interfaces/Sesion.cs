using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using Interfaces.Logica;

namespace Interfaces
{
   
    public partial class Sesion : Form
    {
        #region MoverForm
        //--------------------Movimiento de formulario sin bordes-----------------------------------------
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);
        //------------------------------------------------------------------------------------------------
        #endregion 

        //-------------------Codigo para redondear bordes en formularios-----------------------------------
        [DllImport("Gdi32.dll", EntryPoint = "CreateRoundRectRgn")]
        
        private static extern IntPtr CreateRoundRectRgn
            (
            int izquierda,
            int top,
            int derecha,
            int fondo,
            int anchoelipse,
            int altoelipse
            );
        //------------------------------------------------------------------------------------------------
        public Sesion()
        {
            InitializeComponent();
            this.FormBorderStyle = FormBorderStyle.None;
            this.StartPosition = FormStartPosition.CenterScreen;
            Region = Region.FromHrgn(CreateRoundRectRgn(0,0,Width,Height,25,25)); //Linea que llama al método que redondea borde
        }

        private void txtUsuario_Enter(object sender, EventArgs e)
        {
            if (txtUsuario.Text == "Usuario")
            {
                txtUsuario.Text = "";
                txtUsuario.ForeColor = Color.Black;
            }

        }

        private void txtUsuario_Leave(object sender, EventArgs e)
        {
            if (txtUsuario.Text == "")
            {
                txtUsuario.Text = "Usuario";
                txtUsuario.ForeColor = Color.White;
            }
        }

        private void txtContra_Enter(object sender, EventArgs e)
        {
            if (txtContra.Text == "Contraseña")
            {
                txtContra.Text = "";
                txtContra.ForeColor = Color.Black;
            }
        }

        private void txtContra_Leave(object sender, EventArgs e)
        {
            if (txtContra.Text == "")
            {
                txtContra.Text = "Contraseña";
                txtContra.PasswordChar = '*';
                txtContra.ForeColor = Color.White;
            }
        }

        private void btnContinuar_Click(object sender, EventArgs e)
        {
            LogicaSesion lg = new LogicaSesion();
            string y = lg.IniciarNuevaSesion(txtUsuario, txtContra);
            if (y.Contains("invalida"))
            {
                MessageBox.Show(y,"¡ E r r o r !", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }else if (y.Contains("iniciada"))
            {
                MessageBox.Show(y, "¡ M e n s a j e !", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                lg.CerrarSesiones(txtUsuario);
            }
            else
            {
                this.Hide();
                Principal p = new Principal();
                p.Show();                
            }
        }

        private void btnContinuar_MouseHover(object sender, EventArgs e)
        {
            btnContinuar.Size = new Size(255,55);
            btnContinuar.Location = new Point(55,310); 
        }

        private void btnContinuar_MouseLeave(object sender, EventArgs e)
        {
            btnContinuar.Size = new Size(220, 45);
            btnContinuar.Location = new Point(70, 320);
        }

        private void btnContinuar_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyData == Keys.Enter)
            {
                LogicaSesion lg = new LogicaSesion();
                string y = lg.IniciarNuevaSesion(txtUsuario, txtContra);
                if (y.Contains("invalida"))
                {
                    MessageBox.Show(y, "¡ E r r o r !", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else if (y.Contains("iniciada"))
                {
                    MessageBox.Show(y, "¡ M e n s a j e !", MessageBoxButtons.OK, MessageBoxIcon.Warning);                    
                }
                else
                {
                    Principal p = new Principal();
                    p.Show();
                    this.Close();
                }
            }
        }

        private void Sesion_Load(object sender, EventArgs e)
        {

        }

        private void lblejemplo_Click(object sender, EventArgs e)
        {

        }

        private void panelMovimiento_Paint(object sender, PaintEventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
    }
}

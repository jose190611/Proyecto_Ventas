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
        public Form FormularioActivo = null;
        #region MoverForm
        //--------------------Movimiento de formulario sin bordes-----------------------------------------
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);
        //------------------------------------------------------------------------------------------------
        #endregion 
        public Principal()
        {
            InitializeComponent();

            #region Adaptar_Formulario
            this.Location = Screen.PrimaryScreen.WorkingArea.Location;
            this.Size = new Size(Screen.PrimaryScreen.WorkingArea.Width,Screen.PrimaryScreen.WorkingArea.Height);
            #endregion
            this.FormBorderStyle = FormBorderStyle.None;
            this.Dock = DockStyle.Fill;
            var workingArea = Screen.FromHandle(Handle).WorkingArea;
            MaximizedBounds = new Rectangle(0, 0, workingArea.Width, workingArea.Height);
            this.WindowState = FormWindowState.Maximized;
            pbMaximizar.IconChar = FontAwesome.Sharp.IconChar.CompressAlt;
        }

        private void Principal_Load(object sender, EventArgs e)
        {
            btnmenu.BackColor = Color.Transparent;
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

        private void btnmenu_Click(object sender, EventArgs e)
        {
            if(tiempoMenu.Enabled == true)
            {
                btnmenu.Enabled = false;                
            }
            else
            {
                timermenu.Start();
            }
        }

        private void timermenu_Tick(object sender, EventArgs e)
        {

            if (panelmenu.Width == 200)
            {
                LogicaPrincipal p = new LogicaPrincipal();
                p.ReducirMenu(btnmenu, panelmenu, timermenu);
                btnTienda.Text = "";
                btnUbicacion.Text = "";
                btnProveedores.Text = "";
                btnEmpleados.Text = "";
                btnClientes.Text = "";
                btnProductos.Text = "";
                btnVentas.Text = "";

            }
            else if (panelmenu.Width == 80)
            {
                LogicaPrincipal p = new LogicaPrincipal();
                p.AmpliarMenu(btnmenu, panelmenu,timermenu);
                btnTienda.Text = "            Tienda";
                btnUbicacion.Text = "                 Ubicación";
                btnProveedores.Text = "                    Proveedores";
                btnEmpleados.Text = "                   Empleados";
                btnClientes.Text = "             Clientes";
                btnProductos.Text = "                Productos";
                btnVentas.Text = "            Ventas";
            }
        }

        #region RevisarEsteCodigo
        private void tiempoMenu_Tick(object sender, EventArgs e)
        {
            btnmenu.Enabled = true;
            timermenu.Enabled = true;
            LogicaPrincipal p = new LogicaPrincipal();
            p.ReducirMenu(btnmenu, panelmenu, timermenu);
            btnTienda.Text = "";
            btnUbicacion.Text = "";
            btnProveedores.Text = "";
            btnEmpleados.Text = "";
            btnClientes.Text = "";
            btnProductos.Text = "";
            btnVentas.Text = "";
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

        private void timerHora_Tick(object sender, EventArgs e)
        {
            lblHora.Text = DateTime.Now.ToString("HH:mm:ss");
        }

        private void timerFecha_Tick(object sender, EventArgs e)
        {
            lblFecha.Text = DateTime.Now.ToLongDateString();
        }

        private void lblFecha_Click(object sender, EventArgs e)
        {

        }

        private void btnTienda_Click(object sender, EventArgs e)
        {
            Formularios f = new Formularios();
            Tiendas t = new Tiendas();
            if (f.EstaAbiertoElFormulario("Tiendas") == true)
            {

            }
            else
            {
                AbrirFormularioHijo(t, panelContenedor);
            }
        }

        private void btnUbicacion_Click(object sender, EventArgs e)
        {
            Formularios f = new Formularios();
            Ubicacion u = new Ubicacion();
            if (f.EstaAbiertoElFormulario("Ubicacion") == true)
            {

            }
            else
            {
                AbrirFormularioHijo(u, panelContenedor);
            }
        }

        private void btnProveedores_Click(object sender, EventArgs e)
        {
            Formularios f = new Formularios();
            if (f.EstaAbiertoElFormulario("Proveedores") == true)
            {

            }
            else
            {
                AbrirFormularioHijo(new Proveedores(), panelContenedor);
            }
        }

        private void btnEmpleados_Click(object sender, EventArgs e)
        {
            Formularios f = new Formularios();
            if (f.EstaAbiertoElFormulario("Empleados") == true)
            {

            }
            else
            {
                AbrirFormularioHijo(new Empleados(), panelContenedor);
            }
        }
        #region FormularioHijo
        public void AbrirFormularioHijo(Form formHijo, Panel contenedor)
        {
            if (FormularioActivo != null)
            {
                FormularioActivo.Close();
            }
            FormularioActivo = formHijo;
            formHijo.TopLevel = false;
            formHijo.FormBorderStyle = FormBorderStyle.None;
            formHijo.Dock = DockStyle.Fill;
            contenedor.Controls.Add(formHijo);
            formHijo.BringToFront();
            //formHijo.SendToBack();
            formHijo.Show();
        }
        #endregion

        private void btnClientes_Click(object sender, EventArgs e)
        {
            Formularios f = new Formularios();
            if (f.EstaAbiertoElFormulario("Clientes") == true)
            {

            }
            else
            {
                AbrirFormularioHijo(new Clientes(), panelContenedor);
            }
        }

        private void btnProductos_Click(object sender, EventArgs e)
        {
            Formularios f = new Formularios();
            if (f.EstaAbiertoElFormulario("Productos") == true)
            {

            }
            else
            {
                AbrirFormularioHijo(new Productos(), panelContenedor);
            }
        }

        private void btnVentas_Click(object sender, EventArgs e)
        {
            Formularios f = new Formularios();
            if (f.EstaAbiertoElFormulario("Ventas") == true)
            {

            }
            else
            {
                AbrirFormularioHijo(new Ventas(), panelContenedor);
            }
        }
    }    
}

using Interfaces.Logica;
using Neogcio.BL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Interfaces
{
    public partial class Tiendas : Form
    {
        public Tiendas()
        {
            InitializeComponent();
            Bloquear();
            Cargar_Todos_categ();
        }

        private void Cargar_Todos_categ()
        {
            TiendaBL obj = new TiendaBL();
            DataTable dato = new DataTable();

            dato = obj.CargarTiendas();
            if (dato.Rows.Count > 0)
            {
                Lsv_Entradas.DataSource  = obj.CargarTiendas();
            }

        }


        private void btnCerrarFormulario_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BtnNuevo_Click(object sender, EventArgs e)
        {
            if (TbNombre.Text == "" | TbNombre.Text == "" | TbDireccion.Text =="" | TbTelefono.Text =="" | PtbImg.Image == null)
            {
                DividirCadenas cad = new DividirCadenas();
                string y = "LLena los espacios.";
                Avisos fa = new Avisos();
                fa.panelBarra.BackColor = Color.FromArgb(249, 172, 3);
                fa.lblBarra.Text = "¡A d v e r t e n c i a!";
                fa.lblMensaje.Text = cad.Dividir(y);
                var img = new Bitmap(Interfaces.Properties.Resources.advertencia);
                fa.pbIcono.Image = img;
                fa.panelContenedor.BackColor = Color.FromArgb(245, 231, 131);
                fa.ShowDialog();
            }
            else
            {
                TiendaBL T = new TiendaBL();
                MemoryStream MS = new MemoryStream();
                PtbImg.Image.Save(MS, System.Drawing.Imaging.ImageFormat.Png);
                byte[] im = MS.GetBuffer();
                string msg = T.NuevaTienda("ADMI", TbNombre.Text, TbDireccion.Text, TbTelefono.Text, im);

                DividirCadenas cad = new DividirCadenas();

                if (msg.Contains("Error"))
                {
                    Avisos fa = new Avisos();
                    fa.panelBarra.BackColor = Color.FromArgb(247, 0, 37);
                    fa.lblBarra.Text = "¡E r r o r!";
                    fa.lblMensaje.Text = cad.Dividir(msg);
                    var img = new Bitmap(Interfaces.Properties.Resources.error);
                    fa.pbIcono.Image = img;
                    fa.panelContenedor.BackColor = Color.FromArgb(245, 152, 131);
                    fa.ShowDialog();
                }
                else if (msg.Contains("guardado"))
                {
                    Avisos fa = new Avisos();
                    fa.panelBarra.BackColor = Color.FromArgb(0, 59, 70);
                    fa.lblBarra.Text = "¡Informativo!";
                    fa.lblMensaje.Text = cad.Dividir(msg);
                    var img = new Bitmap(Interfaces.Properties.Resources.informacion);
                    fa.pbIcono.Image = img;
                    fa.panelContenedor.BackColor = Color.FromArgb(102, 165, 173);
                    fa.ShowDialog();
                    Cargar_Todos_categ();
                    Limpiar();
                }
            }
        }

        private void Limpiar()
        {
            TbClave.Text = "";
            TbNombre.Text = "";
            TbDireccion.Text = "";
            TbTelefono.Text = "";
            PtbImg.Image = null;
            TbNombre.Focus();
        }

        private void Bloquear()
        {
            TbClave.Enabled = false;

        }

        private void btnCargarImagen_Click(object sender, EventArgs e)
        {
            OpenFileDialog FO = new OpenFileDialog();
            DialogResult RS = FO.ShowDialog();

            if (RS == DialogResult.OK)
            {
                PtbImg.Image = Image.FromFile(FO.FileName);
            }
        }

        private void BtnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }
    }
}

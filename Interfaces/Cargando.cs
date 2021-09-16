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
using System.Threading.Tasks;


namespace Interfaces
{
    public partial class Cargando : Form
    {
        #region Bordes    
        //--------------------------Codigo para redondear bordes de formularios----------------------------
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
        //-------------------------------------------------------------------------------------------------
        #endregion
        public Cargando()
        {
            InitializeComponent();
            this.FormBorderStyle = FormBorderStyle.None;
            this.StartPosition = FormStartPosition.CenterScreen;
            Region = Region.FromHrgn(CreateRoundRectRgn(0, 0, Width, Height, 15, 15));
            barraCircular.Value = 0;//Inicializar valor de la barra de progreso
        }

        private void Cargando_Load(object sender, EventArgs e)
        {

        }
    }
}

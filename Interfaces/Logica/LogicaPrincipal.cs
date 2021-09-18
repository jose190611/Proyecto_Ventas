using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Negocio.BL;

namespace Interfaces.Logica
{
    public class LogicaPrincipal
    {
        public void ConsultaUsuarioTablero(TextBox usuario, Label user, Label Tipo, Label Nombre, PictureBox Img)
        {
            TableroBL tab = new TableroBL();

            var x = tab.ConsultaTablero(usuario.Text);// Obtenemos la lista de la consulta
            user.Text = x.ElementAt(0).ToString();// Obtenemos primer elemento de la lista
            Tipo.Text = x.ElementAt(1).ToString(); // Segundo elemento
            Nombre.Text = x.ElementAt(2).ToString(); // Tercer elemento 
            var i = Encoding.ASCII.GetBytes(x.ElementAt(3).ToString()); // Cuarto elemento transformado a Bytes
            //----------Convertir arreglo de byte a imagen en picture box-----------------------
            byte[] imagen = i;
            Bitmap imagenes;
            using (MemoryStream memoria = new MemoryStream(imagen))
            {
                imagenes = new Bitmap(memoria);
            }
            //----------------------------------------------------------------------------------
            //-----> Insertar imagen al picture box
            Img.Image = imagenes;
            Img.BackgroundImageLayout = ImageLayout.Stretch;//Establecer el layout para visualizar imagen completa
        }
    }
}

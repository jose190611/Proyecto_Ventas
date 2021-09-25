using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Windows.Forms;
using AccesoBD.Acceso;
using AccesoBD.Modelos;

namespace Neogcio.BL
{
    public class TiendaBL
    {
        public string NuevaTienda (string usuario, string nombre, string direccion, string telefono, byte[] img)
        {
            ModeloTiendas tienda = new ModeloTiendas();
            Tienda t = new Tienda();

            tienda.Usuario = usuario;
            tienda.Nombre = nombre;
            tienda.Direccion = direccion;
            tienda.Telefono = telefono;
            tienda.Imagen = img;

            var msj = t.RegistrarTienda(tienda);
            return msj;
        }

        public string EliminacionTienda (string usuario, string clave, string nombre)
        {
            ModeloTiendas tienda = new ModeloTiendas();
            Tienda t = new Tienda();

            tienda.Usuario = usuario;
            tienda.ClaTien = clave;
            tienda.Nombre = nombre;

            var msj = t.EliminarTienda(tienda);
            return msj;
        }

        public string EdicionTienda(string usuario, string nueva, string clave, string nombre, string img)
        {
            ModeloTiendas tienda = new ModeloTiendas();
            Tienda t = new Tienda();

            tienda.Usuario = usuario;
            tienda.NuevaClave = nueva;
            tienda.ClaTien = clave;
            tienda.Nombre = nombre;
            tienda.Imagen = Encoding.ASCII.GetBytes(img);

            var msj = t.EditarTienda(tienda);
            return msj;
        }


        public DataTable CargarTiendas()
        {
            Tienda obj = new Tienda();
            return obj.ConsultaGeneral();
        }

        /*
        public List<ModeloBusquedaTienda> Consultar()
        {
            Tienda t = new Tienda();

            var lista = t.ConsultaGeneral();
            return lista;
        }
        */

        public List<ModeloTiendas> PersonalizarConsulta(string clave)
        {
            ModeloTiendas tienda = new ModeloTiendas();
            Tienda t = new Tienda();

            tienda.ClaTien = clave;

            var lista = t.ConsultaPersonalizada(tienda);
            return lista;
        }
    }
}

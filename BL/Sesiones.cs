using System;
using AccesoBD.Acceso;
using AccesoBD.Modelos;

namespace Negocio.BL
{
    public class Sesiones
    {
        public string NuevaSesion(string usuario, string clave)
        {
            InicioSesion s = new InicioSesion();
            ModeloCuentas c = new ModeloCuentas();

            c.Usuario = usuario;
            c.Clave = clave;

            var msj = s.IngresarSesion(c);
            return msj;
        }

        public string CerrarSesion (string usuario)
        {
            InicioSesion s = new InicioSesion();
            ModeloCuentas c = new ModeloCuentas();

            c.Usuario = usuario;

            var msj = s.CerrarSesion(c);
            return msj;
        }
    }
}

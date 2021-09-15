using Microsoft.VisualStudio.TestTools.UnitTesting;
using AccesoBD.Acceso;
using System;
using System.Collections.Generic;
using System.Text;
using AccesoBD.Modelos;

namespace AccesoBD.Acceso.Tests
{
    [TestClass()]
    public class InicioSesionTests
    {
        [TestMethod()]
        public void IngresarSesionTest()
        {
            ModeloCuentas c = new ModeloCuentas();
            InicioSesion i = new InicioSesion();

            c.Usuario = "ADMI";
            c.Clave = "ADMI";

            string x = i.IngresarSesion(c);
        }

        [TestMethod()]
        public void CerrarSesionTest()
        {
            ModeloCuentas c = new ModeloCuentas();
            InicioSesion i = new InicioSesion();

            c.Usuario = "ADMI";

            string x = i.CerrarSesion(c);
        }
    }
}
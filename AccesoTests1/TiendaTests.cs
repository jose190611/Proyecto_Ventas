using Microsoft.VisualStudio.TestTools.UnitTesting;
using AccesoBD.Acceso;
using System;
using System.Collections.Generic;
using System.Text;
using AccesoBD.Modelos;

namespace AccesoBD.Acceso.Tests
{
    [TestClass()]
    public class TiendaTests
    {
        [TestMethod()]
        public void RegistrarTiendaTest()
        {
            ModeloTiendas t = new ModeloTiendas();
            Tienda ti = new Tienda();

            t.Usuario = "ADMI";
            t.Nombre = "Abarrotes";
            t.Imagen = Encoding.ASCII.GetBytes("Null");

            string x = ti.RegistrarTienda(t);
        }

        [TestMethod()]
        public void EliminarTiendaTest()
        {
            ModeloTiendas t = new ModeloTiendas();
            Tienda ti = new Tienda();

            t.Usuario = "ADMI";
            t.ClaTien = "Prueba";
            t.Nombre = "Abarrotes";

            string x = ti.RegistrarTienda(t);
        }

        [TestMethod()]
        public void EditarTiendaTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void ConsultaGeneralTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void ConsultaPersonalizadaTest()
        {
            Assert.Fail();
        }
    }
}
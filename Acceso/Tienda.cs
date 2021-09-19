using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using AccesoBD.Modelos;
using AccesoBD.Conexion;
using System.Runtime.InteropServices;
using System.IO;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código CRUD Tienda para transacción de datos a la BD
// Fecha: 08/ Septiembre / 2021           Hora: 16:09 hrs
//---------------------------------------------------------------------------------------------------------------------


namespace AccesoBD.Acceso
{
    public class Tienda
    {
        //---------------------------Método para registro de nueva tienda-----------------------------------
        public string RegistrarTienda(ModeloTiendas tienda)
        {
            string procedimiento = "SP_Insertar_Tiendas";
            string mensaje = "";

            try
            {
                using (SqlConnection conex = new SqlConnection(CadenaConexion.CadenaCon))
                {
                    if (conex.State == ConnectionState.Closed)
                    {
                        conex.Open();
                    }

                    using (SqlCommand comando = new SqlCommand())
                    {
                        comando.Connection = conex;
                        comando.CommandText = procedimiento;
                        comando.CommandType = CommandType.StoredProcedure;

                        comando.Parameters.Add("@Usuario", SqlDbType.VarChar);
                        comando.Parameters["@Usuario"].Value = tienda.Usuario;
                        comando.Parameters.Add("@Nombre", SqlDbType.VarChar);
                        comando.Parameters["@Nombre"].Value = tienda.Nombre;
                        comando.Parameters.Add("@Img", SqlDbType.Image);
                        comando.Parameters["@Img"].Value = tienda.Imagen;
                        comando.Parameters.Add("@Salida", SqlDbType.VarChar, 1000).Direction = ParameterDirection.Output;
                        comando.ExecuteNonQuery();
                        mensaje += comando.Parameters["@Salida"].Value.ToString();
                        return mensaje;
                    }
                }

            }
            catch (Exception ex)
            {
                mensaje += "¡Ocurrió un error:\n!" + ex.Message;
                return mensaje;
            }
        }

        //--------------------------------------Método de eliminación de tienda-------------------------------
        public string EliminarTienda(ModeloTiendas tienda)
        {
            string procedimiento = "Sp_Eliminar_Tienda";
            string mensaje = "";

            try
            {
                using (SqlConnection conex = new SqlConnection(CadenaConexion.CadenaCon))
                {
                    if (conex.State == ConnectionState.Closed)
                    {
                        conex.Open();
                    }

                    using (SqlCommand comando = new SqlCommand())
                    {
                        comando.Connection = conex;
                        comando.CommandText = procedimiento;
                        comando.CommandType = CommandType.StoredProcedure;

                        comando.Parameters.Add("@Usuario", SqlDbType.VarChar);
                        comando.Parameters["@Usuario"].Value = tienda.Usuario;
                        comando.Parameters.Add("@Clave", SqlDbType.VarChar);
                        comando.Parameters["@Clave"].Value = tienda.ClaTien;
                        comando.Parameters.Add("@Nombre", SqlDbType.VarChar);
                        comando.Parameters["@Nombre"].Value = tienda.Nombre;
                        comando.Parameters.Add("@Salida", SqlDbType.VarChar, 1000).Direction = ParameterDirection.Output;
                        comando.ExecuteNonQuery();
                        mensaje += comando.Parameters["@Salida"].Value.ToString();
                        return mensaje;
                    }
                }
            }
            catch (Exception ex)
            {
                mensaje += "¡Ocurrió un error:\n" + ex.Message;
                return mensaje;
            }
        }

        //-----------------------------------Método para actualizar tiendas-----------------------------------
        public string EditarTienda(ModeloTiendas tienda)
        {
            string procedimiento = "SP_Editar_Tiendas";
            string mensaje = "";

            try
            {
                using (SqlConnection conex = new SqlConnection(CadenaConexion.CadenaCon))
                {
                    if (conex.State == ConnectionState.Closed)
                    {
                        conex.Open();
                    }

                    using (SqlCommand comando = new SqlCommand())
                    {
                        comando.Connection = conex;
                        comando.CommandText = procedimiento;
                        comando.CommandType = CommandType.StoredProcedure;

                        comando.Parameters.Add("@Usuario", SqlDbType.VarChar);
                        comando.Parameters["@Usuario"].Value = tienda.Usuario;
                        comando.Parameters.Add("@NewClave", SqlDbType.VarChar);
                        comando.Parameters["@NewClave"].Value = tienda.NuevaClave;
                        comando.Parameters.Add("@Clave", SqlDbType.VarChar);
                        comando.Parameters["@Clave"].Value = tienda.ClaTien;
                        comando.Parameters.Add("@Nombre", SqlDbType.VarChar);
                        comando.Parameters["@Nombre"].Value = tienda.Nombre;
                        comando.Parameters.Add("@Img", SqlDbType.Image);
                        comando.Parameters["@Img"].Value = tienda.Imagen;
                        comando.Parameters.Add("@Salida", SqlDbType.VarChar, 1000).Direction = ParameterDirection.Output;
                        comando.ExecuteNonQuery();
                        mensaje += comando.Parameters["@Salida"].Value.ToString();
                        return mensaje;
                    }
                }
            }
            catch (Exception ex)
            {
                mensaje += "¡Ocurrió un error:\n" + ex.Message;
                return mensaje;
            }
        }

        // Para iniciar con la búsqueda general se harán los siguientes métodos
        //Iniciamos con el método que permitirá hacer lectura fila por fila
        //Será un método encapsulado para evitar que pueda ser leido en otras clases
        private ModeloBusquedaTienda ObtenerUnaSolaFila(SqlDataReader lector)
        {
            ModeloBusquedaTienda mbt = new ModeloBusquedaTienda();

            if (!Convert.IsDBNull(lector["ClaTien"])) { mbt.ClaTien = lector["ClaTien"].ToString(); }
            else { mbt.ClaTien = "Null"; }
            if (!Convert.IsDBNull(lector["Nombre"])) { mbt.Nombre = lector["Nombre"].ToString(); }
            else { mbt.Nombre = "Null"; }

            return mbt;
        }

        // El siguiente método permite obtener las filas leídas y almacenarlas en una lista
        private List<ModeloBusquedaTienda> ObtenerFilas(SqlDataReader lector)
        {
            List<ModeloBusquedaTienda> lista = new List<ModeloBusquedaTienda>();
            if (lector != null)
            {
                while (lector.Read())
                {
                    lista.Add(ObtenerUnaSolaFila(lector));
                }
            }

            return lista;
        }

        //Finalmente el siguiente método retornará la lista con todos los campos llenos obtenidos de la BD
        public List<ModeloBusquedaTienda> ConsultaGeneral()
        {
            string procedimiento = "SP_Buscar_Tiendas";
            List<ModeloBusquedaTienda> lista = new List<ModeloBusquedaTienda>();

            try
            {
                using (SqlConnection conex = new SqlConnection(CadenaConexion.CadenaCon))
                {
                    if (conex.State == ConnectionState.Closed)
                        conex.Open();

                    using (SqlCommand comando = new SqlCommand())
                    {
                        comando.Connection = conex;
                        comando.CommandText = procedimiento;
                        comando.CommandType = CommandType.StoredProcedure;
                        using (SqlDataReader lector = comando.ExecuteReader())
                        {
                            lista = ObtenerFilas(lector);
                        }
                        return lista;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        //---------------------------Métodos para búsqueda personalizada--------------------------------------

        private ModeloTiendas ObtenerUnaFila(SqlDataReader lector)
        {
            
            ModeloTiendas tienda = new ModeloTiendas();

            if (!Convert.IsDBNull(lector["ClaTien"])) { tienda.ClaTien = lector["ClaTien"].ToString(); }
            else { tienda.ClaTien = "Null"; }
            if (!Convert.IsDBNull(lector["Nombre"])) { tienda.Nombre = lector["Nombre"].ToString(); }
            else { tienda.Nombre = "Null"; }
            if (!Convert.IsDBNull(lector["Img"])) { tienda.Imagen = Encoding.ASCII.GetBytes(lector["Img"].ToString()); }
            else { tienda.Imagen = Encoding.ASCII.GetBytes("Null"); }

            return tienda;
        }


        private List<ModeloTiendas> LeerFilas(SqlDataReader lector)
        {
            List<ModeloTiendas> lista = new List<ModeloTiendas>();
            if (lector != null)
            {
                while (lector.Read())
                {
                    lista.Add(ObtenerUnaFila(lector));
                }
            }

            return lista;
        }

        public List<ModeloTiendas> ConsultaPersonalizada(ModeloTiendas tienda)
        {
            string procedimiento = "SP_Buscar_Tienda";
            List<ModeloTiendas> lista = new List<ModeloTiendas>();

            try
            {
                using (SqlConnection conex = new SqlConnection(CadenaConexion.CadenaCon))
                {
                    if (conex.State == ConnectionState.Closed)
                        conex.Open();

                    using (SqlCommand comando = new SqlCommand())
                    {
                        comando.Connection = conex;
                        comando.CommandText = procedimiento;
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.Add("@Clave", SqlDbType.VarChar);
                        comando.Parameters["@Clave"].Value = tienda.ClaTien;
                        using (SqlDataReader lector = comando.ExecuteReader())
                        {
                            lista = LeerFilas(lector);
                        }
                        return lista;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
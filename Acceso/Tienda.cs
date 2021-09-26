﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using AccesoBD.Modelos;
using AccesoBD.Conexion;
using System.Runtime.InteropServices;
using System.IO;
using System.Windows.Forms;

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
                        comando.CommandTimeout = 20; //Daremos 20 segundos por Tiempo de respuesta
                        comando.CommandType = CommandType.StoredProcedure;

                        comando.Parameters.AddWithValue("@Usuario", tienda.Usuario);
                        comando.Parameters.AddWithValue("@Nombre", tienda.Nombre);
                        comando.Parameters.AddWithValue("@Direccion", tienda.Direccion);
                        comando.Parameters.AddWithValue("@Telefono", tienda.Telefono);
                        comando.Parameters.Add("@Img", SqlDbType.Image).Value = tienda.Imagen;
                        //Parametro de salida de la BD
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
        

        //Finalmente el siguiente método retornará la lista con todos los campos llenos obtenidos de la BD
        
        public DataTable ConsultaGeneral()
        {
            string procedimiento = "SP_Buscar_Tiendas";
            try
            {
                using (SqlConnection conex = new SqlConnection(CadenaConexion.CadenaCon))
                {
                    if (conex.State == ConnectionState.Closed)
                        conex.Open();
                    using (SqlCommand comando = new SqlCommand())
                    {
                        SqlDataAdapter da = new SqlDataAdapter(procedimiento, conex);//Nombre del SP a utilizar y la conexion
                        DataTable data = new DataTable();
                        da.Fill(data);
                        da = null;
                        return data;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
                return null;
            }
        }//Fin consultar tiendas

        //---------------------------Métodos para búsqueda personalizada--------------------------------------

    }
}
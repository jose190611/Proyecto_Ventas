using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using AccesoBD.Conexion;
using AccesoBD.Modelos;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código para iniciar y cerrar sesión
// Fecha: 06/ Septiembre / 2021           Hora: 22:14 hrs
//---------------------------------------------------------------------------------------------------------------------

namespace AccesoBD.Acceso
{
    public class InicioSesion
    {
        public string IngresarSesion (ModeloCuentas cuenta)
        {
            string procedimiento = "SP_Login";
            string mensaje = "";
            //int d = 0;
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
                        comando.Parameters["@Usuario"].Value = cuenta.Usuario;
                        comando.Parameters.Add("@Clave", SqlDbType.VarChar);
                        comando.Parameters["@Clave"].Value = cuenta.Clave;
                        comando.Parameters.Add("@Salida", SqlDbType.VarChar, 1000).Direction = ParameterDirection.Output;
                        comando.ExecuteNonQuery();
                        mensaje += comando.Parameters["@Salida"].Value.ToString();
                        return mensaje;
                    }
                }
            }catch (Exception ex)
            {
                return mensaje += "¡Ocurrió un error!: \n" + ex.Message;                
            }
        }

        public string CerrarSesion (ModeloCuentas cuenta)
        {
            string procedimiento = "SP_Cerrar_Login";
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
                        comando.Parameters["@Usuario"].Value = cuenta.Usuario;
                        comando.Parameters.Add("@Salida", SqlDbType.VarChar, 1000).Direction = ParameterDirection.Output;
                        comando.ExecuteNonQuery();
                        mensaje += comando.Parameters["@Salida"].Value.ToString();
                        return mensaje;
                    }
                }
            }
            catch (Exception ex)
            {
                return mensaje += "¡Ocurrió un error!: \n" + ex.Message;
            }
        }
    }
}

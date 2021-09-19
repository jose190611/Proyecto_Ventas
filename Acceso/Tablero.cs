using System;
using System.Collections.Generic;
using System.Text;
using AccesoBD.Modelos;
using System.Data.SqlClient;
using System.Data;
using AccesoBD.Conexion;
using System.IO;

namespace AccesoBD.Acceso
{
    public class Tablero
    {
        public List<ModeloTablero> Consultar(ModeloTablero tablero)
        {
            string procedimiento = "SP_Tablero";
            List<ModeloTablero> tab = new List<ModeloTablero>();

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
                        comando.Parameters["@Usuario"].Value = tablero.Usuario;
                        using (SqlDataReader lector = comando.ExecuteReader())
                        {
                            tab = ObtenerFilas(lector);
                        }
                        return tab;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        #region Metodos_Encapsulados

        public ModeloTablero ObtenerUnaSolaFila(SqlDataReader lector)
        {
            ModeloTablero tablero = new ModeloTablero();

            if (!Convert.IsDBNull(lector["Usuario"])) { tablero.Usuario = lector["Usuario"].ToString(); }
            else { tablero.Usuario = "Usuario no encontrado"; }
            if (!Convert.IsDBNull(lector["Tipo"])) { tablero.Tipo = lector["Tipo"].ToString(); }
            else { tablero.Tipo = "No encontrado"; }
            if (!Convert.IsDBNull(lector["Nombre"])) { tablero.Nombre = lector["Nombre"].ToString(); }
            else { tablero.Nombre = "Sin nombre"; }
            if (!Convert.IsDBNull(lector["Img"])) { tablero.Imagen = Encoding.ASCII.GetBytes(lector["Img"].ToString()); }
            else { tablero.Imagen = Encoding.ASCII.GetBytes("Null"); }

            return tablero;
        }

        public List<ModeloTablero> ObtenerFilas(SqlDataReader lector)
        {
            List<ModeloTablero> lista = new List<ModeloTablero>();
            if (lector != null)
            {
                while (lector.Read())
                {
                    lista.Add(ObtenerUnaSolaFila(lector));
                }
            }

            return lista;
        }
        #endregion
    }
        
}

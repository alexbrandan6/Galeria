using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Galeria
{
    public class AccesoDatos
    {
        string conn = ConfigurationManager.ConnectionStrings["csWeb_Galeria"].ConnectionString;

        public SqlConnection obtenerConexion()
        {
            SqlConnection cn = new SqlConnection(conn);
            cn.Open();
            return cn;
        }
        private SqlDataAdapter ObtenerAdaptador(string stQuery, SqlConnection cn)
        {
            SqlDataAdapter adaptador = new SqlDataAdapter(stQuery, cn);
            return adaptador;
        }

        public DataTable ObtenerTabla(string NombreTabla, string stQuery)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = obtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(stQuery, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }
        public DataSet EjecutarScript(string stQuery)
        {
            try
            {
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter();
                SqlConnection Conexion = obtenerConexion();
                SqlCommand cmd = new SqlCommand(stQuery, Conexion);
                da.SelectCommand = cmd;
                da.Fill(ds);
                Conexion.Close();

                return ds;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public DataSet EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            try
            {
                DataSet ds = new DataSet();
                SqlConnection Conexion = obtenerConexion();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();

                cmd = Comando;
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = NombreSP;
                da.SelectCommand = cmd;
                da.Fill(ds);
                Conexion.Close();

                return ds;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}

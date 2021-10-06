using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Galeria.Modelo;

namespace Galeria.Repositorio
{
    
    public class UsuarioRepositorio
    {
        public DataSet UsuarioGuardar(Usuario usuario)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioGuardar(ref datos, usuario);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_SYS_Usuario_Guardar");
            }
            catch(Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosUsuarioGuardar(ref SqlCommand datos, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@Contra", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getContra();

        }
        public DataSet UsuarioLogear(Usuario usuario)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioLogear(ref datos, usuario);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_SYS_Usuario_Logear");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosUsuarioLogear(ref SqlCommand datos, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@Contra", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getContra();
        }
        public DataSet UsuarioObtener(Usuario usuario)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioObtener(ref datos, usuario);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Usuario_Obtener");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosUsuarioObtener(ref SqlCommand datos, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@op", SqlDbType.VarChar, 10);
            SqlParametros.Value = "USER";
        }
        public DataSet UsuarioActualizar(Usuario usuario, string NombreUsuarioActual)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosUsuarioActualizar(ref datos, usuario, NombreUsuarioActual);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Usuario_Actualizar");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosUsuarioActualizar(ref SqlCommand datos, Usuario usuario, string NombreUsuarioActual)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@NombreUsuarioActual", SqlDbType.VarChar, 50);
            SqlParametros.Value = NombreUsuarioActual;

            SqlParametros = datos.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getNombreUsuario();

            SqlParametros = datos.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50);
            SqlParametros.Value = usuario.getContra();

        }
    }
}
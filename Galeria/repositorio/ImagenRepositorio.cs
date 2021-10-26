using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Galeria.Modelo;

namespace Galeria.Repositorio
{
    
    public class ImagenRepositorio
    {
        public DataSet ImagenGuardar(Imagen imagen)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosImagenGuardar(ref datos, imagen);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Imagen_Guardar");
            }
            catch(Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosImagenGuardar(ref SqlCommand datos, Imagen imagen)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idUsuario", SqlDbType.Int);
            SqlParametros.Value = imagen.getIdUsuario();

            SqlParametros = datos.Parameters.Add("@NombreImagen", SqlDbType.VarChar, 50);
            SqlParametros.Value = imagen.getNombreImagen();

            SqlParametros = datos.Parameters.Add("@UrlImagen", SqlDbType.NVarChar, 500);
            SqlParametros.Value = imagen.getUrlImagen();

        }
        public DataSet ImagenesObtener()
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Imagenes_Obtener");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public DataSet ImageneDatosObtener(Imagen imagen)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosImagenObtenerDatos(ref datos, imagen);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Imagen_ObtenerDatos_Id");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosImagenObtenerDatos(ref SqlCommand datos, Imagen imagen)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idImagen", SqlDbType.Int);
            SqlParametros.Value = imagen.getIdImagen();

        }
        public DataSet CategoriaImagenGuardar(Imagen imagen, String idCategoria)
        {
            try
            {
                AccesoDatos acc = new AccesoDatos();
                SqlCommand datos = new SqlCommand();
                ArmarParametrosCategoriaImagenGuardar(ref datos, imagen, idCategoria);
                return acc.EjecutarProcedimientoAlmacenado(datos, "SP_Imagen_Categoria_Guardar");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void ArmarParametrosCategoriaImagenGuardar(ref SqlCommand datos, Imagen imagen, String idCategoria)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = datos.Parameters.Add("@idImagen", SqlDbType.Int);
            SqlParametros.Value = imagen.getIdImagen();

            SqlParametros = datos.Parameters.Add("@idCategoria", SqlDbType.Int);
            SqlParametros.Value = idCategoria;
        }
    }
}
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
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Galeria.Modelo
{
    public class Imagen
    {
        private string idImagen;
        private int idUsuario;
        private string NombreImagen;
        private string UrlImagen;

        public Imagen() { }
        public Imagen(int idUsuario, string NombreImagen, string UrlImagen)
        {
            this.idUsuario = idUsuario;
            this.NombreImagen = NombreImagen;
            this.UrlImagen = UrlImagen;
        }
        public string getIdImagen()
        {
            return idImagen;
        }
        public void setIdImagen(string idImagen)
        {
            this.idImagen = idImagen;
        }
        public int getIdUsuario()
        {
            return idUsuario;
        }
        public void setIdUsuario(int idUsuario)
        {
            this.idUsuario = idUsuario;
        }
        public string getNombreImagen()
        {
            return NombreImagen;
        }
        public void setNombreImagen(string NombreImagen)
        {
            this.NombreImagen = NombreImagen;
        }
        public string getUrlImagen()
        {
            return UrlImagen;
        }
        public void setUrlImagen(string UrlImagen)
        {
            this.UrlImagen = UrlImagen;
        }
    }
}
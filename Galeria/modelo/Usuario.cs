using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Galeria.Modelo
{
    public class Usuario
    {
        private int idUsuario;
        private string NombreUsuario;
        private string Contra;

        public Usuario() { }
        public Usuario(string NombreUsuario, string Contra)
        {
            this.NombreUsuario = NombreUsuario;
            this.Contra = Contra;
        }

        public string getNombreUsuario()
        {
            return NombreUsuario;
        }
        public void setNombreUsuario(string NombreUsuario)
        {
            this.NombreUsuario = NombreUsuario;
        }
        public string getContra()
        {
            return Contra;
        }
        public void setContra(string Contra)
        {
            this.Contra = Contra;
        }
    }
}
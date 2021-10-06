using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace Galeria
{
    public class FuncionesComunes
    {
        public string FechaAAAAMMDD(string fecha)
        {
            string fechaNueva = fecha.Split(char.Parse("/"))[2];
            fechaNueva += fecha.Split(char.Parse("/"))[1];
            fechaNueva += fecha.Split(char.Parse("/"))[0];

            return fechaNueva;
        }
        public bool EnviarMail(string mailTo, string motivo, string msj)
        {
            try
            {
                string fromaddr = "testdeprueba7@gmail.com";
                string password = "contraseniadeprueba";

                MailMessage msg = new MailMessage();
                msg.Subject = motivo;
                msg.From = new MailAddress(fromaddr);
                msg.Body = msj;
                msg.To.Add(new MailAddress(mailTo));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential(fromaddr, password);
                smtp.Credentials = nc;
                smtp.Send(msg);

                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
    }
}
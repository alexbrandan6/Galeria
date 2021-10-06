using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Galeria.Repositorio;
using Galeria.Modelo;
using System.Data;
using System.Drawing;

namespace Galeria
{
    public partial class Index : System.Web.UI.Page
    {
        Usuario user = new Usuario();
        UsuarioRepositorio userRepo = new UsuarioRepositorio();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] is null)
            {
                divLogin.Visible = true;
                btnLogout.Visible = false;
                divUpload.Visible = false;
            }
            else
            {
                divLogin.Visible = false;
                btnLogout.Visible = true;
                divUpload.Visible = true;
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                LlenarDatos(user);
                ds = userRepo.UsuarioLogear(user);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string msj = ds.Tables[0].Rows[0]["MSJ"].ToString();

                    if (msj == "OK")
                    {
                        Session["User"] = txtUsuario.Text;
                        SpanUsuario.InnerText = txtUsuario.Text;
                        divLogin.Visible = false;
                        btnLogout.Visible = true;
                        divUpload.Visible = true;
                    }
                    else
                    {
                        lblErrorLogin.Text = "Atención, " + msj + ".";
                        lblErrorLogin.ForeColor = Color.Red;
                    }
                }
                else
                {
                    lblErrorLogin.Text = "Error, no se pudo ingresar.";
                    lblErrorLogin.ForeColor = Color.Red;
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                LlenarDatos(user);
                ds = userRepo.UsuarioGuardar(user);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string msj = ds.Tables[0].Rows[0]["MSJ"].ToString();

                    if (msj == "OK")
                    {
                        lblErrorLogin.Text = "Hecho, el usuario se registró exitosamente.";
                        lblErrorLogin.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblErrorLogin.Text = "Atención, " + msj + ".";
                        lblErrorLogin.ForeColor = Color.Red;
                    }
                }
                else
                {
                    lblErrorLogin.Text = "Error, no se pudo guardar.";
                    lblErrorLogin.ForeColor = Color.Red;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected Usuario LlenarDatos(Usuario user)
        {
            user.setNombreUsuario(txtUsuario.Text);
            user.setContra(txtContra.Text);

            return user;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            SpanUsuario.InnerHtml = "";
            divLogin.Visible = true;
            btnLogout.Visible = false;
            divUpload.Visible = false;
        }
    }
}
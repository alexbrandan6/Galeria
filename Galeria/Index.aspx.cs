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
using System.IO;

namespace Galeria
{
    public partial class Index : System.Web.UI.Page
    {
        Usuario user = new Usuario();
        UsuarioRepositorio userRepo = new UsuarioRepositorio();
        Imagen imagen = new Imagen();
        ImagenRepositorio imagenRepo = new ImagenRepositorio();
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
                LlenarDatosUsuario(user);
                ds = userRepo.UsuarioLogear(user);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string msj = ds.Tables[0].Rows[0]["MSJ"].ToString();

                    if (msj == "OK")
                    {
                        Session["User"] = txtUsuario.Text;
                        Session["idUsuario"] = ds.Tables[0].Rows[0]["idUsuario"].ToString();
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
                lblErrorLogin.Text = "Error, " + ex.Message;
                lblErrorLogin.ForeColor = Color.Red;
            }
        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                LlenarDatosUsuario(user);
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
                lblErrorLogin.Text = "Error, " + ex.Message;
                lblErrorLogin.ForeColor = Color.Red;
            }
        }

        protected Usuario LlenarDatosUsuario(Usuario user)
        {
            user.setNombreUsuario(txtUsuario.Text);
            user.setContra(txtContra.Text);

            return user;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Session["idUsuario"] = null;
            SpanUsuario.InnerHtml = "";
            divLogin.Visible = true;
            btnLogout.Visible = false;
            divUpload.Visible = false;
        }

        protected void btnCargarArchivo_Click(object sender, EventArgs e)
        {
            try
            {
                if (fileUpload.HasFile)
                {
                    FileInfo file = new FileInfo(fileUpload.FileName);
                    string extn = file.Extension;

                    if (extn.ToUpper() == ".JPG" || extn.ToUpper() == ".JPEG" || extn.ToUpper() == ".PNG")
                    {
                        string fileName = Path.Combine(Server.MapPath("~/images"), fileUpload.FileName);
                        fileUpload.SaveAs(fileName);

                        imagenRepo.ImagenGuardar(LlenarDatosImagen(imagen, fileName));

                        lblErrorUpload.Text = "Hecho, imagen subida correctamente.";
                        lblErrorUpload.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblErrorUpload.Text = "Atención, solo se permiten imagenes con extención JPG, JPEG y PNG.";
                        lblErrorUpload.ForeColor = Color.Red;
                    }
                }
                else
                {
                    lblErrorUpload.Text = "Atención, debe seleccionar una imagen.";
                    lblErrorUpload.ForeColor = Color.Red;
                }
                
            }
            catch(Exception ex)
            {
                lblErrorUpload.Text = "Error, " + ex.Message;
                lblErrorUpload.ForeColor = Color.Red;
            }
        }
        protected Imagen LlenarDatosImagen(Imagen imagen, string fileName)
        {
            imagen.setIdUsuario(int.Parse(Session["idUsuario"].ToString()));
            imagen.setNombreImagen(fileUpload.FileName);
            imagen.setUrlImagen(fileName);

            return imagen;
        }
    }
}
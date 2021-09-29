<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Galeria.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Galería</title>

        <link href="css/Index.css" rel="stylesheet" />
        <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
        <script src="js/index.js"></script>
    </head>
    <body>
        <div id="menu">
            <div id="sideNav" class="sidenav">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            </div>

            <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
        </div>

        <form id="form1" runat="server">
            <div class="container p-5 border">
                <div class="row d-flex justify-content-center">
                    <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                        <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" placeholder="Contraseña"></asp:TextBox>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <div class="col-3 p-2 d-flex justify-content-center">
                        <asp:Button ID="btnIngresar" runat="server" CssClass="btn btn-success" Text="Ingresar"/>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
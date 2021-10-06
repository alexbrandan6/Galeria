<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Galeria.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Galería</title>

        <link href="css/Index.css" rel="stylesheet" />
        <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
        <script src="js/index.js"></script>
        <script src="js/Funciones.js"></script>
        <script src="js/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <form id="form1" runat="server">
            <div id="menu">
                <div id="sideNav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a id="SpanUsuario" runat="server" href="#"></a>
                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click">Salir</asp:LinkButton>
                </div>

                <span style="font-size:35px;cursor:pointer; position:relative; left: 5px;" onclick="openNav()">&#9776;</span>
            </div>
        
            <div id="divLogin" runat="server" class="container p-3 mt-3 border">
                <div class="row d-flex justify-content-center">
                    <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                        <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" placeholder="Contraseña"></asp:TextBox>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <div class="col-3 p-2 d-flex justify-content-end">
                        <asp:Button ID="btnIngresar" runat="server" CssClass="btn btn-success" Text="Ingresar" OnClick="btnIngresar_Click" OnClientClick="return Validate();"/>
                    </div>
                    <div class="col-3 p-2 d-flex justify-content-start">
                        <asp:Button ID="btnCrearUsuario" runat="server" CssClass="btn btn-dark" Text="Crear" OnClick="btnCrearUsuario_Click" OnClientClick="return Validate();"/>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <div class="col-12 p-2 d-flex justify-content-center">
                        <asp:Label ID="lblErrorLogin" Text="" runat="server" />
                    </div>
                </div>
            </div>

            <div id="divUpload" runat="server" class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                        <input id="fileUpload" runat="server" type="file" class="form-control"/>
                    </div>
                    <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                        <asp:Button ID="btnCargarArchivo" runat="server" CssClass="btn btn-warning" Text="Cargar" OnClientClick=""/>
                    </div>
                </div>
            </div>

            <div id="divGaleria" runat="server" class="container border p-3 mt-3">
                <div class="row">
                    <div class="col m-2">
                        <img src="http://lorempixel.com/350/230/" alt="Alternate Text" />
                    </div>
                    <div class="col m-2">
                        <img src="http://lorempixel.com/500/500/food" alt="Alternate Text" />
                    </div>
                    <div class="col m-2">
                        <img src="http://lorempixel.com/400/200/sports/1/" alt="Alternate Text" />
                    </div>
                    <div class="col m-2">
                        <img src="http://lorempixel.com/400/300/technics/3/Ubuntu/" alt="Alternate Text" />
                    </div>
                    <div class="col m-2">
                        <img src="http://placekitten.com/g/200/300" alt="Alternate Text" />
                    </div>
                    <div class="col m-2">
                        <img src="http://placekitten.com/200/300" alt="Alternate Text" />
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

<script>

    function Validate() {
        var valida = true;

        var txtUsuario = $("[id$=txtUsuario]").val();
        var txtContra = $("[id$=txtContra]").val();

        if (txtUsuario == "") {
            $("[id$=txtUsuario]").css("border-color", "red");
            valida = false;
        } else $("[id$=txtUsuario]").css("border-color", "");

        if (txtContra == "") {
            $("[id$=txtContra]").css("border-color", "red");
            valida = false;
        } else $("[id$=txtContra]").css("border-color", "");

        return valida;
    }

</script>
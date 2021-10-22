<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Galeria.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Galería</title>

        <link href="css/Index.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="js/index.js"></script>
        <script src="js/Funciones.js"></script>
        <script src="js/jquery-3.5.1.min.js"></script>
        <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
        <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>
    </head>
    <body>
        <form id="form1" runat="server">
            <div id="menu">
                <div id="sideNav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <asp:LinkButton id="btnLog" runat="server" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;">Login</asp:LinkButton>
                    <asp:LinkButton id="SpanUsuario" runat="server" href="#"></asp:LinkButton>
                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click">Salir</asp:LinkButton>
                </div>

                <span style="font-size:25px;cursor:pointer; position:relative; left: 5px;" onclick="openNav()">MENU</span>
            </div>

            <div id="divUpload" runat="server" class="container p-3 mt-3 border">
                <div class="row d-flex justify-content-center">
                    <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                        <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control"/>
                    </div>
                    <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                        <asp:Button ID="btnCargarArchivo" runat="server" CssClass="btn btn-warning" Text="Cargar" OnClick="btnCargarArchivo_Click"/>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">
                    <div class="col-12 p-2 d-flex justify-content-center">
                        <asp:Label ID="lblErrorUpload" Text="" runat="server" />
                    </div>
                </div>
            </div>

            <div id="divGaleria" runat="server" class="grid-container border p-3 mt-5">
                <asp:Repeater ID="rptImagenes" runat="server">
                    <ItemTemplate>
                        <img src="<%# Eval("UrlImagen") %>" alt="<%# Eval("NombreImagen") %>" class="grid-item"/>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Login</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row d-flex justify-content-center">
                                <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-auto col-md-auto col-lg-auto p-2">
                                    <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="row d-flex justify-content-center">
                                    <div class="col-12 p-2 d-flex justify-content-center">
                                        <asp:Label ID="lblErrorLogin" Text="" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnIngresar" runat="server" CssClass="btn btn-success" Text="Ingresar" OnClick="btnIngresar_Click" OnClientClick="return Validate();" />
                            <asp:Button ID="btnCrearUsuario" runat="server" CssClass="btn btn-dark" Text="Crear" OnClick="btnCrearUsuario_Click" OnClientClick="return Validate();" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>

<script>

    var elem = document.querySelector('.grid-container');
    imagesLoaded(elem, () => {
        var msnry = new Masonry(elem, {
            itemSelector: '.grid-item',
            columnWidth: 230,
            gutter: 20,
            isFitWidth: true
        });
    });

</script>
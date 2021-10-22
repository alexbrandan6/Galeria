function openNav() {
    document.getElementById("sideNav").style.width = "250px";
    document.getElementById("form1").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("sideNav").style.width = "0";
    document.getElementById("form1").style.marginLeft = "0";
}

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
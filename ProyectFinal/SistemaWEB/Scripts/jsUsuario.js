$(document).ready(function () {
    console.log("Registar Usuario");
});

function modalCrearUsuario() {
    $("#modalPopup").removeClass("modal-lg");
    $("#modalPopup").removeClass("modal-xs");
    $("#modalPopup").removeClass("modal-md");
    $("#modalPopup").removeClass("modal-sm");
    $("#modalPopup").addClass("modal-md");

    $.ajax({
        type: 'GET',
        url: '/Usuario/New',
        beforeSend: function () {
        },
        success: function (data) {
            $("#headerModal").html("Registrar Usuario: ");
            $("#bodyModal").html(data);
            //$('#btnGrabarModal').show();
            $('#footerModal').show();
            $('#myModal').modal();
        },
        error: function (data) {
            console.log(data);
        },
        complete: function () {
            //init_evt_ListaDetalleTesisParametro();
        }
    });
}
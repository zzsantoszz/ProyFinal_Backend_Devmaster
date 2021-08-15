$(document).ready(function () {
    console.log("Editar Usuario");
});

function modalEditarUsuario() {
    $("#modalPopup").removeClass("modal-lg");
    $("#modalPopup").removeClass("modal-xs");
    $("#modalPopup").removeClass("modal-md");
    $("#modalPopup").removeClass("modal-sm");
    $("#modalPopup").addClass("modal-md");

    $.ajax({
        type: 'GET',
        url: '/Usuario/Editar',
        beforeSend: function () {
        },
        success: function (data) {
            $("#headerModal").html("Editar Usuario: ");
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
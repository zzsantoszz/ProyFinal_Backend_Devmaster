$(document).ready(function () {
    console.log("Registar Categoria");
});

function modalCrearCategoriaTicket() {
    $("#modalPopup").removeClass("modal-lg");
    $("#modalPopup").removeClass("modal-xs");
    $("#modalPopup").removeClass("modal-md");
    $("#modalPopup").removeClass("modal-sm");
    $("#modalPopup").addClass("modal-md");

    $.ajax({
        type: 'GET',
        url: '/CategoriaTicket/New',
        beforeSend: function () {
        },
        success: function (data) {
            $("#headerModal").html("Registrar Categoria: ");
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
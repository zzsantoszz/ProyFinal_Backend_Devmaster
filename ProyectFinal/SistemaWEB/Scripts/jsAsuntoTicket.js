$(document).ready(function () {
    console.log("Registar Usuario");
});

function modalCrearAsuntoTicket() {
    $("#modalPopup").removeClass("modal-lg");
    $("#modalPopup").removeClass("modal-xs");
    $("#modalPopup").removeClass("modal-md");
    $("#modalPopup").removeClass("modal-sm");
    $("#modalPopup").addClass("modal-md");

    $.ajax({
        type: 'GET',
        url: '/AsuntoTicket/New',
        beforeSend: function () {
        },
        success: function (data) {
            $("#headerModal").html("Registrar Asunto: ");
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
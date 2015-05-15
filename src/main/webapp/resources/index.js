var id;
function poista(id) {
    $.ajax({
        url: 'kulttuuri/' + id,
        type: 'DELETE',
        success: function () {
            $("#kulttuuri" + id).remove();
        }
    });
}
function openChangeView(id2) {
    id = id2;
    $("#dialog").dialog("open");
}
function hide() {
    var a = $("#nimet").val().split("\n");
    for (var i = 0; a.length; i++) {
        var name = a[i].split("\t")[0];
        var b = $("td:contains('" + name + "')");
        for (var j = 0; j < b.length; j++) {
             if (b[j].textContent == name) {
                 b[j].parentElement.hide();
             }
        }
    }
}
$(document).ready(function () {
    $("table").tablesorter({sortList: [[2, 1]]});
    var dialog = $("#dialog").dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: {
            "Vaihda": function () {
                $.post('kulttuuri/' + id, {count: $("#count").val()}, function (data) {
                    console.log($("#kulttuuri" + id).html());
                    console.log(data);
                });
                dialog.dialog("close");
            },
            "Peruuta": function () {
                dialog.dialog("close");
            }
        }
    });
});

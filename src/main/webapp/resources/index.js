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
    var n = 0;
    for (var i = 0; i < a.length; i++) {
        var name = a[i].split("\t")[0];
        if (name.length > 0) {
            var b = $("td:contains('" + name + "')");
            for (var j = 0; j < b.length; j++) {
                if (b[j].textContent.toLowerCase() == name.toLowerCase()) {
                    b[j].parentElement.remove();
                    n++;
                }
            }
        }
    }
    $("#info").text("Piilotettu " + n + " kulttuuri-ilmoitusta listasta.");
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
jQuery.expr[':'].contains = function(a, i, m) {
 return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};

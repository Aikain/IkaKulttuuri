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
                    $("#kulttuuri" + data.id + "count").text(data.kpl);
                    $("#kulttuuri" + data.id + "time").text(new Date(data.time).time());
                    $("table").tablesorter({sortList: [[2, 1]]});
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
Date.prototype.time = function() {
  var yy = this.getFullYear().toString();
  var mm = (this.getMonth()+1).toString();
  var dd  = this.getDate().toString();
  var h = this.getHours().toString();
  var m = this.getMinutes().toString();
  var s = this.getSeconds().toString();
  return yy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]) + " " + (h[1]?h:"0"+h[0]) + ":" + (m[1]?m:"0"+m[0]) + ":" + (s[1]?s:"0"+s[0]) + ".0";
};

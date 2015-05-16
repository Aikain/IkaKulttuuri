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
function hideOne(element) {
    element.parentElement.parentElement.remove();
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
function hideFull() {
    var a = $('*[id*=count]:contains("0")');
    for (var i = 0; i < a.length; i++) {
        if (a[i].textContent === "0") {
            a[i].parentElement.remove();
        }
    }
}
function change(id, count, rdy) {
    if (count < 0) return;
    if (rdy != false) rdy = true;
    $.post('kulttuuri/' + id, {'count': count}, function (data) {
        if (rdy) {
            $("#kulttuuri" + data.id + "count").text(data.kpl);
            $("#kulttuuri" + data.id + "time").text(new Date(data.time).time());
            $("table").tablesorter({sortList: [[2, 1]]});
        }
    });
}
function decrease(id) {
    change(id, $("#kulttuuri" + id + "count").text()-1, false);
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
                change(id, $("#count").val());
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

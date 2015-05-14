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
$(document).ready(function() { 
    $("table").tablesorter(); 
    var dialog = $("#dialog").dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        "Vaihda": function() {
          $.post('kulttuuri/' + id, { count: $("#count").val() }, function(data) {
            console.log($("#kulttuuri" + id).html());
            console.log(data);
          });
          dialog.dialog("close");
        },
        "Peruuta": function() {
          dialog.dialog("close");
        }
      }
    });
}); 

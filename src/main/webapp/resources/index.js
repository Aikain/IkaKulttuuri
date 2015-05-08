function poista(id) {
    $.ajax({
        url: 'kulttuuri/' + id,
        type: 'DELETE',
        success: function () {
            $("#kulttuuri" + id).remove();
        }
    });
}
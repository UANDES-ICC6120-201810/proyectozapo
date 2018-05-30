function updateCheckBoxValue(e) {
    var target = e.target;
    var value = target.value;
    $.ajax({
        type: "POST",
        url: "ajaxFunction",
        data: {
            "file_to_update_id" : value
        },
        datatype: 'json',
        success: function(json){
            result = json;
        }
    })

}

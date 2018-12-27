$(document).ready(function() {
    $("#caltype").change(function() {
        var text = $("#caltype").val();
        if (text == "2") {
            $("#month").css('display','block');
            $("#year").css('display','none');
            $("#day").css('display','none');
        }
        else if (text == "1") {
            $("#month").css('display','none');
            $("#year").css('display','block');
            $("#day").css('display','none');
        }
        else if (text == "3") {
            $("#month").css('display','none');
            $("#year").css('display','none');
            $("#day").css('display','block');
        }
    });
})
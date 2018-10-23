$(document).ready(function(){
    $('#admin_email_marketing_send_type').change(function() {
      //  alert(this.value)

        if(this.value == "Selected Customer") {
            $('#reciver_custom_email').hide();
            $('#reciver_email').show();
        }else if (this.value == "Custom Email"){
            $('#reciver_email').hide();
            $('#reciver_custom_email').show();
        }
        else{
            $('#reciver_email').hide();
            $('#reciver_custom_email').hide();
        }
    });
});
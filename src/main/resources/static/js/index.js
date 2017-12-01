$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});

function fire_ajax_submit() {

    var employee = {}
    employee["firstName"] = $("#firstname").val();
    employee["lastName"] = $("#lastname").val();
    employee["email"] = $("#email").val();
    employee["password"] = $("#password").val();

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/registration/register-employee",
        data: JSON.stringify(employee),
        success: function (data) {

            console.log("SUCCESS : ", data);

        },
        error: function (e) {

			alert(e);
			console.log("ERROR : ", e);
        }
    });
    
}    
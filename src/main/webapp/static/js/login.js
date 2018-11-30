var path1 = "http://localhost:8080/cg/";//本地环境
var path2 = "http://193.112.26.124/cg/"; //家伟腾讯云

var path = path1;

$(function() {
    $("#staffNum").blur(function() {
        var validNum = (/^\d{10}$/.test($(this).val()));
        if ($(this).val() === "") {
            showError($("input#staffNum"), "工号不能为空");
        } else if (!validNum) {
            showError($("input#staffNum"), "工号格式错误");
        }
    });


    $(".input-form input").focus(function() {
            resetError($(this));
        }).keydown(function() {
        resetError($(this));
    });


    $("#staffPassword").blur(function() {
        if ($(this).val() === "") {
            showError($(this), "密码不能为空");
        }
    });

    $("#login-submit").click(function() {
        validLogin();
    });
    
    $("#staffPassword").keydown(function(event){
        if(event.which === 13){
            validLogin();
        }
    });
    
});

function showError($input, errorMsg){
    $input.siblings("span.error-msg").text(errorMsg).removeClass("hide");
    $input.parents("div.input-form").addClass("invalid");
}

function resetError($input){
    $input.parents("div.input-form").removeClass("invalid");
    $input.siblings("span.error-msg").addClass("hide");
    $input.parents("div.input-form").addClass("focus");
    $("#login-error-msg").addClass("hide");
}

function validLogin(){
    var sn = $("#staffNum").val();
    var pw = $("#staffPassword").val();
    if ((sn !== "") && (pw !== "")) {
        var staffData = {
            "staffNum": sn,
            "staffPassword": pw
        };
        $.ajax({
            type: "POST",
            url: path + "staff/login",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(staffData),
            dataType: "json",
            success: function(data) {
                if (data.code === 0) {
                    window.location.href = path + "staff/home";
                } else {
                    var $lem = $("#login-error-msg");
                    $lem.text(data.msg);
                    $lem.removeClass("hide");
                }
            }
        });
    }else if(sn === ""){
        showError($("#staffNum"), "工号不能为空");
    }else{
        showError($("#staffPassword"), "密码不能为空");
    }
}
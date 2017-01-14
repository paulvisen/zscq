$(document).ready(function () {
    
});


function checkBoforeAddBuy() {
    try {
        var ii = $("#userpwd").val()
        if (ii == undefined || ii == "") {
            alert("请填写密码!");
            return false;
        } else {
            return true;
        }
    } catch ($e) {
        return false;
    }
}
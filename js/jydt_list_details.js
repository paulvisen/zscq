
$(document).ready(function () {
    $.getJSON(
     "../ashx/jydt_list_details.ashx",
     {
         type:1

     },
     function (data, status) {
         //data为返回对象，status为请求的状态
         //alert(data);//[object object]
         var CGPubstate = "";
         var isByExp = "";
         var comment = "";
         if (data.CGPubstate==1)
         {
             CGPubstate = "是";
         }else{
             CGPubstate = "否";
         }
         if(data.isByExp==1)
         {
             isByExp="专家已点评";
         }else{
             isByExp="专家未点评";
         }
         if (isByExp == "专家未点评") {
             comment = "专家未点评";
         } else {

             getcom();
             
         }
         var img = new Array(); //定义一数组 
         img = data.CGImg.split(","); //字符分割 
         var cgjbxx = "<div class='tupianhead'>成果基本信息</div>" + "<table><tbody><tr>" + "<td colspan='2'><b>成果名称：</b>" + data.CGName + "</td></tr><tr><td><b>成果类型：</b>" + data.CGType + "</td><td><b>参考价格：</b>" + data.TransPrice + "万</td></tr><tr><td><b>成果状态：</b>" + isByExp + "</td><td><b>是否审核认证：</b>" + CGPubstate + "</td></tr></tbody></table>";
         var fbdwxx = "<div class='tupianhead'>成果发布单位信息</div><table class='fbdwxxbody'><tbody><tr><td colspan='2'><b>单位名称：</b>"+data.Name+"</td></tr><tr><td colspan='2'><b>单位简介：</b>"+data.Introduce.substr(0,33)+"</td></tr><tr><td ><b>成果数量：</b>123</td><td><b>交易成功（次）：</b>99</td></tr><tr><td colspan='2'><a href='#'><span class='fadwxxbody_sp'>查看单位详情</span></a></td></tr></tbody></table>";
         var tupian = "<div class='tupianhead'>成果图片</div><div class='tupianbody'>";
             //+"<img src='"+img[0]+"' />"+ "<img src='" + img[1] + "' />" + "<img src='" + img[2] + "' />" + "<img src='" + img[3] + "' />" +"</div>";
         $.each(img,function(index){
          tupian+="<img src='"+img[index]+"' />";
         });
         tupian += "</div>";
         var cgjbxxdjb = "<table width='100%' border='0' class=' _ft11'><thead><tr ><td colspan='4' >成果交易信息登记表</td></tr></thead><tbody><tr>"+
                                        "<td colspan='2'><b>单位：</b>"+data.Name+"</td>"+
                                        "<td><b>联系人：</b>"+data.ConPerson+"</td>"+
                                        "<td><b>电话：</b>"+data.ConPhone+"</td></tr><tr>"+
                                        "<td colspan='2'><b>成果名称：</b>"+data.CGName+"</td>"+
                                        "<td colspan='2'><b>品种审定号或专利号：</b>"+data.PatentNum+"</td></tr><tr>"+
                                        "<td colspan='2'><b>成果完成团队：</b>"+data.CGCompany+"</td>"+
                                        "<td><b>主要完成人：</b>"+data.main_person+"</td>"+
                                        "<td><b>电话：</b>"+data.main_person_phone+"</td></tr><tr>"+
                                        "<td colspan='4'><b>成果类型：</b>"+data.CGType+"</td></tr><tr>"+
                                        "<td colspan='4'><b>拟转化方式：</b>"+data.TransMode+"</td></tr><tr>"+
                                        "<td colspan='4'><b>拟转让价格：</b>"+data.TransPrice+"万</td></tr><tr>"+
                                        "<td colspan='4'><b>拟合作企业：</b>无</td></tr><tr>"+
                                        "<td colspan='4'><b>成果简要介绍：</b>"+data.CGDetails_short+"</td></tr><tr>"+
                                        "<td colspan='2'><b>单位意见：</b>"+data.unit_com+"</td>"+
                                        "<td colspan='2'><b>院主管部门意见：</b>"+data.admin_com+"</td></tr><tr>"+
                                        "<td colspan='4'><b>备注：</b></td></tr><tr>"+
                                        "<td colspan='4'><b>专家意见：</b><span id='com'>" + comment + "</com></td></tr></tbody></table>";
         var cgjs = "<p>" + data.CGDetails+ "</p>";
         $("#cgjbxx").html(cgjbxx);
         $("#fbdwxx").html(fbdwxx);
         $("#tupian").html(tupian);
         $("#cgjbxxdjb").html(cgjbxxdjb);
         $("#cgjs").html(cgjs);
        
     });
});

function getcom(){
    $.getJSON(
    "../ashx/jydt_list_details.ashx",
     {
         type: 11

     },function(data, status) {
         //alert(data.comment);
        var com = document.getElementById('com');
        var str= data.comment
        $("#com").html(str);

     });
    
}


//function addbookmark($e) {

//    bookmark($e, 1);
//}

//function bookmark($e, $type) {
//    $($e).attr("disbaled", "disbaled");
//    $e.disabled = true;
//    var $cgid = getQueryString("cgid");

//    if ($cgid == undefined || $cgid == "") {
//        alert("操作出错，请重新重新尝试!");
//    } else {
//        if (window.confirm("确定收藏?")) {
//            $.getJSON(
//               "../ashx/jydt_list_details.ashx",
//               {
//                   type: 2,
//                   cgid: $cgid,
//                   op: $type
//               }).done(function (data) {
                   
//                   //pubNewAlert(data.sValue);
//                   //$e.disabled = false;
//                   //if (data.iKey == true.toLocaleString().toLocaleLowerCase()) {
//                   //    window.location.reload();
//                   //}
//               });
//        } else {
//            $e.disabled = false;
//        }
//    }
//}

//function delbookmark($e) {

//    bookmark($e, 2);
//}

function addshop0() {
    var $cgid = getQueryString("cgid");

    if ($cgid == undefined || $cgid == "") {
        alert("操作出错，请重新重新尝试!");
    } else {
        art.dialog.open("AddToBuy.aspx?cgid=" + $cgid,
        {
            lock: true,
            opacity: 0.1,
            title: '购买',
            width: 530,
            resizable: false,
            height: 280,
            top:'20%',
           
            
        });
    }
}

function deleteshop0() {
    var $cgid = getQueryString("cgid");

    if ($cgid == undefined || $cgid == "") {
        alert("操作出错，请重新重新尝试!");
    } else {
        art.dialog.open("DeleteToBuy.aspx?cgid=" + $cgid,
        {
            lock: true,
            opacity: 0.1,
            title: '取消购买',
            width: 450,
            resizable: false,
            height: 200,
            top: '20%',
        });
    }
}



function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}
function getDate(date0) {
    //var date = new Date(parseInt(date0.replace(/\D/igm,"")));
    //var year = date.getFullYear();
    //var month = date.getMonth() + 1;
    //var day = date.getDate();
    //return year + "-" + month + "-" + day;
    var date = new Date(date0);
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    return year + "-" + month + "-" + day;



}
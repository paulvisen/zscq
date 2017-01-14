$(document).ready(function () {
    //LoadDate(DealPageing);
    $.getJSON(
       "../ashx/xxjy_details.ashx",
       {


       },
       function (data, status) {
           //data为返回对象，status为请求的状态
           //alert(data);
           
           //那么浏览器就会弹出对话框显示该段文字
           //alert(status);
           //结果为success, error等等，但这里是成功时才能运行的函数
           //data = eval("(" + data + ")");
           //alert(data);
           var xxjy_name = data.xxjy_name;
           var xxjy_time = "起止时间：" + getDate(data.start_time) + " 至" + getDate(data.end_time) + " &nbsp;&nbsp; 活动主办方：" + data.host + "&nbsp;&nbsp;活动地点：" + data.location;
           var details = data.details_short;
           var xxhd_neirong = data.main_content;
           var xxhd_richeng = data.timeline;
           var Lblphone = data.con_phone;
           var img = new Array(); //定义一数组 
           img = data.image_url.split(","); //字符分割 
           //var str = "";
           ////var ul = document.getElementById("#banner");
           //for (var i = 0; i < img.length; i++)  {
           //    str +="<li style='background-image:url(../images/haibao0.jpg); background-size: cover; background-repeat: no-repeat; background-position: center center;'></li>";
               
           //}
          
           //var str = "";
           //for (var i = 0; i < img.length; i++) {
           //    str += "<li style='background-image: url(../images/haibao0.jpg); background-size: cover; background-repeat: no-repeat; background-position: center center;'></li>";
           //}
           $("#xxjy_name").html(xxjy_name);
           $("#xxjy_time").html(xxjy_time);
           $("#details").html(details);
           $("#xxhd_neirong").html(xxhd_neirong);
           $("#xxhd_richeng").html(xxhd_richeng);
           $("#Lblphone").text(Lblphone);
           $("#limg1").css("background-image", 'url(' + img[0] + ')');
           $("#limg2").css("background-image", 'url(' + img[1] + ')');
           $("#limg3").css("background-image", 'url(' + img[2] + ')');
           //$("#ul0").append(str);
       });
   
});

//function DealPageing(data) {
//    $(data, function(){
//        alert(data);
//    });
    
//    //alert(obj);
//    var name = "";
//    //var xxjy_time = "";
//    //$(function (data) {
        
//        //name = data.xxjy_name;
//        //xxjy_time = "起止时间：" + getDate(data.start_time) + " 至" + getDate(data.end_time) + " &nbsp;&nbsp; 活动主办方：" + data.host + "&nbsp;&nbsp;活动地点：" + data.location;
//    //})
//    //$.each(data, function ($index, $e) {
//    //    name = $e.xxjy_name;
//        name = "aaaaaa";
      
        
        
//    //});
//    //if (name == " ") {
//    //    name = "貌似没有数据";
//    //}
    
//    $("#xxjy_name").html(name);
//    //$("#xxjy_time").html(xxjy_time);
    

//}

//function LoadDate($callback) {
//    $.getJSON(
//        "../ashx/xxjy_details.ashx",
//        {


//        }).done(function (data) {
//            $callback(data);
//        });
//}

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
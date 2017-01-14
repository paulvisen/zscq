$(document).ready(function () {
    $("#morejy").hide();
    $.getJSON(
     "../ashx/jydt_list_details_xq.ashx",
     {


     },
     function (data, status) {
         //data为返回对象，status为请求的状态
         //alert(data);//[object object]
        
         var cgjbxx = "<div class='tupianhead'>成果需求基本信息</div>" + "<table><tbody><tr>" + "<td colspan='2'><b>需求名称：</b>" + data.Name + "</td></tr><tr><td><b>需求类型：</b>" + data.TransStyle + "</td><td><b>参考价格：</b>" + data.PriceLow + "-" + data.PriceHigh + "万</td></tr><tr><td><b>技术成熟度：</b>" + data.Mature + "</td><td><b>技术水平：</b>" + data.TechLevel + "</td></tr></tbody></table>";
         var fbdwxx = "<div class='tupianhead'>成果需求发布单位信息</div><table class='fbdwxxbody'><tbody><tr><td colspan='2'><b>单位名称：</b>" + data.Name1 + "</td></tr><tr><td colspan='2'><b>单位简介：</b>" + data.Introduce.substr(0, 33) + "</td></tr><tr><td ><b>成果数量：</b>123</td><td><b>交易成功（次）：</b>99</td></tr><tr><td colspan='2'><a href='#'><span class='fadwxxbody_sp'>查看单位详情</span></a></td></tr></tbody></table>";
        
         var cgjbxxdjb = " <table width='100%' border='0' class=' _ft11'>"+
                                "<thead><tr ><td colspan='4'>成果需求信息登记表</td></tr></thead>"+
                                "<tbody><tr><td colspan='2'><b>单位：</b>" +data.Name1 +"</td><td><b>联系人：</b>" + data.CommPerson + "</td><td><b>电话：</b>" + data.CommTel+ "</td></tr><tr>" +
                                        "<td colspan='2'><b>成果名称：</b>"+data.Name+"</td>"+
                                        "<td colspan='2'><b>所属领域：</b>"+data.BelongField+"</td></tr><tr>"+
                                       " <td colspan='2'><b>技术类型：</b>"+data.transclass+"</td>"+
                                        "<td><b>技术成熟度：</b>"+data.Mature+"</td>"+
                                       " <td><b>技术水平：</b>"+data.TechLevel+"</td></tr><tr>"+
                                        "<td colspan='4'><b>预期交易价格：</b>"+data.PriceLow + "-" + data.PriceHigh + "万</td></tr><tr>"+
                                        "<td colspan='4'><b>预期交易方式：</b>"+data.TransStyle+"</td></tr></tbody></table>";
         var cgjs = "<p>" + data.BriefIntro + "</p>";
         $("#cgjbxx").html(cgjbxx);
         $("#fbdwxx").html(fbdwxx);
         $("#cgjbxxdjb").html(cgjbxxdjb);
         $("#cgjs").html(cgjs);

     });
});

function clickexpand() {
    $(".jyexpand").hide();
    $("#morejy").show();

}

function manamgerit() {
    var $cgid = getQueryString("cgid");

    if ($cgid == undefined || $cgid == "") {
        alert("操作出错，请重新重新尝试!");
    } else {
        this.location.href = GiveRoot() + "/Manager/Chenguo/CGPro.aspx?cgid=" + $cgid;
    }
}


function addbookmark($e) {

    bookmark($e, 1);
}

function bookmark($e, $type) {
    $($e).attr("disbaled", "disbaled");
    $e.disabled = true;
    var $cgid = getQueryString("cgid");

    if ($cgid == undefined || $cgid == "") {
        alert("操作出错，请重新重新尝试!");
    } else {
        if (window.confirm("确定收藏?")) {
            $.getJSON(
               "JiaoYi.ashx",
               {
                   type: 1,
                   cgid: $cgid,
                   op: $type
               }).done(function (data) {
                   pubNewAlert(data.sValue);
                   $e.disabled = false;
                   if (data.iKey == true.toLocaleString().toLocaleLowerCase()) {
                       window.location.reload();
                   }
               });
        } else {
            $e.disabled = false;
        }
    }
}

function delbookmark($e) {

    bookmark($e, 2);
}

function addshop() {
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
            height: 310,
        });
    }
}

function deleteshop() {
    var $cgid = getQueryString("cgid");

    if ($cgid == undefined || $cgid == "") {
        alert("操作出错，请重新重新尝试!");
    } else {
        art.dialog.open("./DeleteBuy.aspx?cgid=" + $cgid,
        {
            lock: true,
            opacity: 0.1,
            title: '取消购买',
            width: 530,
            resizable: false,
            height: 290,
        });
    }
}

function showtab($e1, $e2) {
    //待修改
    if ($e2 == "_xqyh") {
        var $cgid = getQueryString("cgid");
        if ($cgid == undefined || $cgid == "") {
            alert("操作出错，请重新重新尝试!");
        } else {
            if ($("#_xqyh > p").length > 0) {
                $.getJSON(
                  "JiaoYi.ashx",
                  {
                      type: 11,
                      cgid: $cgid,
                  }).done(function (data) {
                      if (data.iKey == true.toString().toLowerCase()) {
                          $("#_xqyh").html(data.sValue);
                      } else {
                          $("#_xqyh").html("<p>加载失败</p>");
                      }
                  });
            }
        }
    }
    //else if ($e2 == "_plzx") {
    //    var $cgid = $.QueryString("cgid");
    //    if ($cgid == undefined || $cgid == "") {
    //        alert("操作出错，请重新重新尝试!");
    //    } else {
    //        if ($("#_plzx > p").length > 0) {
    //            $.getJSON(
    //               GiveRoot() + "/Manager/Chenguo/CGPub.ashx",
    //              {
    //                  type: 1,
    //                  cgid: $cgid,
    //                  ask: 1,
    //              }).done(function (data) {
    //                  if (data.iKey == true.toString().toLowerCase()) {
    //                      $("#_plzx").html(data.sValue);
    //                  } else {
    //                      $("#_plzx").html("<p>加载失败</p>");
    //                  }
    //              });
    //        }
    //    }
    //}
}

function iwannask($e) {
    $($e).attr("disbaled", "disbaled");
    $e.disabled = true;
    var cont = $("#myques").val();
    var $cgid = getQueryString("cgid");
    if ($cgid == undefined || $cgid == "") {
        alert("操作出错，请重新重新尝试!");
        return;
    } else if (cont == undefined || cont == null || cont == "") {
        alert("您还没有输入!");
        $e.disabled = false;
        return;
    } else {
        art.dialog({
            lock: true,
            opacity: 0.1,
            content: "<div><p>确定提问?</p><br /><label>请输入密码</label><br/><input type=\"password\" runat=\"server\" id=\"userpassword\" /></div>",
            cancel: true,
            ok: function () {
                $.getJSON(
                    "JiaoYi.ashx",
                    {
                        type: 2,
                        cgid: $cgid,
                        cont: escape(cont),
                        pwd: hex_md5($("#userpassword").val())
                    }).done(
                    function (data) {
                        $e.disabled = false;
                        if (data.iKey == false.toLocaleString().toLowerCase()) {
                            pubNewAlert(decodeURIComponent(data.sValue));
                        } else {
                            pubNewAlert(decodeURIComponent(data.sValue));
                            window.location.href = window.location.href;
                        }
                    }
                    ).error(function (data) {
                        alert("error");
                    });
            }
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
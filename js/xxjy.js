$(document).ready(function () {
    LoadDate(1, 7, DealPageing);
   
});

function DealPageing(data,$page) {
    var str = "";
    var label0 = 0;
    var pages = Math.ceil(data.total / 7);
   
    
    $.each(data.rows, function ($index, $e) {
        if ($e.state == '计划中') {
            label0 = 0;
        } else if ($e.state == '进行中') {
            label0 = 1;
        } else {
            label0 = 2;
        }
        str += "<span class='yjwidth'>" +
                               " <span class='yjimg'><img  src='" + $e.image_list + "'/></span>" +
                                "<span class='jymiddle'>" +
                                    " <span class='jyname'>活动名称："+$e.xxjy_name+"<span class='jylable" + label0 + "'>" + $e.state + "</span></span>" +
                                    "<span class='jytime'>起止时间：" + getDate($e.start_time) + " 至 " + getDate($e.end_time) + " &nbsp;&nbsp; 活动主办方：" + $e.host + " &nbsp;&nbsp;活动地点：" + $e.location +
                                   " </br>活动介绍："+$e.details_short+
                                   " </span></span>" +
                                "<a href='xxjy_details.aspx?xxjyid="+$e.id+"'><span class='jyright'>查看详情</span></a></span>"

    }); 

    if (str == "") {
        str = "貌似没有数据";
    }
    $("#back").html(str);
    if (data.total > 0) {
        var element = $('#pageUl');//对应下面ul的ID
        var options = {
            bootstrapMajorVersion: 3,
            currentPage: $page,//当前页面
            numberOfPages: 5,//一页显示几个按钮（在ul里面生成5个li）
            totalPages: pages,//总页数
            itemTexts: function (type, page, current) {
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
            },//点击事件，用于通过Ajax来刷新整个list列表
            onPageClicked: function (e, originalEvent, type, page) {
                LoadDate(page, 7, DealPageing);
            }
        }
        element.bootstrapPaginator(options);
    }
}

function LoadDate($page, $rows, $callback) {
    $.getJSON(
        "../ashx/xxjy.ashx",
        {
            type: 1,
            row: $rows,
            page: $page,

        }).done(function (data) {
            $callback(data, $page);
        });
}

function getDate(date0) {
    ////var date = new Date(parseInt(date0.replace(/\D/igm, "")));
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
$(document).ready(function () {
    $(".listIndex a ").on("click", function () {
        var text = $(this).text();
        var selectedShow = $(".selectedShow");
        var textTypeIndex = $(this).parents("dl").index();
        var textType = $(this).parent("dd").siblings("dt").text();
        index = textTypeIndex - (2);
        $(".clearDd").show();
        $(".selectedShow").eq(index).show();
        $(this).addClass("selected").siblings().removeClass("selected");
        selectedShow.eq(index).find("span").text(textType);
        selectedShow.eq(index).find("label").text(text);

    });

    var cgfl0;
    var jyjg0;
    var jshzfs0;
    var txtaddr0;
    //var CheckSH0;
    var CheckZJ0;
    ////判断是哪一个a标签被选中，并且将标签中的数据保存，以待进一步传入后端处理
    $("#cgfl0 a").on("click", function () {
        cgfl0 = $(this).text();

    });
    $("#jyjg0 a").on("click", function () {
        jyjg0 = $(this).text();

    });
    $("#jshzfs0 a").on("click", function () {
        jshzfs0 = $(this).text();

    });

    /////读取input的数据一定要注意写keyup的事件，以保证读取文本信息的实时性，如果不加则读不出来，始终为空！！！！！
    $("#txtaddr0").on("keyup", function () {
        txtaddr0 = $("#txtaddr0").val();
    });


    $("#CheckZJ0").on("click", function () {
        CheckZJ0 = $("#CheckZJ0").is(':checked');
    });


    $("#search0").on("click", function btn_search0() {
        $.ajax({
            type: "post",
            url: "../ashx/jydt_list.ashx",
            dataType: "json",
            data: {
                "cgfl0": cgfl0,
                "jyjg0": jyjg0,
                "jshzfs0": jshzfs0,
                "txtaddr0": txtaddr0,
                "CheckZJ0": CheckZJ0,
                 //page:$page,
                

            },
            success: function (data) {
                DealPageing(data,1);
                
            }
        });
    });

    LoadDate(1, 6, DealPageing);

    $("#xqxxmenu").on("click",function xqxxmenutab() {
        LoadDate1(1, 6, DealPageing1);
    });
    
});

function DealPageing(data, $page) {
    var str = "";
    var label0 = '0';
    var label1 = '0';
    var pages = Math.ceil(data.total / 6);

        //CheckZJ0 = $("#CheckZJ0").is(':checked');
    
    $.each(data.rows, function ($index, $e) {
       
        //判断专家是否审核
        if ($e.isByExp == '1') {
            label1 = '1';
            label0 = '00';
        } else {
            label1 = '11';
            label0 = '0';
        }
        str += "<span class='yjwidth'>" +
                               "<a href='jydt_list_details.aspx?cgid="+$e.id+"'> <span class='yjimg'><img  src='" + $e.image_list + "'/></span>" +
                                "<span class='jymiddle'>" +
                                    " <span class='jyname'>成果名称：" + $e.CGName + "<span class='jylable" + label1 + "'>专家点评</span>" + "<span class='jylable" + label0 + "'>已审核</span>" + "</span>" +
                                    "<span class='jytime'>成果类型：" + $e.CGType + " &nbsp;&nbsp; 转让方式：" + $e.TransMode +
                                   " </br>成果介绍：" + $e.CGDetails_short + "</span>"+
                                   " </span></a>" +
                                "<span class='jyright'>发布者：<br />" + $e.CGCompany + "<a href='#'><span>查看团队</a></span></span>" +//这里加团队的链接
                                "</span>";
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
                LoadDate(page, 6, DealPageing);
            }
        }
        element.bootstrapPaginator(options);
    }
}

function LoadDate($page, $rows, $callback) {

 

    $.getJSON(
        "../ashx/jydt_list.ashx",
        {
            type: 1,
            row: $rows,
            page: $page,

        }).done(function (data) {
            $callback(data, $page);
        });
}



//function getDate(date0) {
//    ////var date = new Date(parseInt(date0.replace(/\D/igm, "")));
//    //var year = date.getFullYear();
//    //var month = date.getMonth() + 1;
//    //var day = date.getDate();
//    //return year + "-" + month + "-" + day;
//    var date = new Date(date0);
//    var year = date.getFullYear();
//    var month = date.getMonth() + 1;
//    var day = date.getDate();
//    return year + "-" + month + "-" + day;
//}

function DealPageing1(data, $page) {
    var str = "";
 
    var pages = Math.ceil(data.total / 6);

    //CheckZJ0 = $("#CheckZJ0").is(':checked');

    $.each(data.rows, function ($index, $e) {

       
        str += "<span class='yjwidth'>" +
                               "<a href='jydt_list_details_xq.aspx?cgid=" + $e.NeedID + "'> <span class='yjimg'><img  src='" + $e.image_list + "'/></span>" +
                                "<span class='jymiddle'>" +
                                    " <span class='jyname'>成果名称：" + $e.Name + "</span>" +
                                    "<span class='jytime'>成果类型：" + $e.BelongField + " &nbsp;&nbsp; 转让方式：" + $e.TransStyle +
                                   " </br>需求介绍：" + $e.BriefIntro.substring(0,140) + "</span>" +
                                   " </span></a>" +
                                "<span class='jyright'><a href='#'><span style='position:relative;top:30px;'>查看详情</a></span></span>" +
                                "</span>";
    });

    if (str == "") {
        str = "貌似没有数据";
    }
    $("#back1").html(str);
    if (data.total > 0) {
        var element = $('#pageUl1');//对应下面ul的ID
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
                LoadDate1(page, 6, DealPageing1);
            }
        }
        element.bootstrapPaginator(options);
    }
}

function LoadDate1($page, $rows, $callback) {



    $.getJSON(
        "../ashx/jydt_list.ashx",
        {
            type: 2,
            row: $rows,
            page: $page,

        }).done(function (data) {
            $callback(data, $page);
        });
}

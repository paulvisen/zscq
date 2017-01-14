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
    $("#txtaddr0").on("keyup",function () {
        txtaddr0 = $("#txtaddr0").val();
    });


    //$("#CheckSH0").on("click",function () {
    //    CheckSH0 = $("#CheckSH0").is(':checked');
    //    ////返回bool类型
    //});
   
    $("#CheckZJ0").on("click",function () {
        CheckZJ0 = $("#CheckZJ0").is(':checked');
    });

    //var sql="";
    ////将从前端读到的数据传到jydt_list.ashx，做读数据库的处理
    //if (cgfl0 != null && cgfl0 != "全部") {
    //    sql += " and CGType=" + cgfl0;
    //}

    //if (jyjg0 != null && jyjg0 != "不限") {
    //    if (jyjg0 == "1-10万") {
    //        sql += " and TransPrice between 1 and 10 ";
    //    }
    //    else if (jyjg0 == "10-20万") {
    //        sql += " and TransPrice between 10 and 20 ";
    //    }
    //    else if (jyjg0 == "20-100万") {
    //        sql += " and TransPrice between 20 and 100 ";
    //    }
    //    else if (jyjg0 == "100-500万") {
    //        sql += " and TransPrice between 100 and 500 ";
    //    }
    //    else if (jyjg0 == "500-1000万") {
    //        sql += " and TransPrice between 500 and 1000 ";
    //    }
    //    else if (jyjg0 == "1000万以上") {
    //        sql += " and TransPrice>1000 ";
    //    }
    //}

    //if (jshzfs0 != null && jshzfs0 != "不限") {
    //    sql += " and TransMode=" + jshzfs0;
    //}

    //if (txtaddr0 != null) {
    //    sql += " and CGPosition like '%" + txtaddr0 + "%'";
    //}
    //if (CheckZJ0) {
    //    sql += " and isByExp=1";
    //}

    document.getElementById("search0").onclick= function btn_search0() {
        $.ajax({
            type: "post",
            url: "../ashx/jydt_list.ashx",
            dataType: "json",
            data: {
                sql: sql

            },
            success: function () {
            }
        });
    }
  
    
});


var gainname = new Array(5);
var author = new Array(5);
var intro = new Array(5);
$(document).ready(function () {
    IniData(5, 1);
})


function IniData($rows, $currPage) {
    $.getJSON(
        "TeamPres.ashx",
        {
            type: "GoodGain",
            rows: $rows,
            page: $currPage,
        },
        function (data) {
            $.each
                   (data.rows, function ($index, $e) {
                       gainname[$index] = $e.CGName;
                       author[$index] = $e.PublisherName;
                       intro[$index] = $e.CGIntroduction;
                   });
        }
    )
}

function SearchTeam() {
    var iframeid = document.getElementById("teamListid");//获取团队列表iframe的id
    var teamType = $('#teamtype option:selected').val();//团队分类选中的值
    var region = $('#province option:selected').val() + $('#city option:selected').val();//所在地区选中的值
    var keyword = $('#keyword').val();//关键词输入值
    //alert(keyword);
    iframeid.src = "TeamList.aspx?sflag=1&teamType=" + teamType + "&region=" + region + "&keyword=" + keyword;//链接地址
}

$(function () {
    $('#carousel_example_generic').on('slid.bs.carousel', function () {
        var currentIndex = $('div.active').index();
        document.getElementById("liName").innerHTML = "<a href=\"#\">" + gainname[currentIndex] + "</a>";
        document.getElementById("h2Author").innerHTML = "发布者：" + author[currentIndex];
        if (intro[currentIndex].length > 150) {
            intro[currentIndex] = intro[currentIndex].substring(0, 150) + "...";
        }
        document.getElementById("pGainIntro").innerHTML = intro[currentIndex];
    })
})

$(".third ul li a").click(function () {
    $(".third ul li").each(function () {
        $(this).removeClass("active");
    })
    $(this).parent().attr("class", "active");
})


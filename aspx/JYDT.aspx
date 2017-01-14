<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JYDT.aspx.cs" Inherits="cgjy.aspx.JYDT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>交易大厅首页</title>
    <script src="../js/jquery-2.1.1.min.js"></script>
    <link href="../css/head_bottom.css" rel="stylesheet" />
    <link href="../css/jydt.css" rel="stylesheet" />
    <style type="text/css">
        .user_list {
            margin: 0px auto;
            background-color: rgb(232, 232, 232);
            height: 35px;
            width: 1200px;
            position: relative;
            top: 5px;
            border: rgb(192, 192, 192) solid 1px;
            font: 13px Microsoft YaHei;
            line-height: 35px;
        }

        .user_listL a {
            text-decoration: none;
            color: #000;
        }

        .user_listR a {
            text-decoration: none;
            color: #000;
        }

        .user_listL {
            position: relative;
            float: left;
            margin-left: 20px;
        }

        .user_listR {
            position: relative;
            float: right;
        }
    </style>
</head>
<body>
    <form runat="server">
        <%--<div class="frmJYDT">--%>
        <%-- 头部代码--%>
        <div class="head">
            <!--<%--横向标签栏--%>-->
            <nav class="animenu">
                <ul class="animenu__nav">
                    <li>
                        <a href="/Home.aspx">首页</a>
                    </li>
                    <li>
                        <a href="/Views/News/News.aspx">资讯&动态</a>
                    </li>
                    <li>
                        <a href="#">团队展示</a>
                    </li>
                    <li>
                        <a href="/aspx/JYDT.aspx">交易大厅</a>
                        <ul class="animenu__nav__child">
                            <li><a href="/aspx/jydt_list.aspx">供求对接</a></li>
                            <li><a href="/aspx/jydt_list.aspx">在线交易</a></li>
                            <li><a href="/aspx/jydt_list.aspx">在线竞拍</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/aspx/XXJY.aspx">线下活动</a>
                        
                    </li>
                    <li>
                        <a href="#">科技服务</a>
                    </li>
                    <li>
                        <a href="/Views/Downloads/Downloads.aspx">资料下载</a>
                    </li>
                    <li>
                        <a href="#">农产品商城</a>
                    </li>
                    <li>
                        <a href="#">订单农业</a>
                    </li>
                </ul>
            </nav>
            <!--<%--search标签栏--%>-->
            <div class="search_bar_holder">
                <div class="search_bar">
                    <div class="search_img">快速检索</div>
                    <div style="padding-top: 6px">
                        <input id="Text1" class="search" type="text" placeholder="搜索专利、专家、服务" />
                        <button class="search_btn">搜索</button>
                    </div>
                </div>
            </div>
        </div>


        <%-- 主要内容 --%>
        <div class="content">
            <%-- 用户栏 --%>
            <div class="user_list">
                <span class="user_listL"><a href="#">首页&nbsp;</a>><a href="#">&nbsp;交易大厅</a></span>
                <span class="user_listR">欢迎您，<asp:Label ID="username" runat="server" Text="XXXXXX"></asp:Label>用户！&nbsp;&nbsp;&nbsp;<a href="#">我的收藏&nbsp;&nbsp;&nbsp;</a><a href="#">我的交易&nbsp;&nbsp;&nbsp;</a><a href="../Manage/ManageMain.aspx">管理中心&nbsp;&nbsp;&nbsp;</a></span>
            </div>
            <%--<div class="contentjydt">--%>
            <%-- 主要内容-左边 --%>
            <div class="contentL">
                <%--行业类别栏 --%>
                <div class="fenlei">
                    <ul style="position: relative; top: 30px; padding: 0px; width: 240px;">
                        <li>
                            <h2 class="fenlei_head ">主要粮食作物成果</h2>
                            <div class="fenlei_list">
                                <a href="#">原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                                <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                            </div>
                            <div class="pop">
                                <h3><a href="#">主要粮食作物成果</a></h3>
                                <dl>
                                    <dt>原粮</dt>
                                    <dd>
                                        <a class="ui-link" href="#">西湖龙井</a>
                                        <a class="ui-link" href="#">龙井</a>
                                        <a class="ui-link" href="#">黄山毛峰</a>
                                        <a class="ui-link" href="#">安吉白茶</a>
                                        <a class="ui-link" href="#">其他绿茶</a>
                                    </dd>
                                    <dt>成品粮</dt>
                                    <dd>
                                        <a class="ui-link" href="#">白牡丹</a>
                                        <a class="ui-link" href="">白毫银针</a>
                                        <a class="ui-link" href="">寿眉</a>
                                        <a class="ui-link" href="">其他白茶</a>
                                    </dd>
                                    <dt>油料</dt>
                                    <dd>
                                        <a class="ui-link" href="#">白牡丹</a>
                                        <a class="ui-link" href="">白毫银针</a>
                                        <a class="ui-link" href="">寿眉</a>
                                        <a class="ui-link" href="">其他白茶</a>
                                    </dd>

                                </dl>
                            </div>
                        </li>


                        <li>
                            <h2 class="fenlei_head ">果蔬及花卉成果</h2>
                            <div class="fenlei_list">
                                <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                                <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                            </div>
                            <div class="pop">
                                <h3><a href="#">主要粮食作物成果</a></h3>
                                <dl>

                                    <dt>绿茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">西湖龙井</a>
                                        <a class="ui-link" href="#">龙井</a>
                                        <a class="ui-link" href="#">黄山毛峰</a>
                                        <a class="ui-link" href="#">安吉白茶</a>
                                        <a class="ui-link" href="#">其他绿茶</a>
                                    </dd>


                                    <dt>白茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">白牡丹</a>
                                        <a class="ui-link" href="">白毫银针</a>
                                        <a class="ui-link" href="">寿眉</a>
                                        <a class="ui-link" href="">其他白茶</a>
                                    </dd>

                                </dl>
                            </div>
                        </li>


                        <li>
                            <h2 class="fenlei_head ">林产品成果</h2>
                            <div class="fenlei_list">
                                <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                                <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                            </div>
                            <div class="pop">
                                <h3><a href="#">主要粮食作物成果</a></h3>
                                <dl>

                                    <dt>绿茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">西湖龙井</a>
                                        <a class="ui-link" href="#">龙井</a>
                                        <a class="ui-link" href="#">黄山毛峰</a>
                                        <a class="ui-link" href="#">安吉白茶</a>
                                        <a class="ui-link" href="#">其他绿茶</a>
                                    </dd>


                                    <dt>白茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">白牡丹</a>
                                        <a class="ui-link" href="">白毫银针</a>
                                        <a class="ui-link" href="">寿眉</a>
                                        <a class="ui-link" href="">其他白茶</a>
                                    </dd>

                                </dl>
                            </div>
                        </li>


                        <li>
                            <h2 class="fenlei_head ">畜牧产品成果</h2>
                            <div class="fenlei_list">
                                <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                                <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                            </div>
                            <div class="pop">
                                <h3><a href="#">主要粮食作物成果</a></h3>
                                <dl>

                                    <dt>绿茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">西湖龙井</a>
                                        <a class="ui-link" href="#">龙井</a>
                                        <a class="ui-link" href="#">黄山毛峰</a>
                                        <a class="ui-link" href="#">安吉白茶</a>
                                        <a class="ui-link" href="#">其他绿茶</a>
                                    </dd>


                                    <dt>白茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">白牡丹</a>
                                        <a class="ui-link" href="">白毫银针</a>
                                        <a class="ui-link" href="">寿眉</a>
                                        <a class="ui-link" href="">其他白茶</a>
                                    </dd>

                                </dl>
                            </div>
                        </li>


                        <li>
                            <h2 class="fenlei_head ">水产品成果</h2>
                            <div class="fenlei_list">
                                <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                                <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                            </div>
                            <div class="pop">
                                <h3><a href="#">主要粮食作物成果</a></h3>
                                <dl>

                                    <dt>绿茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">西湖龙井</a>
                                        <a class="ui-link" href="#">龙井</a>
                                        <a class="ui-link" href="#">黄山毛峰</a>
                                        <a class="ui-link" href="#">安吉白茶</a>
                                        <a class="ui-link" href="#">其他绿茶</a>
                                    </dd>


                                    <dt>白茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">白牡丹</a>
                                        <a class="ui-link" href="">白毫银针</a>
                                        <a class="ui-link" href="">寿眉</a>
                                        <a class="ui-link" href="">其他白茶</a>
                                    </dd>

                                </dl>
                            </div>
                        </li>


                        <li>
                            <h2 class="fenlei_head ">农资农机成果</h2>
                            <div class="fenlei_list">
                                <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                                <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                            </div>
                            <div class="pop">
                                <h3><a href="#">主要粮食作物成果</a></h3>
                                <dl>

                                    <dt>绿茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">西湖龙井</a>
                                        <a class="ui-link" href="#">龙井</a>
                                        <a class="ui-link" href="#">黄山毛峰</a>
                                        <a class="ui-link" href="#">安吉白茶</a>
                                        <a class="ui-link" href="#">其他绿茶</a>
                                    </dd>


                                    <dt>白茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">白牡丹</a>
                                        <a class="ui-link" href="">白毫银针</a>
                                        <a class="ui-link" href="">寿眉</a>
                                        <a class="ui-link" href="">其他白茶</a>
                                    </dd>

                                </dl>
                            </div>
                        </li>


                        <li>
                            <h2 class="fenlei_head ">其他成果</h2>
                            <div class="fenlei_list">
                                <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                                <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                            </div>
                            <div class="pop">
                                <h3><a href="#">主要粮食作物成果</a></h3>
                                <dl>

                                    <dt>绿茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">西湖龙井</a>
                                        <a class="ui-link" href="#">龙井</a>
                                        <a class="ui-link" href="#">黄山毛峰</a>
                                        <a class="ui-link" href="#">安吉白茶</a>
                                        <a class="ui-link" href="#">其他绿茶</a>
                                    </dd>


                                    <dt>白茶</dt>
                                    <dd>
                                        <a class="ui-link" href="#">白牡丹</a>
                                        <a class="ui-link" href="">白毫银针</a>
                                        <a class="ui-link" href="">寿眉</a>
                                        <a class="ui-link" href="">其他白茶</a>
                                    </dd>

                                </dl>
                            </div>
                        </li>

                    </ul>

                </div>
                <%--<div class="menu_list" id="firstpane">
                        <h3 class="menu_head current">主要粮食作物成果</h3>
                        <div style="display: block" class="menu_body">
                            <a href="#">五谷杂粮</a>
                            <a href="#">食用油</a>
                            <a href="#">调味品</a>
                        </div>
                        <h3 class="menu_head">果蔬及花卉成果</h3>
                        <div style="display: none" class="menu_body">
                            <a href="#">五谷杂粮</a>
                            <a href="#">食用油</a>
                            <a href="#">调味品</a>
                        </div>
                        <h3 class="menu_head">林产品成果</h3>
                        <div style="display: none" class="menu_body">
                            <a href="#">五谷杂粮</a>
                            <a href="#">食用油</a>
                            <a href="#">调味品</a>
                        </div>
                        <h3 class="menu_head">畜禽产品成果</h3>
                        <div style="display: none" class="menu_body">
                            <a href="#">五谷杂粮</a>
                            <a href="#">食用油</a>
                            <a href="#">调味品</a>
                        </div>
                        <h3 class="menu_head">水产品成果</h3>
                        <div style="display: none" class="menu_body">
                            <a href="#">五谷杂粮</a>
                            <a href="#">食用油</a>
                            <a href="#">调味品</a>
                        </div>
                        <h3 class="menu_head">农资农机成果</h3>
                        <div style="display: none" class="menu_body">
                            <a href="#">五谷杂粮</a>
                            <a href="#">食用油</a>
                            <a href="#">调味品</a>
                        </div>
                        <h3 class="menu_head">其他成果</h3>
                        <div style="display: none" class="menu_body">
                            <a href="#">五谷杂粮</a>
                            <a href="#">食用油</a>
                            <a href="#">调味品</a>
                        </div>
                    </div>
                    <script src="../js/jquery-1.11.0.min.js"></script>
                    <script>
                        $(document).ready(function () {
                            $("#firstpane .menu_body:eq(0)").show();
                            $("#firstpane h3.menu_head").click(function () {
                                $(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
                                $(this).siblings().removeClass("current");
                            });
                        });
                     </script>--%>
                <div style="float: left; position: relative; left: 20px;">
                    <a href="#">
                        <div class="col1">&nbsp;中介机构</div>
                    </a>
                    <a href="#">
                        <div class="col2">&nbsp;法务机构</div>
                    </a>
                    <a href="#">
                        <div class="col1">&nbsp;代理机构</div>
                    </a>
                    <a href="#">
                        <div class="col2">&nbsp;常用下载</div>
                    </a>
                    <div class="col3">
                        <img src="../images/kefu.png" />
                    </div>
                </div>

            </div>
            <%-- 主要内容-右边 --%>
            <div class="contentR">
                <%-- 交易公告 --%>
                <div class="jygg">
                    <a href="jygg.aspx" style="text-decoration: none; top: 18px; right: 15px; position: absolute;">&nbsp;&nbsp;&nbsp;</a>
                    <div class="jygg_details">
                        <div>
                            <table>
                                <tr style="height: 85px;">
                                    <td>
                                        <img src="../images/haibao0.jpg" style="width: 70px; height: 70px; margin: 5px;" />
                                    </td>
                                    <td colspan="3">
                                        <a href="jygg_details.aspx">
                                            <b>[交易公告]交易公告</b><br />
                                            我们将主动核实并第一时间向相关企业及政府主管部门反映您的投诉情况，同时也要求您对所填报信息的真实性负责，我们将严格保护您的权益，不泄露您的任何个人信息
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <ul style="margin-left: 0px;">
                                            <li style="margin-left: 0px;"><a href="jygz.aspx">[交易规则]交易规则<span style="float: right;">2016-10-11</span></a></li>
                                            <li><a href="jygg_details.aspx">[交易公告]交易公告名称<span style="float: right;">2016-10-11</span></a></li>
                                            <li><a href="jygg_details.aspx">[交易公告]交易公告名称<span style="float: right;">2016-10-11</span></a></li>
                                            <li><a href="jygg_details.aspx">[交易公告]交易公告名称<span style="float: right;">2016-10-11</span></a></li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                </div>
                <%-- 交易动态 --%>
                <div class="jydt">
                    <a href="jydt_list.aspx" style="text-decoration: none; top: 18px; right: 15px; position: absolute;">&nbsp;&nbsp;&nbsp;</a>
                    <div class="jygg_details">
                        <div>
                            <table>
                                <tr style="height: 85px;">
                                    <td>
                                        <img src="../images/haibao0.jpg" style="width: 70px; height: 70px; margin: 5px;" />
                                    </td>
                                    <td colspan="3">
                                        <a href="jydt_list_details.aspx?cgid=1">
                                            <b>[成果发布]苹果101</b><br />
                                            为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业权威的对话平台
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <ul>
                                            <li><a href="jydt_list_details_xq.aspx?cgid=1">[需求发布]芦荟需求<span style="float: right;">2016-10-11</span></a></li>
                                            <li><a href="jydt_list_details_xq.aspx?cgid=1">[需求发布]芦荟需求<span style="float: right;">2016-10-11</span></a></li>
                                            <li><a href="jydt_list_details_xq.aspx?cgid=1">[需求发布]芦荟需求<span style="float: right;">2016-10-11</span></a></li>
                                            <li><a href="jydt_list_details_xq.aspx?cgid=1">[需求发布]芦荟需求<span style="float: right;">2016-10-11</span></a></li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                </div>
                <%-- 交易统计 --%>
                <%--hcharts--%>
                <div class="jytj">
                    <div id="canvas" style="position: relative; top: 40px; width: 440px; height: 170px; float: left; margin-left: 10px;"></div>
                    <div id="canvas1" style="position: relative; top: 40px; width: 440px; height: 170px; float: left;"></div>
                </div>
                <script src="https://code.highcharts.com/highcharts.js"></script>
                <script src="https://code.highcharts.com/modules/exporting.js"></script>
                <style type="text/css">
                    .highcharts-credits, .highcharts-button-symbol, .highcharts-button-box {
                        display: none;
                    }
                </style>
                <script type="text/javascript">
                    $(function () {
                        $('#canvas').highcharts({
                            chart: {
                                plotBackgroundColor: null,
                                plotBorderWidth: null,
                                plotShadow: false
                            },
                            title: {
                                text: ''
                            },
                            tooltip: {
                                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                            },
                            plotOptions: {
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        style: {
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        }
                                    }
                                }
                            },
                            series: [{
                                type: 'pie',
                                name: 'Browser share',
                                data: [
                                    ['县级', 55],
                                    ['市级', 29],
                                    {
                                        name: '省级',
                                        y: 16,
                                        sliced: true,
                                        selected: true
                                    }

                                ]
                            }]
                        });
                        $('#canvas1').highcharts({
                            chart: {
                                plotBackgroundColor: null,
                                plotBorderWidth: null,
                                plotShadow: false
                            },
                            title: {
                                text: ''
                            },
                            tooltip: {
                                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                            },
                            plotOptions: {
                                pie: {
                                    allowPointSelect: true,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                        style: {
                                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                        }
                                    }
                                }
                            },
                            series: [{
                                type: 'pie',
                                name: 'Browser share',
                                data: [
                                    ['主要粮食作物成果', 20],
                                    ['林产品成果', 14],
                                    ['畜禽产品成果', 10],
                                    ['水产品成果', 5],
                                    ['农资农机产品成果', 25],
                                    ['其他产品成果', 10],
                                    {
                                        name: '果蔬及花卉成果',
                                        y: 16,
                                        sliced: true,
                                        selected: true
                                    }

                                ]
                            }]
                        });
                    });


                </script>
                <%-- 成果转让，成果求购 --%>
                <div class="cgzr_qg">
                    <!--tag标题-->
                    <ul id="nav">
                        <li><a href="javascript:void(0)" class="selected">成果转让</a></li>
                        <li><a href="javascript:void(0)" class="">求购信息</a></li>

                    </ul>
                    <a href="../Manage/ManageMain.aspx#chengguo/NeedPub.aspx"><span class="pub2"></span></a>
                    <a href="../Manage/ManageMain.aspx#chengguo/CGPub.aspx"><span class="pub1"></span></a>
                    <!--二级菜单-->
                    <div id="menu_con">
                        <div class="tag" style="display: block">
                            <table style="display: block; width: 580px; position: relative; left: 310px;">
                                <tr>
                                    <td style="height: 90px;">
                                        <a href="jydt_list_details.aspx?cgid=1">
                                            <b>苹果101号</b><span style="position: relative; float: right;">发布者：南京农科院</span>
                                            <br />
                                            为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业权威的对话平台，致力于整合优势资源、延伸全产业链、对接优质供应商和采购商，为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 90px;">
                                        <a href="jydt_list_details.aspx?cgid=2">
                                            <b>苹果102号</b><span style="position: relative; float: right;">发布者：南京农科院</span>
                                            <br />
                                            为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业权威的对话平台，致力于整合优势资源、延伸全产业链、对接优质供应商和采购商，为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <ul style="width: 810px; height: 150px; margin: 15px auto; display: block; line-height: 25px;">
                                <li style="position: relative; width: 360px; float: left;"><a href="jydt_list_details.aspx?cgid=1">苹果101号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="jydt_list_details.aspx?cgid=2">苹果102号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left;"><a href="jydt_list_details.aspx?cgid=3">苹果103号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="jydt_list_details.aspx?cgid=4">苹果104号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left;"><a href="jydt_list_details.aspx?cgid=5">苹果105号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="jydt_list_details.aspx?cgid=6">苹果106号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left;"><a href="jydt_list_details.aspx?cgid=7">苹果107号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="jydt_list_details.aspx?cgid=8">苹果108号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left;"><a href="jydt_list_details.aspx?cgid=9">苹果109号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="jydt_list_details.aspx?cgid=1">苹果101号<span style="position: relative; float: right;">南京农业大学</span> </a></li>
                            </ul>
                        </div>
                        <div class="tag" style="display: none">
                             <table style="display: block; width: 580px; position: relative; left: 310px;">
                                <tr>
                                    <td style="height: 90px;">
                                        <a href="/aspx/jydt_list_details_xq.aspx?cgid=1">
                                        <b>【芦荟需求】持久生命力芦荟需求</b><span style="position: relative; float: right;">发布者：南京农科院</span>
                                        <br />
                                       本店求购生命力强额芦荟品种，不仅是对本店的需求，更是对电脑前每一位客户的帮助。为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业权威的对话平台，致力于整合优势资源、延伸全产业链、对接优质供应商和采购商
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 90px;">
                                       <a href="/aspx/jydt_list_details_xq.aspx?cgid=1">
                                        <b>【芦荟需求】持久生命力芦荟需求</b><span style="position: relative; float: right;">发布者：南京农科院</span>
                                        <br />
                                       本店求购生命力强额芦荟品种，不仅是对本店的需求，更是对电脑前每一位客户的帮助。为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业权威的对话平台，致力于整合优势资源、延伸全产业链、对接优质供应商和采购商
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <ul style="width: 810px; height: 150px; margin: 15px auto; display: block; line-height: 25px;">
                                <li style="position: relative; width: 360px; float: left;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                                <li style="position: relative; width: 360px; float: left; margin-left: 80px;"><a href="/aspx/jydt_list_details_xq.aspx?cgid=1">成果名称<span style="position: relative; float: right;">南京农业大学</span></a></li>
                            </ul>
                        </div>
                        <script src="../js/tab_cgzr_qg.js"></script>
                    </div>
                </div>
                <%-- 竞拍大厅 --%>
                <div class="jpdt">
                    <table style="position: relative; top: 60px; text-align: center;">
                        <thead>
                            <tr>
                                <td style="width: 100px;">编号</td>
                                <td style="width: 150px;">成果名称</td>
                                <td style="width: 200px;">起始时间/剩余时间</td>
                                <td style="width: 100px;">起拍价格</td>
                                <td style="width: 100px;">当前价格</td>
                                <td style="width: 100px;">发起者</td>
                                <td style="width: 100px;">关注人数</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>成果名称</td>
                                <td>2017-01-01/100小时28分</td>
                                <td>100万</td>
                                <td>190万</td>
                                <td>江苏省农科院</td>
                                <td>30</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>成果名称</td>
                                <td>2017-01-01/100小时28分</td>
                                <td>100万</td>
                                <td>190万</td>
                                <td>江苏省农科院</td>
                                <td>30</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>成果名称</td>
                                <td>2017-01-01/100小时28分</td>
                                <td>100万</td>
                                <td>190万</td>
                                <td>江苏省农科院</td>
                                <td>30</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>成果名称</td>
                                <td>2017-01-01/100小时28分</td>
                                <td>100万</td>
                                <td>190万</td>
                                <td>江苏省农科院</td>
                                <td>30</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>成果名称</td>
                                <td>2017-01-01/100小时28分</td>
                                <td>100万</td>
                                <td>190万</td>
                                <td>江苏省农科院</td>
                                <td>30</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>成果名称</td>
                                <td>2017-01-01/100小时28分</td>
                                <td>100万</td>
                                <td>190万</td>
                                <td>江苏省农科院</td>
                                <td>30</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <%-- 优秀团队 --%>
                <div class="yxtd">
                    <table style="display: block; width: 860px; margin: 40px auto;">
                        <tbody>
                            <tr>
                                <td style="display: inline-block; background: url(../images/haibao0.jpg); background-size: cover; width: 180px; height: 240px; position: relative; margin: 5px 15px;">
                                    <span style="position: absolute; width: 100%; height: 80px; z-index: 2; background: #fff; opacity: 0.7; bottom: 0px; text-align: center; line-height: 25px;">江苏省农科院<br />
                                        地址：江苏省南京市<br />
                                        发布成果：232项
                                        
                                    </span>
                                </td>
                                <td style="display: inline-block; background: url(../images/haibao0.jpg); background-size: cover; width: 180px; height: 240px; position: relative; margin: 5px 15px;">
                                    <span style="position: absolute; width: 100%; height: 80px; z-index: 2; background: #fff; opacity: 0.7; bottom: 0px; text-align: center; line-height: 25px;">江苏省农科院<br />
                                        地址：江苏省南京市<br />
                                        发布成果：232项
                                        
                                    </span>
                                </td>
                                <td style="display: inline-block; background: url(../images/haibao0.jpg); background-size: cover; width: 180px; height: 240px; position: relative; margin: 5px 15px;">
                                    <span style="position: absolute; width: 100%; height: 80px; z-index: 2; background: #fff; opacity: 0.7; bottom: 0px; text-align: center; line-height: 25px;">江苏省农科院<br />
                                        地址：江苏省南京市<br />
                                        发布成果：232项
                                        
                                    </span>
                                </td>
                                <td style="display: inline-block; background: url(../images/haibao0.jpg); background-size: cover; width: 180px; height: 240px; position: relative; margin: 5px 15px;">
                                    <span style="position: absolute; width: 100%; height: 80px; z-index: 2; background: #fff; opacity: 0.7; bottom: 0px; text-align: center; line-height: 25px;">江苏省农科院<br />
                                        地址：江苏省南京市<br />
                                        发布成果：232项
                                        
                                    </span>
                                </td>

                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>

        <%-- 底部代码 --%>
        <div class="bottom">
            <div class="con1">
                <a href="#">新手指南</a><br />
                <a href="#">注册新用户</a>&nbsp;&nbsp;&nbsp;<a href="#">交易入门</a><br />
                <a href="#">交易规则</a>&nbsp;&nbsp;&nbsp;<a href="#">拍卖规则</a>
            </div>
            <div class="con2">
                <a href="#">新手指南</a><br />
                <a href="#">注册新用户</a>&nbsp;&nbsp;&nbsp;<a href="#">交易入门</a><br />
                <a href="#">交易规则</a>&nbsp;&nbsp;&nbsp;<a href="#">拍卖规则</a>
            </div>
            <div class="contact">
                <span>400-150-9966<br />
                    0515-86208888<br />
                </span>
                <span>周一至周日9:00 - 23:00</span><br />
                <button>联系客服</button>
            </div>
        </div>
        <%-- </div>--%>
    </form>

</body>
</html>

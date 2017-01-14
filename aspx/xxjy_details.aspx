<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xxjy_details.aspx.cs" Inherits="cgjy.aspx.xxjy_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>线下活动详情页</title>
    <link href="../css/head_bottom.css" rel="stylesheet" />
    <link href="../css/xxjy_details.css" rel="stylesheet" />
    <script src="../js/jQuery.js"></script>
    <script src="../js/xxjy_details.js"></script>
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
    <form id="form1" runat="server">
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
                <span class="user_listL"><a href="#">首页&nbsp;</a>><a href="#">&nbsp;线下交易</a>&nbsp;>&nbsp;线下交易详情</span>
                <span class="user_listR">欢迎您，<asp:Label ID="username" runat="server" Text="XXXXXX"></asp:Label>用户！&nbsp;&nbsp;&nbsp;<a href="#">我的收藏&nbsp;&nbsp;&nbsp;</a><a href="#">我的交易&nbsp;&nbsp;&nbsp;</a><a href="../Manage/ManageMain.aspx">管理中心&nbsp;&nbsp;&nbsp;</a></span>
            </div>
            <%-- 左边 --%>
            <div class="contentL">
                <div class="my">
                    <a href="#">
                        <h2>我的活动</h2>
                    </a>
                    <h3>我参加的活动</h3>
                    <ul class="my1">
                        <li>热门活动热门活动热门活动热门活动</li>
                        <li>热门活动热门活动热门活动热门活动</li>
                        <li>热门活动热门活动热门活动热门活动</li>

                    </ul>
                    <h3>我关注的活动</h3>
                    <ul class="my2">
                        <li>热门活动热门活动热门活动热门活动</li>
                        <li>热门活动热门活动热门活动热门活动</li>
                        <li>热门活动热门活动热门活动热门活动</li>

                    </ul>
                </div>
                <div class="rmL">
                    <div class="rmhd">

                        <ul class="rmhd_content">
                            <%-- 以下改成js写入 --%>
                            <li>热门活动热门活动热门活动热门活动</li>
                            <li>热门活动热门活动热门活动热门活动</li>
                            <li>热门活动热门活动热门活动热门活动</li>
                            <li>热门活动热门活动热门活动热门活动</li>
                            <li>热门活动热门活动热门活动热门活动</li>
                            <li>热门活动热门活动热门活动热门活动</li>

                        </ul>


                    </div>
                    <div class="rmzbdw">
                        <div class="rmzbdw_content">
                            <%--//////以下改成JavaScript写入--%>
                            <p>
                                <img src="../images/danwei.png" />热门主办单位
                            <span>发布活动 <span>123</span>场</span>
                            </p>
                            <p>
                                <img src="../images/danwei.png" />热门主办单位
                            <span>发布活动 <span>123</span>场</span>
                            </p>
                            <p>
                                <img src="../images/danwei.png" />热门主办单位
                            <span>发布活动 <span>123</span>场</span>
                            </p>
                            <p>
                                <img src="../images/danwei.png" />热门主办单位
                            <span>发布活动 <span>123</span>场</span>
                            </p>
                        </div>
                    </div>
                    <div class="hyyh">
                        <ul class="hyyh_content">
                            <li>赵某某<span>参加活动:20次</span></li>
                            <li>钱某某</li>
                            <li>孙某某</li>
                            <li>赵某某</li>
                            <li>钱某某</li>
                            <li>孙某某</li>
                        </ul>
                    </div>
                </div>
            </div>
            <%-- 右边 --%>
            <div class="contentR">
                <div class="xxhd_head">
                    <h1   id="xxjy_name"><%--线下活动标题--%></h1>
                    <p id="xxjy_time" ><%--起止时间：2016-11-11 至 2016-12-14 &nbsp;&nbsp; 活动主办方：江苏省农科院 &nbsp;&nbsp;活动地点：南京市玄武区--%></p>
                    <div class="jianjie" id="details" runat="server">
                        线下活动线下活动线下活动线下活动线下活动线下活动线下活动线下活动线下活动线下活动线下活动线下活动线下活动线下活动线下线下活动线下活动线下活动线下。
                        
                    </div>
                </div>
               
                <div class="xxhd_neirong">
                    <h1>活动主要内容</h1>
                     <link href="../css/style.css" rel="stylesheet" />
                    <script src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
                    <script src="../js/unslider.js"></script>
                    <script>
                        $(function () {
                            $('.banner').unslider({ dots: true });
                        });
                    </script>

                    <div class="banner "style=" width: 850px;height:300px; margin:10px auto;">
                        <ul  id="ul0" >
                            <li  id="limg1" style="/*background-image: url(../images/haibao0.jpg);*/background-size: cover; background-repeat: no-repeat; background-position: center center;"></li>
                            <li   id="limg2"  style="/*background-image: url(../images/haibao0.jpg);*/ background-size: cover; background-repeat: no-repeat; background-position: center center;"></li>
                            <li  id="limg3" style="/*background-image: url(../images/haibao0.jpg);*/ background-size: cover; background-repeat: no-repeat; background-position: center center;"></li>
                        </ul>
                    </div>
                    
                    <div id="xxhd_neirong">
        
                    </div>
                </div>
                <div class="xxhd_dianhua">
                    <h1 style="">热线电话：<label id="Lblphone"></label></h1>
                    <div>
                        <a href="#"><span>立即报名！</span></a>
                        <a href="#"><span style="background:rgb(235,104,65)">添加收藏</span></a>
                    </div>
                </div>
                <div class="xxhd_richeng">
                    <h1>活动日程</h1>
                    <div id="xxhd_richeng" >
                     
                    </div>
                </div>
                <div class="xxhd_hezuo">
                    <h1>合作单位/参展单位</h1>

                    <div id="xxhd_hezuo" runat="server">
                        <div class="hezuo_com">
                            <table>
                                <tr>
                                    <td>
                                        <a href="#">
                                            <img src="../images/danwei.png" style="width: 100px; height: 100px;" /></a>
                                    </td>
                                    <td style="width: 20px;"></td>



                                    <td>
                                        <b>公司名称：</b><a href="#">东南大学</a><br />

                                        <b>公司介绍：</b>公司是扬州五亭食品有限公司投资的民营企业。公司投资规模3800万元，注册资本1030万元，公司占地38666平方米注册资本1030万元,注册资本1030万元，公司占地38666平方米注册资本1030万元..
                                    </td>


                                </tr>
                            </table>
                        </div>
                        <div class="hezuo_com">
                            <table>
                                <tr>
                                    <td>
                                        <a href="#">
                                            <img src="../images/danwei.png" style="width: 100px; height: 100px;" /></a>
                                    </td>
                                    <td style="width: 20px;"></td>



                                    <td>
                                        <b>公司名称：</b><a href="#">东南大学</a><br />

                                        <b>公司介绍：</b>公司是扬州五亭食品有限公司投资的民营企业。公司投资规模3800万元，注册资本1030万元，公司占地38666平方米注册资本1030万元,注册资本1030万元，公司占地38666平方米注册资本1030万元..
                                    </td>


                                </tr>
                            </table>
                        </div>
                    </div>
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
    </form>
</body>
</html>

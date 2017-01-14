<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XXJY.aspx.cs" Inherits="cgjy.aspx.XXJY" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>线下活动首页</title>
    <script src="../js/jQuery.js"></script>
    <%--<script src="../js/jquery-1.4.3.min.js"></script>--%>

    <%--<script src="../js/jquery-1.11.0.min.js"></script>--%>
    <link href="../css/head_bottom.css" rel="stylesheet" />

    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-paginator.min.js"></script>
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../css/xxjy.css" rel="stylesheet" />
    <script src="../js/xxjy.js"></script>
      <style type="text/css">
           .user_list {
    margin: 0px auto;
    background-color: rgb(232, 232, 232);
    height: 35px;
    width: 1200px;
    position: relative;
    top: 5px;
    border: rgb(220,220,220) solid 1px;
    font: 13px Microsoft YaHei;
    line-height: 30px;
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
    <%--<link href="../css/bootstrap.min.css" rel="stylesheet" />--%>
</head>
<body>
    <form id="form1" runat="server">
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

        <%-- <div class="user_list">
            <span class="user_listL"><a href="#">首页&nbsp;</a>><a href="#">&nbsp;交易大厅</a>><a href="#">&nbsp;成果列表</a></span>
            <span class="user_listR">欢迎您，<asp:Label ID="Label1" runat="server" Text="XXXXXX"></asp:Label>用户！&nbsp;&nbsp;&nbsp;<a href="#">我的收藏&nbsp;&nbsp;&nbsp;</a><a href="#">我的交易&nbsp;&nbsp;&nbsp;</a><a href="#">管理中心&nbsp;&nbsp;&nbsp;</a></span>
        </div>--%>
        <%-- 主要内容 --%>

        <div class="content">
            <%-- 用户栏 --%>
            <div class="user_list">
                <span class="user_listL"><a href="#">首页&nbsp;</a>><a href="#">&nbsp;线下交易</a></span>
                <span class="user_listR">欢迎您，<asp:Label ID="username" runat="server" Text="XXXXXX"></asp:Label>用户！&nbsp;&nbsp;&nbsp;<a href="#">我的收藏&nbsp;&nbsp;&nbsp;</a><a href="#">我的交易&nbsp;&nbsp;&nbsp;</a><a href="../Manage/ManageMain.aspx">管理中心&nbsp;&nbsp;&nbsp;</a></span>
            </div>
            <%-- 详细内容 --%>
            <div class="contentL">
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

            <div class="contentR">
                <div class="hb">
                    <a href="#">
                        <div class="bm">立即报名</div>
                    </a>
                </div>
                <div class="hdtj">
                    <span>活动场次<span>5555</span>场</span>
                    <span>参与人数<span>1111</span>人</span>
                    <span>实现对接<span>2222</span>次</span>
                    <span>达成意向<span>3333</span>次</span>
                </div>
                <div class="hdlb_chzn">
                    <ul id="nav">
                        <li><a href="javascript:void(0)" class="selected">活动列表</a></li>
                        <li><a href="javascript:void(0)" class="">参会指南</a></li>

                    </ul>
                    <a href="/Manage/ManageMain.aspx#chengguo/XXJYPub.aspx"><span class="pub1"></span></a>

                    <!--二级菜单-->
                    <div id="menu_con">
                        <div class="tag" style="display: block;">
                            <span id="back" style="display: block; height: 885px;"></span>
                            <%-- <span class="yjwidth">
                                <span class="yjimg"><img  src="../images/danwei.png"/></span>
                                <span class="jymiddle">
                                     <span class="jyname">活动名称：活动名称测试<span class="jylable0">计划中</span></span>
                                    <span class="jytime">起止时间：2016-11-11 至 2016-12-14 &nbsp;&nbsp; 活动主办方：江苏省农科院 &nbsp;&nbsp;活动地点：南京市玄武区</span>
                                    <span class="jydetail">
                                        活动介绍：活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介
                                    </span>
                                </span>
                                <a href="#"><span class="jyright">
                                    查看详情
                                </span></a>
                            </span>
                              <span class="yjwidth">
                                <span class="yjimg"><img  src="../images/danwei.png"/></span>
                                <span class="jymiddle">
                                     <span class="jyname">活动名称：活动名称测试活动名称测试
                                     <span class="jylable1">进行中</span></span>
                                    <span class="jytime">起止时间：2016-11-11 至 2016-12-14 &nbsp;&nbsp; 活动主办方：江苏省农科院 &nbsp;&nbsp;活动地点：南京市玄武区</span>
                                    <span class="jydetail">
                                        活动介绍：活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介
                                    </span>
                                </span>
                                <a href="#"><span class="jyright">
                                    查看详情
                                </span></a>
                            </span>
                              <span class="yjwidth">
                                <span class="yjimg"><img  src="../images/danwei.png"/></span>
                                <span class="jymiddle">
                                     <span class="jyname">活动名称：活动名称测试
                                     <span class="jylable2">已结束</span></span>
                                    <span class="jytime">起止时间：2016-11-11 至 2016-12-14 &nbsp;&nbsp; 活动主办方：江苏省农科院 &nbsp;&nbsp;活动地点：南京市玄武区</span>
                                    <span class="jydetail">
                                        活动介绍：活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介活动简介
                                    </span>
                                </span>
                                <a href="#"><span class="jyright">
                                    查看详情
                                </span></a>
                            </span>--%>
                            <span style="font-size: 14px;" class="_pgpage">
                                <ul class="pagination" id="pageUl"></ul>
                            </span>
                        </div>



                        <div class="tag" style="display: none">
                            这里是参会指南  
                        </div>
                        <script src="../js/tab_cgzr_qg.js"></script>
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
        <%-- </div>--%>
    </form>
</body>
</html>

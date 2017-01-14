<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jydt_list_details.aspx.cs" Inherits="cgjy.aspx.jydt_list_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/head_bottom.css" rel="stylesheet" />
    
    <script src="../js/jQuery.js"></script>
    <script src="../js/jquery-2.1.1.min.js"></script>
     <script src="../js/artDialog/artDialog.js?skin=twitter"></script>
     <script src="../js/artDialog/plugins/iframeTools.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-paginator.min.js"></script>
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/jydt.css" rel="stylesheet" />
    <script src="../js/jydt_list_details.js"></script>
    <link href="../css/jydt_list_details.css" rel="stylesheet" />
   
    <title></title>
      <style type="text/css">
           *, *:after, *:before {
            box-sizing: border-box;
        }

        .animenu__nav__child > li {
            width: 100%;
            border-bottom: 1px solid #515151;
        }
           .user_list {
    margin: 0px auto;
    background-color: rgb(232, 232, 232);
    height: 32px;
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
.fenlei ul li {
        height:85px;
        }
          .pop {
          
          height:595px;
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
            <div class="contentR" id="maincontent" runat="server">

                <div class="cgjbxx" id="cgjbxx">
                    <!-- <div class="tupianhead">
                        成果基本信息
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td colspan="2"><b>成果名称：</b></td>
                                
                            </tr>
                            <tr>
                                <td><b>成果类型：</b></td>
                                <td><b>参考价格：</b></td>
                                
                            </tr>
                            <tr>
                                <td><b>成果状态：</b></td>
                                <td><b>是否审核认证：</b></td>
                                
                            </tr>
                        </tbody>
                    </table>-->
                </div>
                <div class="fbdwxx" id="fbdwxx" >
                    <%-- <div class="tupianhead">
                        成果发布单位信息
                    </div>
                    <table class="fbdwxxbody">
                        <tbody>
                            <tr>
                                <td colspan="2"><b>单位名称：</b>东南大学</td>
                                
                            </tr>
                            <tr>
                                <td colspan="2"><b>单位简介：</b>简介呀简介呀简介呀</td>
                                
                                
                            </tr>
                             <tr>
                                <td ><b>成果数量：</b>123</td>
                                <td><b>交易成功（次）：</b>99</td>
                            </tr>
                            <tr>
                                <td colspan="2"><a href="#"><span class="fadwxxbody_sp">查看单位详情</span></a></td>
                                
                                
                            </tr>
                        </tbody>
                    </table> --%>
                </div>
                <div class="cg_dianhua">
                    <%--<h1 style="">热线电话：<label id="Lblphone"></label></h1>--%>
                    <div>
                        <span class="btnin"  onclick="addshop0()" id="buy0" runat="server"  >立即购买 </span>
                         <span class="btnin"  onclick="deleteshop0()" id="buy1" runat="server" Visible="false" >取消购买 </span>
                        <%--<button class="btnin"  style="background: rgb(235,104,65);"  id="bookmark" runat="server" onclick="Button1_Click()" >添加收藏</button>--%>
                        <%--<button class="btnin"  style="background: rgb(235,104,65);"  id="bookmark0" runat="server" onclick="Button1_Click()" >添加收藏</button>--%>
                        <asp:Button ID="bookmark0" runat="server" Text="添加收藏" class="btnin"  style="background: rgb(235,104,65);" OnClick="bookmark0_Click" />
                        <asp:Button ID="bookmark1" runat="server" Text="取消收藏" class="btnin"  style="background: rgb(235,104,65); " Visible="false" OnClick="bookmark1_Click" />
                    </div>
                </div>
                <div class="tupian" id="tupian">
                   <%-- <div class="tupianhead">
                        成果图片
                    </div>
                    <div class="tupianbody">
                        
                            <img src="../images/haibao0.jpg" />
                            <img src="../images/haibao0.jpg" />
                            <img src="../images/haibao0.jpg" />
                            <img src="../images/haibao0.jpg" />
                       
                    </div>--%>
                </div>

                <%--////tab--%>
                <div class="cgxx" >
                    <!--tag标题-->
                    <ul id="nav">
                        <li><a href="javascript:void(0)" class="selected">成果信息</a></li>
                        <li><a href="javascript:void(0)" class="">成果介绍</a></li>
                        <%--<li><a href="javascript:void(0)" class="">团队信息</a></li>--%>
                        <%--<li><a href="javascript:void(0)" class="" onclick="showtab(this,'_xqyh')">需求用户</a></li>--%>

                    </ul>
                    <a href="jygz.aspx"><span class="pub2">查看交易规则</span></a>
                    <!--二级菜单-->
                    <div id="menu_con">
                        <div class="tag_cg" style="display: block" id="cgjbxxdjb">
                            <%--<table width="100%" border="0" class=" _ft11">
                                <thead><tr ><td colspan="4" >成果交易信息登记表</td></tr></thead>
                                <tbody>
                                    <tr>
                                        <td colspan="2"><b>单位：</b></td>
                                        <td><b>联系人：</b></td>
                                        <td><b>电话：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>成果名称：</b></td>
                                        <td colspan="2"><b>品种审定号或专利号：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>成果完成团队：</b></td>
                                        <td><b>主要完成人：</b></td>
                                        <td><b>电话：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>成果类型：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>拟转化方式：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>拟转让价格：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>拟合作企业：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>成果简要介绍：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>单位意见：</b></td>
                                        <td colspan="2"><b>院主管部门意见：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>备注：</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>专家意见：</b></td>
                                    </tr>
                                    
                                </tbody>
                            </table>--%>
                        </div>
                        <div class="tag_cg" style="display: none" id="cgjs">
                            <%--<p>圆锥花序大型疏展，长约30厘米，分枝多，棱粗糙，成熟期向下弯垂；小穗含1成熟花，两侧甚压扁，长圆状卵形至椭圆形，长约10毫米，宽2-4毫米；颖极小，仅在小穗柄先端留下半月形的痕迹，退化外稃2枚，锥刺状，长2-4毫米；两侧孕性花外稃质厚，具5脉，中脉成脊，表面有方格状小乳状突起，厚纸质，遍布细毛端毛较密，有芒或无芒；内稃与外稃同质，具3脉，先端尖而无喙；雄蕊6枚，花药长2-3毫米。</p>--%>
                        </div>
                        <%--<div class="tag_cg" style="display: none" id="tdxx">
                            <table width="100%" border="0" class=" _ft13">
                                <tbody>
                                    <tr>
                                        <td rowspan="4">
                                            <img class="_pic100" src="../images/danwei.png" /></td>
                                        <td rowspan="4" class="tdgap"></td>
                                        <td><b>团队带头人:</b></td>

                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>团队介绍:</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>研究方向:</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>重大成果:</b>
                                        </td> 
                                    </tr>
                                </tbody>
                            </table>
                        </div>--%>
                       <%-- <div class="tag_cg" style="display: none" id="xqyh" >
                            <span class="xqqy">
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
                            </span>
                            <span class="xqqy">
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
                            </span>
                        </div>--%>
                        <script src="../js/tab_cgzr_qg.js"></script>
                    </div>
                </div>
                <div class="lscg" id="lscg">
                     <div class="tupianhead">
                        类似成果<a href="JYDT_list.aspx"><span style="display:block;width:70px;height:40px;float:right;color:gray">MORE></span></a>
                    </div>
                    <span class="yjwidth">
                           <a href="#"> <span class="yjimg">
                                <img src="../images/danwei.png" /></span>
                            <span class="jymiddle">
                                <span class="jyname">活动名称：活动名称测试活动名称测试
                                    <%-- <span class="jylable0">已审核</span><span class="jylable1">专家点评</span>--%></span>
                                <span class="jytime">成果类型：专有技术 &nbsp;&nbsp; 转让方式：所有权转让 &nbsp;&nbsp;
                                <br />活动介绍：为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业权威的对话平台，致力于整合优势资源、延伸全产业链、对接优质供应商和采购商，为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业
                                </span>
                            </span></a>
                            <span class="jyright">发布者：<br />江苏省农业科学院
                                <a href="#"><span>查看团队</span></a>
                            </span>
                        </span>
                   
                       <span class="yjwidth">
                           <a href="#"> <span class="yjimg">
                                <img src="../images/danwei.png" /></span>
                            <span class="jymiddle">
                                <span class="jyname">活动名称：活动名称测试活动名称测试
                                    <%-- <span class="jylable0">已审核</span><span class="jylable1">专家点评</span>--%></span>
                                <span class="jytime">成果类型：专有技术 &nbsp;&nbsp; 转让方式：所有权转让 &nbsp;&nbsp;
                                <br />活动介绍：为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业权威的对话平台，致力于整合优势资源、延伸全产业链、对接优质供应商和采购商，为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业
                                </span>
                            </span></a>
                            <span class="jyright">发布者：<br />江苏省农业科学院
                                <a href="#"><span>查看团队</span></a>
                            </span>
                        </span>
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

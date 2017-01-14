<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JYDT_list.aspx.cs" Inherits="cgjy.aspx.JYDT_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>交易大厅成果转让、求购、竞价拍卖列表</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <%--<script src="../js/jquery-1.4.3.min.js"></script>--%>
    <%--<script src="../js/jQuery.js"></script>--%>
    <%--分页--%>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-paginator.min.js"></script>
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />

    <link href="../css/head_bottom.css" rel="stylesheet" />

    <link href="../css/jydt_list.css" rel="stylesheet" />
    <script src="../js/jydt_list.js"></script>
    <%--获取数据--%>

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
                <span class="user_listL"><a href="#">首页&nbsp;</a>><a href="#">&nbsp;交易大厅</a></span>
                <span class="user_listR">欢迎您，<asp:Label ID="username" runat="server" Text="XXXXXX"></asp:Label>用户！&nbsp;&nbsp;&nbsp;<a href="#">我的收藏&nbsp;&nbsp;&nbsp;</a><a href="#">我的交易&nbsp;&nbsp;&nbsp;</a><a href="../Manage/ManageMain.aspx">管理中心&nbsp;&nbsp;&nbsp;</a></span>
            </div>
            <ul id="nav">
                <li><a href="javascript:void(0)" class="selected">成果转让</a></li>
                <li id="xqxxmenu" onclick="xqxxmenutab()"><a href="javascript:void(0)" class="" >需求信息</a></li>
                <li><a href="javascript:void(0)" class="">成果竞拍</a></li>
            </ul>

            <!--二级菜单-->
            <div id="menu_con">
                <div class="tag" id="cgzr" style="display: block">
                    <span id="selectList0" class="screenBox ">

                        <dl class="listIndex">
                            <dt>成果分类：</dt>
                            <dd id="cgfl0">
                                <a href="javascript:void(0)" class="selected">全部</a>
                                <a href="javascript:void(0)">主要粮食作物</a>
                                <a href="javascript:void(0)">果蔬及花卉成果</a>
                                <a href="javascript:void(0)">林产品成果</a>
                                <a href="javascript:void(0)">畜牧产品成果</a>
                                <a href="javascript:void(0)">水产品成果</a>
                                <a href="javascript:void(0)">农资农机成果</a>
                                <a href="javascript:void(0)">其他农副产品成果</a>
                            </dd>

                        </dl>

                        <dl class="listIndex">
                            <dt>交易价格：</dt>
                            <dd id="jyjg0">
                                <a href="javascript:void(0)" class="selected">不限</a>
                                <%--<a href="javascript:void(0)">面议</a>--%>
                                <a href="javascript:void(0)">1-10万</a>
                                <a href="javascript:void(0)">10-20万</a>
                                <a href="javascript:void(0)">20-100万</a>
                                <a href="javascript:void(0)">100-500万</a>
                                <a href="javascript:void(0)">500-1000万</a>
                                <a href="javascript:void(0)">1000万以上</a></dd>
                        </dl>
                        <dl class="listIndex">
                            <dt>技术合作方式：</dt>
                            <dd id="jshzfs0">
                                <a href="javascript:void(0)" class="selected">不限</a>
                                <a href="javascript:void(0)">完全转让</a>
                                <a href="javascript:void(0)">许可转让</a>
                                <a href="javascript:void(0)">技术入股</a>
                                <a href="javascript:void(0)">合作生产</a>
                                <a href="javascript:void(0)">其他</a></dd>
                        </dl>
                        <dl class=" listIndex">
                            <dt>所在地区：</dt>
                            <dd>
                                <input id="txtaddr0" name="txtaddr0" type="text" placeholder="填写所在地区" style="height: 25px;" />&nbsp;&nbsp;&nbsp;&nbsp;
                                   <%-- <asp:CheckBox ID="CheckSH0" runat="server" />
                                通过审核 &nbsp;&nbsp;&nbsp;&nbsp;--%>
                                <asp:CheckBox ID="CheckZJ0" runat="server" />
                                有专家意见
                                     <input style="width: 80px; margin: 0px; height: 30px; line-height: 20px; background: rgb(29,98,189); float: right; color: #fff; text-align: center;" id="search0" type="button" value="搜索" <%--onclick="javascript:btn_search0()"--%> />
                            </dd>
                        </dl>

                    </span>

                    <span class="search_list">
                        <a href="#" class="search_list1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <input id="txtSearch0" type="text" placeholder="搜索成果" style="height: 25px;" class="search_list5" />
                        <a href="#" class="search_list6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </span>
                    <span class="cg_list" style="display: block;">
                        <span id="back" style="display: block; height: 770px;"></span>
                        <%-- <span class="yjwidth">
                           <a href="#"> <span class="yjimg">
                                <img src="../images/danwei.png" /></span>
                            <span class="jymiddle">
                                <span class="jyname">活动名称：活动名称测试活动名称测试
                                     <span class="jylable0">已审核</span><span class="jylable1">专家点评</span></span>
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
                                     <span class="jylable0">已审核</span><span class="jylable1">专家点评</span></span>
                                <span class="jytime">成果类型：专有技术 &nbsp;&nbsp; 转让方式：所有权转让 &nbsp;&nbsp;
                                <br />活动介绍：为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业权威的对话平台，致力于整合优势资源、延伸全产业链、对接优质供应商和采购商，为满足人民群众日益增长的绿色生活需求，贯彻落实“十三五规划”的理念，中国国际有机食品和绿色食品博览会作为行业
                                </span>
                            </span></a>
                            <span class="jyright">发布者：<br />江苏省农业科学院
                                <a href="#"><span>查看团队</span></a>
                            </span>
                        </span>--%>
                        <span style="font-size: 14px;" class="_pgpage">
                            <ul class="pagination" id="pageUl"></ul>
                        </span>
                    </span>

                    <span class="rm_list">本处放热门成果</span>
                    <a href="../Manage/ManageMain.aspx#chengguo/CGPub.aspx"><span class="pub1"></span></a>
                    <a href="../Manage/ManageMain.aspx#chengguo/NeedPub.aspx"><span class="pub2"></span></a>
                </div>

                <div class="tag" id="xqxx" style="display: none">
                    <span id="selectList1" class="screenBox ">

                        <dl class="listIndex">
                            <dt>成果分类：</dt>
                            <dd id="cgfl1">
                                <a href="javascript:void(0)" class="selected">全部</a>
                                <a href="javascript:void(0)">主要粮食作物</a>
                                <a href="javascript:void(0)">果蔬及花卉成果</a>
                                <a href="javascript:void(0)">林产品成果</a>
                                <a href="javascript:void(0)">畜牧产品成果</a>
                                <a href="javascript:void(0)">水产品成果</a>
                                <a href="javascript:void(0)">农资农机成果</a>
                                <a href="javascript:void(0)">其他农副产品成果</a>
                            </dd>

                        </dl>

                        <dl class="listIndex">
                            <dt>交易价格：</dt>
                            <dd id="jyjg1">
                                <a href="javascript:void(0)" class="selected">不限</a>
                                <%--<a href="javascript:void(0)">面议</a>--%>
                                <a href="javascript:void(0)">1-10万</a>
                                <a href="javascript:void(0)">10-20万</a>
                                <a href="javascript:void(0)">20-100万</a>
                                <a href="javascript:void(0)">100-500万</a>
                                <a href="javascript:void(0)">500-1000万</a>
                                <a href="javascript:void(0)">1000万以上</a></dd>
                        </dl>
                        <dl class="listIndex">
                            <dt>技术合作方式：</dt>
                            <dd id="jshzfs1">
                                <a href="javascript:void(0)" class="selected">不限</a>
                                <a href="javascript:void(0)">完全转让</a>
                                <a href="javascript:void(0)">许可转让</a>
                                <a href="javascript:void(0)">技术入股</a>
                                <a href="javascript:void(0)">合作生产</a>
                                <a href="javascript:void(0)">其他</a></dd>
                        </dl>
                        <dl class=" listIndex">
                            <dt>所在地区：</dt>
                            <dd>
                                <input id="txtaddr1" name="txtaddr0" type="text" placeholder="填写所在地区" style="height: 25px;" />&nbsp;&nbsp;&nbsp;&nbsp;
                                   <%-- <asp:CheckBox ID="CheckSH0" runat="server" />
                                通过审核 &nbsp;&nbsp;&nbsp;&nbsp;--%>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                有专家意见
                                     <input style="width: 80px; margin: 0px; height: 30px; line-height: 20px; background: rgb(29,98,189); float: right; color: #fff; text-align: center;" id="search0" type="button" value="搜索" <%--onclick="javascript:btn_search0()"--%> />
                            </dd>
                        </dl>

                    </span>

                    <span class="search_list">
                        <a href="#" class="search_list1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <input id="txtSearch1" type="text" placeholder="搜索成果" style="height: 25px;" class="search_list5" />
                        <a href="#" class="search_list6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </span>
                    <span class="cg_list" style="display: block;">
                        <span id="back1" style="display: block; height: 770px;"></span>
                       
                        <span style="font-size: 14px;" class="_pgpage">
                            <ul class="pagination" id="pageUl1"></ul>
                        </span>
                    </span>

                    <span class="rm_list">本处放热门成果</span>
                    <a href="#"><span class="pub1"></span></a>
                    <a href="#"><span class="pub2"></span></a>

                </div>

                <div class="tag" id="cgjp" style="display: none">
                    <span id="selectList2" class="screenBox ">
                        <dl class="listIndex">
                            <dt>成果分类：</dt>
                            <dd>
                                <a href="javascript:void(0)" class="selected">全部</a>
                                <a href="javascript:void(0)">主要粮食作物</a>
                                <a href="javascript:void(0)">果蔬及花卉成果</a>
                                <a href="javascript:void(0)">林产品成果</a>
                                <a href="javascript:void(0)">畜牧产品成果</a>
                                <a href="javascript:void(0)">水产品成果</a>
                                <a href="javascript:void(0)">农资农机成果</a>
                                <a href="javascript:void(0)">其他农副产品成果</a>
                        </dl>
                        <dl class="listIndex">
                            <dt>交易价格：</dt>
                            <dd>
                                <a href="javascript:void(0)" class="selected">不限</a>
                                <a href="javascript:void(0)">面议</a>
                                <a href="javascript:void(0)">1-10万</a>
                                <a href="javascript:void(0)">11-20万</a>
                                <a href="javascript:void(0)">20-100万</a>
                                <a href="javascript:void(0)">100-500万</a>
                                <a href="javascript:void(0)">500-1000万</a>
                                <a href="javascript:void(0)">1000万以上</a></dd>
                        </dl>
                        <dl class="listIndex">
                            <dt>技术合作方式：</dt>
                            <dd>
                                <a href="javascript:void(0)" class="selected">不限</a>
                                <a href="javascript:void(0)">完全转让</a>
                                <a href="javascript:void(0)">许可转让</a>
                                <a href="javascript:void(0)">技术入股</a>
                                <a href="javascript:void(0)">合作生产</a>
                                <a href="javascript:void(0)">其他</a></dd>
                        </dl>
                        <dl class=" listIndex">
                            <dt>所在地区：</dt>
                            <dd>
                                <input id="txtaddr2" type="text" placeholder="填写所在地区" style="height: 25px;" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:CheckBox ID="CheckBox3" runat="server" Checked="false" />
                                通过审核 &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:CheckBox ID="CheckBox4" runat="server" Checked="false" />
                                有专家意见
                                     <a style="width: 80px; margin: 0px; height: 30px; line-height: 20px; background: rgb(29,98,189); float: right; color: #fff; text-align: center;" href="#">搜索</a>
                            </dd>
                        </dl>

                    </span>
                    <%--<script src="../js/select_list.js"></script>--%>
                    <span class="search_list">
                        <a href="#" class="search_list1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <a href="#" class="search_list4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        <input id="txtSearch2" type="text" placeholder="搜索成果" style="height: 25px;" class="search_list5" />
                        <a href="#" class="search_list6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </span>
                    <span class="cg_list">本处放从数据库中读到成果的数据
                    </span>
                    <span class="rm_list">本处放热门成果</span>
                    <a href="#"><span class="pub1"></span></a>
                    <a href="#"><span class="pub2"></span></a>
                </div>

                <script src="../js/tab_cgzr_qg.js"></script>
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

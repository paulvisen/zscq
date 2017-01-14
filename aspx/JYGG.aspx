<%@ Page Title="" Language="C#" MasterPageFile="~/aspx/jydt_site.Master" AutoEventWireup="true" CodeBehind="jygg.aspx.cs" Inherits="zscq.aspx.jygg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>交易公告</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <div class="contentR" style="position: relative; left: 10px; font: 13px microsoft yahei; line-height: 25px; margin: 12px auto; width: 910px;">
        <%--<div style="margin: 4px 10px;"><a href="JYDT.aspx">交易大厅</a>&nbsp;&nbsp;>&nbsp;&nbsp;交易公告&交易规则</div>
        <hr style="height: 2px; border: none; border-top: 2px solid rgb(220,220,220);" />--%>
        <style type="text/css">
            .jygg0 {
                width: 905px;
                height: 413px;
                margin: 0px;
                float: left;
                position: relative;
                font: 14px Microsoft YaHei;
                /*padding:5px;*/
            }

                .jygg0 #nav {
                    /*display:block;*/
                    width: 900px;
                    padding: 0;
                    margin: 0;
                    list-style: none;
                    float: left;
                    position: relative;
                    top: 1px;
                    z-index: 1;
                    padding: 5px;
                    border-bottom: 3px solid rgb(220,220,220);
                }

                    .jygg0 #nav li {
                        float: left;
                        width: 138px;
                        /*border: 1px solid rgb(220,220,220);*/
                        /*background-color: rgb(186,210,214);*/
                        font-size: 15px;
                        font-weight: 600;
                        border-right: 2px solid rgb(29,98,189);
                    }

                        .jygg0 #nav li a {
                            display: block;
                            line-height: 25px;
                            text-decoration: none;
                            padding: 0 0 0 5px;
                            text-align: center;
                            color: #333;
                        }

            #menu_con {
                width: 905px;
                height:800px;
                float: left;
                position: relative;
                left: 0px;
                background-image: none;
                /*border: 1px solid rgb(220,220,220);*/
            }

            .tag {
                padding: 10px;
                overflow: hidden;
                position: relative;
                width: 100%;
                height: 100%;
            }

            #nav li a.selected {
                color: rgb(29,98,189);
            }
            .wh {
            line-height:40px;
            background:rgb(252,252,252);
            }
            .or {
            line-height:40px;
            }
            ul {
               -webkit-padding-start: 20px;
            }
            .st {
            width: 880px; height: 150px; margin: 15px 0px; display: block;list-style:none; font-size:15px;line-height:30px;
            }
        </style>
        <div class="jygg0" style="">
            <!--tag标题-->
            <ul id="nav">
                <li><a href="javascript:void(0)" class="selected">交易公告</a></li>
                <li><a href="javascript:void(0)" class="">交易规则</a></li>

            </ul>

            <!--二级菜单-->
            <div id="menu_con">
                <div class="tag" style="display: block">

                    <ul class="st">
                        <li class="wh" ><a href="jygg_details.aspx">交易公告-交易之前注意事项<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygg_details.aspx">[交易公告]我省科技园区创新发展步伐不断加快<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="wh"><a href="jygg_details.aspx">[交易公告]我省科技园区创新发展步伐不断加快<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygg_details.aspx">[交易公告]我省科技园区创新发展步伐不断加快<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="wh"><a href="jygg_details.aspx">[交易公告] 12.18  高校产学研 首届知识产权线下交流会<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygg_details.aspx">[交易公告] 12.18  高校产学研 首届知识产权线下交流会<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="wh"><a href="jygg_details.aspx">交易公告<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygg_details.aspx">[交易公告] 12.18  高校产学研 首届知识产权线下交流会<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="wh"><a href="jygg_details.aspx">交易公告<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygg_details.aspx">[交易公告] 12.18  高校产学研 首届知识产权线下交流会<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                    </ul>
                </div>
                <div class="tag" style="display: none">

                    <ul class="st">
                        <li class="wh"><a href="jygz.aspx">[交易规则]交易须知<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygz.aspx">交易规则<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="wh"><a href="jygz.aspx">[交易规则]交易须知<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygz.aspx">交易规则<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="wh"><a href="jygz.aspx">[交易规则]交易须知<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygz.aspx">交易规则<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="wh"><a href="jygz.aspx">[交易规则]交易须知<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygz.aspx">交易规则<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="wh" ><a href="jygz.aspx">[交易规则]交易须知<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                        <li class="or"><a href="jygz.aspx">交易规则<span style="display:inline-block;width:300px;position:relative;float:right;">2016-11-22</span></a></li>
                    </ul>
                </div>
                <script src="../js/tab_cgzr_qg.js"></script>

            </div>
        </div>
    </div>
</asp:Content>

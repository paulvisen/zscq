<%@ Page Title="" Language="C#" MasterPageFile="~/aspx/jydt_site.Master" AutoEventWireup="true" CodeBehind="jygg_details.aspx.cs" Inherits="zscq.aspx.jygg_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
      
        <div class="jygg0" >
         <p style="font-size:17px;font-weight:600;text-align:center;">交易公告</p>
          <p style="text-align:center;">发布时间：2016-11-12</p>
          <div style="white-space:pre-wrap;margin:0 auto;">     我们将主动核实并第一时间向相关企业及政府主管部门反映您的投诉情况，同时也要求您对所填报信息的真实性负责，我们将严格保护您的权益，不泄露您的任何个人信息.
     您必须遵守以下条款：
一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息： 
    （一）煽动抗拒、破坏宪法和法律、行政法规实施的；
    （二）煽动颠覆国家政权，推翻社会主义制度的；
    （三）煽动分裂国家、破坏国家统一的；
    （四）煽动民族仇恨、民族歧视，破坏民族团结的；
    （五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；
    （六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；
    （七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；
    （八）损害国家机关信誉的；
    （九）其他违反宪法和法律行政法规的；
    （十）进行商业广告行为的。

二、互相尊重，对自己的言论和行为负责。

三、允许"网上交易保障中心”根据工作需要，在保护您的个人权益的前提下，使用您的任何叙述。</div>
            <img src="../images/haibao.jpg" style="width:500px;height:400px;margin:30px auto;display:block;" />
        </div>
    </div>

</asp:Content>

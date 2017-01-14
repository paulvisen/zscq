<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="TeamInfo.aspx.cs" Inherits="zscq.Views.TeamPres.TeamInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/team.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb m10">
        <div style="float:left">
            <span><a href="/Home.aspx">首页</a></span>&nbsp;>&nbsp;<span>团队展示</span>
        </div>
        <div id="user_bar" runat="server" style="float:right">
            欢迎您：<span id="username" runat="server">XXX</span>&nbsp;&nbsp;&nbsp;
            <span>我的收藏</span>&nbsp;&nbsp;&nbsp;<span>我的交易</span>&nbsp;&nbsp;&nbsp;
            <span><a href="/Manage/ManageGuide.aspx">管理中心</a></span>
        </div>
        <div id="login_bar" runat="server" style="float:right">
            <asp:LinkButton runat="server" OnClick="Login">登录</asp:LinkButton>
            <a href="/Register.aspx">注册</a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clear"></div>
    <div class="compintroductinfo">                 
        <div class="comptextinfo" runat="server">
            <table>
                <tr>
                    <td rowspan="3" style="vertical-align:top;padding-right:30px;">
                        <img src="/images/company1.jpg" />
                    </td>
                    <td class ="tdcompname"><%=dt.Rows[0]["Name"]%></td>
                </tr>
                <tr>
                    <td class="tdcompfield"><b>研究领域/经营范围：</b><%=dt.Rows[0]["Area"]%></td>
                </tr>
                <tr>
                    <td class="f14">
                        <div class="b f16 pb10">机构简介：</div>
                        <p class="f14"><%=dt.Rows[0]["Introduce"]%></p>
                    </td>
                </tr>
            </table>
        </div>
        <div class="compcontactinfo">
            <h1>机构信息</h1>
            <table>
                <tr>
                    <td style="width:30%; padding-left:30px"><b>机构类别：</b></td>
                    <td><%=dt.Rows[0]["Type"]%></td>                                                                                                                           
                </tr>
                <tr>
                    <td style="width:30%; padding-left:30px"><b>机构地址：</b></td>
                    <td style="width:70%"><%=dt.Rows[0]["Address"]%></td>                                                                                                                           
                </tr>                    
                <tr>
                    <td style="width:30%; padding-left:30px"><b>联系人：</b></td>
                    <td><%=dt.Rows[0]["ContactPerson"]%></td>                                                                                                                           
                </tr>
                <tr>
                    <td style="width:30%; padding-left:30px"><b>联系方式：</b></td>
                    <td><%=dt.Rows[0]["ContactPhone"]%></td>                                                                                                                           
                </tr>
                <tr>
                    <td style="width:30%; padding-left:30px"><b>电子邮箱：</b></td>
                    <td><%=dt.Rows[0]["Email"]%></td>                                                                                                                           
                </tr>
            </table>
            <div class="contactidentify">
                <img style="height:76px;" src="/images/qyrz.png"/>
                <img style="height:76px;" src="/images/mjbz.png" />
            </div>
            <h2>关注此机构</h2>
        </div> 
    </div>  
    <div class="compdatainfo">
        <h1>机构数据</h1>
        <table>
            <tr>
                <td><b>发布成果数</b></td>
                <td><b>发布交易数</b></td>
                <td><b>成功交易数</b></td>
                <td><b>好评率</b></td>
                <td><b>关注人数</b></td>
            </tr>
            <tr>
                <td class="f30 b">220</td>
                <td class="f30 b">110</td>
                <td class="f30 b">22</td>
                <td class="f30 b">100%</td>
                <td class="f30 b">100</td>
            </tr>
            <%--<tr class="compdatavalue">
                <td><%=myteamInfoClass.numcg%></td>
                <td><%=myteamInfoClass.numfbjy%></td>
                <td><%=myteamInfoClass.numcgjy%></td>
                <td><%=myteamInfoClass.numhp%></td>
                <td><%=myteamInfoClass.numgzrs%></td>
            </tr> --%>
            <tr>
                <td><img src="/images/down_arrow.png"/></td>
                <td><img src="/images/down_arrow.png"/></td>
                <td><img src="/images/down_arrow.png"/></td>
                <td><img src="/images/down_arrow.png"/></td>
                <td><img src="/images/down_arrow.png"/></td>
            </tr>          
            <tr>
                <td>同行业均值</td>
                <td>同行业均值</td>
                <td>同行业均值</td>
                <td>同行业均值</td>
                <td>同行业均值</td>
            </tr>     
        </table>
    </div> 
    <div class="compregisterinfo" id="extraData">
            <table>
            <tr>
                <td class="compregisterinfo_colodd">注册资金</td>
                <td class="compregisterinfo_coleven">206万元</td>
                <td class="compregisterinfo_colodd">主营产品或服务</td>
                <td class="compregisterinfo_coleven">农作物种子；种苗；谷子；种子；脱毒马铃薯；微型红薯；果树苗；花卉种子；蔬菜种子；食用菌菌种</td>
            </tr>
            <tr>
                <td class="compregisterinfo_colodd">是否提供加工定制</td>
                <td class="compregisterinfo_coleven">否</td>
                <td class="compregisterinfo_colodd"> 经营模式</td>
                <td class="compregisterinfo_coleven">其他</td>
            </tr>           
            <tr>
                <td class="compregisterinfo_colodd">主要客户</td>
                <td class="compregisterinfo_coleven">各地专业合作社</td>
                <td class="compregisterinfo_colodd">研发部门人数</td>
                <td class="compregisterinfo_coleven">5-10人</td>
            </tr>
            <tr>
                <td class="compregisterinfo_colodd">厂房面积</td>
                <td class="compregisterinfo_coleven">680.00平方米</td>
                <td class="compregisterinfo_colodd">员工人数</td>
                <td class="compregisterinfo_coleven">5-10人</td>
            </tr>      
        </table>
        <img src="/images/qyzgzs.png" />
    </div>
    <div class="comprelateinfo">
        <div style="clear:both; margin:0;padding:0"></div>
        <ul>
            <%--<li><a href="TeamRelateList.aspx?type=ALL&teamid=<%=teamId%>&teamTable=<%=teamTable%>" target ="teamrelatelistframe">全部</a></li>--%>
            <li class="active"><a href="TeamRelateList.aspx?type=CGZS&teamid=<%=teamId%>&teamTable=<%=teamTable%>" target ="teamrelatelistframe">成果展示</a></li>
            <li><a href="TeamRelateList.aspx?type=CGZR&teamid=<%=teamId%>&teamTable=<%=teamTable%>" target ="teamrelatelistframe" >成果转让</a></li>
            <li><a href="TeamRelateList.aspx?type=CGXQ&teamid=<%=teamId%>&teamTable=<%=teamTable%>" target ="teamrelatelistframe">成果需求</a></li>
            <%--<li><a href="TeamRelateList.aspx?type=KJFW&teamid=<%=teamId%>&teamTable=<%=teamTable%>" target ="teamrelatelistframe">科技服务</a></li>--%>
            <li><a href="TeamRelateList.aspx?type=ZJRC&teamid=<%=teamId%>&teamTable=<%=teamTable%>" target ="teamrelatelistframe">专家人才</a></li>
        </ul>
        <div style="clear:both; margin:0;padding:0"></div>
        <iframe name="teamrelatelistframe" src="TeamRelateList.aspx?type=CGZS&teamid=<%=teamId%>&teamTable=<%=teamTable%>" width="100%" height="800" scrolling="no" frameborder="0"></iframe>          
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script src="TeamInfo.js"></script>
</asp:Content>

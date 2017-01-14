<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="GainInfo.aspx.cs" Inherits="zscq.Views.TeamPres.GainInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>成果详情</title>
    <link href="/css/gaininfo.css" rel="stylesheet" />
    <script src="/js/jQuery.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contentR" id="maincontent" runat="server">
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
        <div class="cgjj">
            <div class="cgjbxx" id="cgjbxx">
                <div class="tupianhead">
                    成果基本信息
                </div>
                <table>
                    <tbody>
                        <tr>
                            <td><b>成果名称：</b><%=dt1.Rows[0]["CGName"]%></td>                                
                        </tr>
                        <tr>
                            <td><b>所属领域：</b><%=dt1.Rows[0]["Area"]%></td>                                                              
                        </tr>
                        <tr>
                            <td><b>关键词：</b><%=dt1.Rows[0]["Keyword"]%></td>  
                        </tr>
                        <tr>
                            <td><b>成果状态：</b><%=dt1.Rows[0]["State"]%></td>                                
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="fbdwxx" id="fbdwxx" >
                <div class="tupianhead">
                    成果发布单位信息
                </div>
                <table>
                    <tbody>
                        <tr>
                            <td colspan="2"><b>单位名称：</b><%=dt1.Rows[0]["PublisherName"]%></td>                               
                        </tr>
                        <tr>
                            <td colspan="2"><b>单位简介：</b><%=dt2.Rows[0]["Introduce"]%></td>                                
                        </tr>
                        <tr>
                            <td colspan="2"><a href="TeamInfo.aspx?tid=<%=dt2.Rows[0]["Id"]%>&type=<%=tablename%>"><span class="fadwxxbody_sp">查看单位详情</span></a></td>                                                            
                        </tr>
                    </tbody>
                </table> 
            </div>
        </div>
        <div class="tupian" id="tupian">
            <div class="tupianhead">
                成果图片
            </div>
            <div class="tupianbody">                       
                <img src="<%=dt1.Rows[0]["CGPicShow"]%>" /> 
            </div>
        </div>
        <!--成果信息开始-->
        <div class="cgxx" >
            <!--tag标题-->
            <ul id="nav">
                <li><a href="javascript:void(0)" class="selected">成果信息</a></li>
                <li><a href="javascript:void(0)" class="">成果介绍</a></li>
            </ul>
            <!--二级菜单-->
            <div id="menu_con">
                <div class="tag_cg" style="display: block" id="cgjbxxdjb">
                    <table width="100%" border="0" class=" _ft11">
                        <thead><tr ><td colspan="4" >成果信息表</td></tr></thead>
                        <tbody>
                            <tr>
                                <td colspan="2"><b>成果名称：</b><%=dt1.Rows[0]["CGName"]%></td>
                                <td colspan="2"><b>品种审定号或专利号：</b><%=dt1.Rows[0]["CQNum"]%></td>
                            </tr>
                            <tr>
                                <td colspan="2"><b>完成团队(人)：</b><%=dt1.Rows[0]["CQBelongPeople"]%></td>
                                <td colspan="2"><b>电话：</b>无</td>
                            </tr>
                            <tr>
                                <td colspan="4"><b>成果类型：</b><%=dt1.Rows[0]["Area"]%></td>
                            </tr>
                            <tr>
                                <td colspan="2"><b>联系人：</b><%=dt1.Rows[0]["Manager"]%></td>
                                <td colspan="2"><b>电话：</b><%=dt1.Rows[0]["ContactPhone"]%></td>
                            </tr>                                                            
                        </tbody>
                    </table>
                </div>
                <div class="tag_cg" style="display: none" id="cgjs">
                    <p><%=dt1.Rows[0]["CGIntroduction"]%></p>
                </div>
                <script src="GainInfo.js"></script>
            </div>
        </div>
        <!--成果信息结束-->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterWithLeftNav.master" AutoEventWireup="true" CodeBehind="DownloadDetail.aspx.cs" Inherits="zscq.Views.Downloads.DownloadDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .download-content {
            padding: 10px 30px;
        }
        
        .download-description {
            font-size: 16px;
            line-height: 30px;
        }
        
        .download-name {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            line-height: 50px;
        }
        
        .download-btn-text {
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftNavPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="breadcrumb">
        <div style="float:left">
            <span><a href="/Home.aspx">首页</a></span>&nbsp;>&nbsp;<span><a href="Downloads.aspx">资料下载</a></span>&nbsp;>&nbsp;<span>下载详情</span>
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

    <div class="div-default">
        <h1 id="DownloadTitle" runat="server" class="title title-border"></h1>
        <p style="text-align:center;font-size:16px;padding:5px">
            发表时间： <span id="PubDate" runat="server"></span>&nbsp;&nbsp; 发表人：
            <span id="Publisher" runat="server"></span>&nbsp;&nbsp; 资料分类：
            <span id="DownloadType" runat="server"></span>
        </p>
        <div class="download-content">
            <asp:Repeater runat="server" ID="DownloadContent" OnItemCommand="DownloadContent_ItemCommand">
                <ItemTemplate>
                    <p class="download-description">
                        <%#Eval("FileDescription") %>
                    </p>
                    <p class="download-name">
                        <%#Eval("FileName") %>
                    </p>
                    <p style="text-align:center">
                        <asp:ImageButton ID="DownloadButton" runat="server" CommandName="Download" CommandArgument='<%#Eval("FileID") %>' 
                            AlternateText="另存为" ImageUrl="~/images/download.png" Width="80px" Height="80px" />
                    </p>
                    <p class="download-btn-text">另存为</p>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
</asp:Content>
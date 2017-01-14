<%@ Page Title="" Language="C#" MasterPageFile="~/MasterWithLeftNav.master" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="zscq.Views.News.NewsDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftNavPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="breadcrumb">
        <div style="float:left">
            <span><a href="/Home.aspx">首页</a></span>&nbsp;>&nbsp;<span><a href="/Views/News/News.aspx">新闻资讯</a></span>&nbsp;>&nbsp;<span>资讯详情</span>
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
        <h1 id="NewsTitle" runat="server" class="title title-border"></h1>
        <p style="text-align:center;font-size:16px;padding:5px">发布时间: <span id="PubDate" runat="server"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 浏览次数: <span id="ReadTimes" runat="server"></span></p>
        <div id="Content" runat="server" style="font-size:16px!important;padding:10px 30px"></div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
</asp:Content>
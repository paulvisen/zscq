<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ManageGuide.aspx.cs" Inherits="zscq.Manage.ManageGuide" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #manage-guide{
            width:1045px;
            padding-top:20px;
            padding-bottom:200px;
        }

        .title{
            margin:50px auto 0 auto;
            width:1045px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb">
        <div style="float:left">
            <span><a href="/Home.aspx">首页</a></span>&nbsp;>&nbsp;<span>管理中心</span>
        </div>
        <div id="user_bar" runat="server" style="float:right">
                欢迎您：<span id="username" runat="server">XXX</span>&nbsp;&nbsp;&nbsp;
                <span>我的收藏</span>&nbsp;&nbsp;&nbsp;<span>我的交易</span>&nbsp;&nbsp;&nbsp;
                <span><a href="/Manage/ManageGuide.aspx">管理中心</a></span>&nbsp;&nbsp;&nbsp;
                <asp:LinkButton runat="server" OnClick="Logout">退出</asp:LinkButton>
            </div>
            <div id="login_bar" runat="server" style="float:right">
                <asp:LinkButton runat="server" OnClick="Login">登录</asp:LinkButton>
                <asp:LinkButton runat="server">注册</asp:LinkButton>
            </div>
        <div class="clearfix"></div>
    </div>

    <div class="title title-border">管理中心</div>
    <manage-guide id="manage-guide" :list="list"></manage-guide>
    <input type="hidden" id="hideType" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script src="ManageGuide.js"></script>
    <script>
        $(document).ready(function(){
            manageGuide.getGuide();
        })
    </script>
</asp:Content>

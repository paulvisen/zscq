<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="UserAuth.aspx.cs" Inherits="zscq.Manage.UserAuth" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb">
        <div style="float:left">
            <span><a href="/Home.aspx">首页</a></span>&nbsp;>&nbsp;<span>管理中心</span>
        </div>
        <div id="user_bar" runat="server" style="float:right">
            欢迎您：<span id="username" runat="server">XXX</span>&nbsp;&nbsp;&nbsp;
            <span>我的收藏</span>&nbsp;&nbsp;&nbsp;<span>我的交易</span>&nbsp;&nbsp;&nbsp;
            <span><a href="/Manage/ManageGuide.aspx">管理中心</a></span>
        </div>

        <div class="clearfix"></div>
    </div>
    <div style="padding:10px 150px">
        <div style="font-size:20px;text-align:center;">完善用户信息</div>
        <iframe src="User/AuthManage.aspx" id="iframepage" frameborder="0" scrolling="no" 
            width="100%"></iframe>
    </div>
      
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
</asp:Content>

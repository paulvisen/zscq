<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ManageMain.aspx.cs" Inherits="zscq.Manage.ManageMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #manage-guide > li:last-child{
            margin-bottom: -10px!important;
        }

        .title{
            text-align: left;
            background: url('/images/manage_icon.png') no-repeat 42px center;
            padding-left: 65px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="left">
        <nav>
            <ul id="manage-guide" class="nav nav-pills nac-stacked left-nav" style="padding-bottom:0;margin-bottom:10px">
                <li class="left-nav-header"><img src="/images/list.png"/>&nbsp;&nbsp;管理中心</li>
                <li v-for="item in list" style="margin: 0 auto;width:100%">
                    <p class="title">{{item.title}}</p>
                    <ul class="multi-ul">
                        <li v-for="content in item.dropdown" class="multi-ul-2">
                            <a :href="content.url">{{content.title}}</a>
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                    <p class="nav-divider"></p>
                </li>
            </ul>
        </nav>
    </div>
    <div id="main">
        <div class="breadcrumb">
            <div style="float:left">
                <span><a href="/Home.aspx" target="_parent">首页</a></span>&nbsp;>&nbsp;<span>管理中心</span>&nbsp;>&nbsp;<span>用户管理</span>
            </div>
            <div id="user_bar" style="float:right">
                欢迎您：<span id="username" runat="server">XXX</span>&nbsp;&nbsp;&nbsp;
                <span>我的收藏</span>&nbsp;&nbsp;&nbsp;<span>我的交易</span>&nbsp;&nbsp;&nbsp;
                <span><a href="/Manage/ManageGuide.aspx" target="_parent">管理中心</a></span>
            </div>
            <div class="clearfix"></div>
        </div>
        <iframe src="User/AccountManage.aspx" id="iframepage" frameborder="0" scrolling="no" 
            marginheight="0" marginwidth="0" width="100%" onload="iFrameHeight()"></iframe>
        <script type="text/javascript" language="javascript">
            function iFrameHeight() {
                //var ifm = document.getElementById("iframepage");
                //var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;
                //if (ifm != null && subWeb != null) {
                //    ifm.height = subWeb.body.scrollHeight;
                //    ifm.width = subWeb.body.scrollWidth;
                //}
                var contentHeight = $("#iframepage").contents().find("body").height();
                if (contentHeight < 300) {
                    contentHeight = 300;
                }
                $("#iframepage").height(contentHeight);
            }
        </script>
    </div>
    <div class="clearfix"></div>
    <input type="hidden" id="hideType" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script src="ManageGuide.js"></script>
    <script>
        $(document).ready(function () {
            manageGuide.getGuide();
            setTimeout(frameChange, 10);
        })

        window.onhashchange = function () {
            frameChange();
        }

        //根据锚点判断iframe内容
        function frameChange() {
            var main = $("#main")[0];
            var iframepage = $("#iframepage")[0];
            main.removeChild(iframepage);
            iframepage = document.createElement("iframe");
            iframepage.id = "iframepage";
            iframepage.frameBorder = "0";
            iframepage.scrolling = "no";
            iframepage.marginHeight = "0";
            iframepage.marginWidth = "0";
            iframepage.width = "100%";

            var hash = location.hash;
            hash = hash.substring(1, hash.length);
            if (hash != "") {
                iframepage.src = hash;
                //$(".breadcrumb > div:first-child > span:last-child")[0].innerText = sessionStorage.getItem("selected");
            }
            iframepage.onload = iFrameHeight;
            main.appendChild(iframepage);

            var url = location.href;
            var index = url.indexOf("ManageMain");
            if (index > 0) {
                var href = url.substring(index);
                $(".breadcrumb > div:first-child > span:last-child")[0].innerText = $("a[href=\"" + href + "\"]")[0].innerText;
            }
        }
    </script>
</asp:Content>

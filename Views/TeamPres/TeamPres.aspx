<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="TeamPres.aspx.cs" Inherits="zscq.Views.TeamPres.TeamPres" %>
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
    <div class="second">                 
        <div id="divGoodGain" class="YXCGZB" runat="server">     
        </div>       
        <div class="ZXFBCG">
            <h1>最新发布成果</h1>
            <hr />
            <asp:Repeater ID="Repeater1" runat="server" > 
                <ItemTemplate> 
                    <div class="OneGain"> 
                        <h2 class="ZXFBCGname"><a href="GainInfo.aspx?tid=<%#Eval("id")%>"><%#Eval("CGName") %></a></h2>
                        <h2 class="ZXFBCGauthor"><%#Eval("PublisherName") %></h2>
                    </div> 
                </ItemTemplate> 
            </asp:Repeater>
        </div> 
    </div> 
    <div class="third">
        <ul id="ulTeamType" runat ="server" onserverclick="selTeam()">
            <li id="likjqy" class="active"><a href="TeamList.aspx?teamType=kjqyTeam" target ="teamlistframe">科技企业</a></li>
            <li id="likyyx"><a href="TeamList.aspx?teamType=kyysTeam" target ="teamlistframe">科研院所</a></li>
            <li id="ligdyx"><a href="TeamList.aspx?teamType=gdyxTeam" target ="teamlistframe">高等院校</a></li>
            <li id="lifwjg"><a href="TeamList.aspx?teamType=fwjgTeam" target ="teamlistframe">服务机构</a></li>
            <li id="liqtlx"><a href="TeamList.aspx?teamType=qtlxTeam" target ="teamlistframe">其他类型</a></li>
        </ul>
        <div>
            <div class="teamsearch">
                <h3>团队分类</h3>
                <select id="teamtype">
                    <option value="all" class="form-control">全部</option>
                    <option value="kjqyTeam">科技企业</option>
                    <option value="kyysTeam">科研院所</option>
                    <option value="gdyxTeam">高等院校</option>
                    <option value="fwjgTeam">服务机构</option>
                    <option value="zjtdTeam">专家团队</option>
                    <option value="qtlxTeam">其他类型</option>
                </select>
                <h3>所在地区</h3>
                <div data-toggle="distpicker" class="provincesel">
                    <div class="form-group">
                        <label class="sr-only" for="province7">Province</label>
                        <select class="form-control" id="province"></select>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="city7">City</label>
                        <select class="form-control" id="city"></select>
                    </div>
                </div>
                <h3>关键词</h3>
                <input type="text" id="keyword" class="form-control"/>
                <button id="search" class="btn" onclick="SearchTeam()" type="button">搜索</button> 
            </div>
            <iframe id="teamListid" name="teamlistframe" src="TeamList.aspx?teamType=kjqyTeam" width="900" height="960" scrolling="no" frameborder="0" style="float:right">
            </iframe>                         
        </div>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script src="TeamPres.js"></script>
    <script src="/js/distpicker.data.min.js"></script>
	<script src="/js/distpicker.min.js"></script>
	<script src="/js/main.js"></script>
</asp:Content>

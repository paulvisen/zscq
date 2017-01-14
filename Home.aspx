<%@ Page Title="首页" Language="C#" MasterPageFile="~/MasterWithLeftNav.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="zscq.Home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Home.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftNavPlaceHolder" runat="server">
    <div class="org">
        <a href="#">
            <div class="div-default" style="background-color:#F7DEC0">
                中介机构
            </div>
        </a>            
        <a href="#">
            <div class="div-default" style="background-color:#B4CBD3">
                法务机构
            </div>
        </a>
        <a href="#">
            <div class="div-default" style="background-color:#F7DEC0">
                代理机构
            </div>
        </a>           
        <a href="Views/Downloads/Downloads.aspx">
            <div class="div-default" style="background-color:#B4CBD3">
                常用下载
            </div>
        </a>
            
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="w72">
        <carousel id="news-carousel" :image-list="imageList" :type="1" height="280px"></carousel>
        <div-with-vertical-title id="new-achievement" title="最新成果">
            <ul class="multi-ul">
                <li v-for="achievement in newAchievementList" class="multi-ul-2">
                    <a :href="'Views/TeamPres/GainInfo.aspx?tid=' + achievement.Id">{{achievement.CGName}}</a>
                </li>
            </ul>
        </div-with-vertical-title>
    </div>
    <div class="w28">
        <div id="login_bar" runat="server">
            <asp:Button runat="server" ID="loginButton" class="btn btn-primary btn-login" Text="登录" OnClick="Login"></asp:Button>
            <a class="btn btn-warning btn-login" href="Register.aspx">注册</a>
        </div>
        <div id="user_bar" runat="server">
            欢迎您：<span id="username" runat="server">XXX</span>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <span><a href="/Manage/ManageGuide.aspx">管理中心</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="logoutButton" Text="退出" OnClick="Logout"></asp:LinkButton>
        </div>
        <tab-group id="news-tab" :tab-list="newsTabList">
            <ul slot="news" class="multi-ul">
                <li v-for="dynamic in dynamicList">
                    <a :href="'Views/News/NewsDetail.aspx?id=' + dynamic.NewsID">{{dynamic.Title}}</a>
                </li>
            </ul>
            <ul slot="strategy" class="multi-ul">
                <li v-for="strategy in strategyList">
                    <a :href="'Views/News/NewsDetail.aspx?id=' + strategy.NewsID">{{strategy.Title}}</a>
                </li>
            </ul>   
        </tab-group>
        <tab-group id="group-tab" :tab-list="teamTabList">
            <ul slot="hotTeam" class="multi-ul">
                <li v-for="team in keyanTeamList">
                    <a :href="'Views/TeamPres/TeamInfo.aspx?tid=' + team.Id + '&type=' + team.Type">{{team.Name}}</a>
                </li>
            </ul>
            <ul slot="newTeam" class="multi-ul">
                <li v-for="team in kejiTeamList">
                    <a :href="'Views/TeamPres/TeamInfo.aspx?tid=' + team.Id + '&type=' + team.Type">{{team.Name}}</a>
                </li>
            </ul>
        </tab-group>
    </div>
    <div class="clearfix"></div>
    <div>
        <div class="title" style="padding-left: 120px">
            交易大厅<button class="btn btn-more">More</button>
        </div>
        <tab-group id="trade-tab" :tab-list="tabList2">
            <ul slot="cg" class="multi-ul">
                <li v-for="cg in cgList" class="multi-ul-3" style="border-bottom: 1px dashed lightgrey">
                    <a :href="'aspx/jydt_list_details.aspx?cgid=' + cg.id">{{cg.CGName}}</a>
                </li>
            </ul>
            <ul slot="need" class="multi-ul">
                <li v-for="need in needList" class="multi-ul-3" style="border-bottom: 1px dashed lightgrey">
                    <a :href="'aspx/jydt_list_details_xq.aspx?cgid=' + need.NeedID">{{need.Name}}</a>
                </li>
            </ul>
            <%--<multi-ul slot="auc" :col="3" :list="aucList"></multi-ul>--%>
        </tab-group>
    </div>
    <div-with-vertical-title id="statistics" title="成果大数据">
        <div style="width:100%;height:100%;background:url('images/statistics.png') center no-repeat;position:relative">
            <div id="achievement-count">11234<span>项</span></div>
            <div id="team-count">1034<span>项</span></div>
            <div id="service-count">2233<span>项</span></div>
            <div id="activity-count">5234<span>项</span></div>
        </div>
    </div-with-vertical-title>

    <div>
        <div class="w57 div-default" style="height:450px;">
            <div class="title title-border">成果类别</div>
            <classify :list="classifyList">
            </classify>
        </div>

        <div class="w41 div-default" style="height:450px;">
            <div class="title title-border" style="color:#FF750F">线下活动</div>
            <carousel id="activity-carousel" :image-list="[{src:'/images/haibao.jpg',captain:'线下交易'}]" style="margin-top:10px;" :type="2" height="177px">
            </carousel>

            <ul class="multi-ul">
                <li v-for="activity in offlineActivityList">
                    <a :href="'aspx/xxjy_details.aspx?xxjyid=' + activity.id">{{activity.xxjy_name}}</a>
                </li>
            </ul>
        </div>

        <div class="clearfix"></div>
    </div>

    <div class="div-default" style="height:370px">
        <div class="title">成功案例</div>

        <table id="successful-case">
            <tr>
                <td rowspan="2">
                    <achievement-show :achievement="newAchievementList[0]" style="height:300px">
                    </achievement-show>
                </td>
                <td v-for="n in 3">
                    <achievement-show :achievement="newAchievementList[n]">
                    </achievement-show>
                </td>
            </tr>

            <tr>
                <td v-for="n in 3">
                    <achievement-show :achievement="newAchievementList[n+3]">
                    </achievement-show>
                </td>
            </tr>
        </table>
    </div>

    <div style="width:100%;">
        <div class="div-default w31 team" style="margin-right:3.5%;">
            <div class="top" style="background-color:#CC3F4F">
                <img src="images/team.png" />
                <span>高等院校&科研院所</span>
            </div>
            <ul class="multi-ul" style="padding: 30px">
                <li v-for="team in keyanTeamList">
                    <a :href="'Views/TeamPres/TeamInfo.aspx?tid=' + team.Id + '&type=' + team.Type">{{team.Name}}</a>
                </li>
            </ul>
        </div>
        <div class="div-default w31 team" style="margin-right:3.5%;">
            <div class="top" style="background-color:#3574B7">
                <img src="images/team.png" />
                <span>科技企业&团队</span>
            </div>
            <ul class="multi-ul" style="padding: 30px">
                <li v-for="team in kejiTeamList">
                    <a :href="'Views/TeamPres/TeamInfo.aspx?tid=' + team.Id + '&type=' + team.Type">{{team.Name}}</a>
                </li>
            </ul>
        </div>
        <div class="div-default w31 team">
            <div class="top" style="background-color:#35B8AA">
                <img src="images/team.png" />
                <span>中介&服务机构</span>
            </div>
            <ul class="multi-ul" style="padding: 30px">
                <li v-for="team in fuwuTeamList">
                    <a :href="'Views/TeamPres/TeamInfo.aspx?tid=' + team.Id + '&type=' + team.Type">{{team.Name}}</a>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="div-default" style="height:200px">
        <div class="title title-border">专家团队</div>
        <table style="width:100%;margin-top:20px">
            <tr>
                <td v-for="expert in expertList">
                    <expert-show :expert="expert"></expert-show>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <div class="title">科技服务</div>
        <table style="width:100%;table-layout:fixed;">
            <tr>
                <td style="padding-right:10px;padding-bottom:10px">
                    <service icon="images/jishu_service.png" :service-list="serviceList1"></service>
                </td>
                <td style="padding-left:10px;padding-bottom:10px">
                    <service icon="images/tech_service.png" :service-list="serviceList2"></service>
                </td>
            </tr>
            <tr>
                <td style="padding-right:10px;padding-bottom:10px">
                    <service icon="images/expert_service.png" :service-list="serviceList3"></service>
                </td>
                <td style="padding-left:10px;padding-bottom:10px">
                    <service icon="images/talent_service.png" :service-list="serviceList4"></service>
                </td>
            </tr>
            <tr>
                <td style="padding-right:10px;padding-bottom:10px">
                    <service icon="images/agri_service.png" :service-list="serviceList5"></service>
                </td>
                <td style="padding-left:10px;padding-bottom:10px">
                    <service icon="images/financial_service.png" :service-list="serviceList6"></service>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script src="Home.js"></script>
</asp:Content>
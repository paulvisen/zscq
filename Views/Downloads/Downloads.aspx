<%@ Page Title="" Language="C#" MasterPageFile="~/MasterWithLeftNav.master" AutoEventWireup="true" CodeBehind="Downloads.aspx.cs" Inherits="zscq.Views.Downloads.Downloads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .download-content{
            padding:5px;
        }

        .download-content  ul {
            list-style-type: disc;
            list-style-position: inside;
            padding: 15px 50px 15px 25px;
        }
            
        .download-content > ul > li {
            padding: 5px;
            color: blue;
            line-height: 30px;
        }
            
        .pub-date {
            float: right;
            color: black;
        }
            
        .download-title {
            width: 70%;
            margin: 0;
            display:inline;
        }
            
        .pagebar {
            float: right;
            padding-right: 42px;
        }

        .nav-tabs > li{
            margin: 0;
        }

        .nav-tabs > li > a{
            background-color: white;
            font-weight: bold;
            font-size: 15px;
            display: block;
            line-height: 30px;
        }

        .nav-tabs .active > a{
            background-color: #2C85E9!important;
            color: white!important;
        }

        .link{
            width: 100%;
        }

        .link > div{
            margin-right: -1%;
        }

        .link > div > div{
            display: inline-block;
            width: 32%;
            height: 60px;
            line-height: 50px;
            margin-top: 20px;
            margin-right: 1%;
            background: url(/images/link_logo.png) no-repeat 80px center;
            padding-left: 130px;
            font-size: 16px;
            font-weight:bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftNavPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="breadcrumb mb5">
        <div style="float:left">
            <span><a href="/Home.aspx">首页</a></span>&nbsp;>&nbsp;<span>资料下载</span>
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
    
    <tab-group id="download-tab" :tab-list="tabList">
        <div id="all" class="download-content" slot="all">
            <ul>
                <li v-for="downloadItem in allDownload.list" style="border-bottom:1px dashed lightgrey">
                    <div class="pub-date">发布日期：{{downloadItem.PubDate}}</div>
                    <div class="download-title">[{{downloadItem.Type | download-type}}]&nbsp;<a :href="'DownloadDetail.aspx?id=' + downloadItem.DownloadID">{{downloadItem.Title}}</a></div>
                    <div class="clearfix"></div>
                </li>
            </ul>
            <pagebar :total="allDownload.total" :per-page="allDownload.rows" :current-page="allDownload.page" @pagechanged="pageChanged"></pagebar>
            <div class="clearfix"></div>
        </div>
        <div slot="strategy" class="download-content">
            <ul>
                <li v-for="downloadItem in strategyDownload.list" style="border-bottom:1px dashed lightgrey">
                    <div class="pub-date">发布日期：{{downloadItem.PubDate}}</div>
                    <div class="download-title"><a :href="'DownloadDetail.aspx?id=' + downloadItem.DownloadID">{{downloadItem.Title}}</a></div>
                    <div class="clearfix"></div>
                </li>
            </ul>
            <pagebar :total="strategyDownload.total" :per-page="strategyDownload.rows" :current-page="strategyDownload.page" @pagechanged="pageChanged"></pagebar>
            <div class="clearfix"></div>
        </div>
        <div slot="contract" class="download-content">
            <ul>
                <li v-for="downloadItem in contractDownload.list" style="border-bottom:1px dashed lightgrey">
                    <div class="pub-date">发布日期：{{downloadItem.PubDate}}</div>
                    <div class="download-title"><a :href="'DownloadDetail.aspx?id=' + downloadItem.DownloadID">{{downloadItem.Title}}</a></div>
                    <div class="clearfix"></div>
                </li>
            </ul>
            <pagebar :total="contractDownload.total" :per-page="contractDownload.rows" :current-page="contractDownload.page" @pagechanged="pageChanged"></pagebar>
            <div class="clearfix"></div>
        </div>
        <div slot="rule" class="download-content">
            <ul>
                <li v-for="downloadItem in ruleDownload.list" style="border-bottom:1px dashed lightgrey">
                    <div class="pub-date">发布日期：{{downloadItem.PubDate}}</div>
                    <div class="download-title"><a :href="'DownloadDetail.aspx?id=' + downloadItem.DownloadID">{{downloadItem.Title}}</a></div>
                    <div class="clearfix"></div>
                </li>
            </ul>
            <pagebar :total="ruleDownload.total" :per-page="ruleDownload.rows" :current-page="ruleDownload.page" @pagechanged="pageChanged"></pagebar>
            <div class="clearfix"></div>
        </div>
    </tab-group>

    <div class="link">
        <div>
            <div class="div-default">评价评估</div>
            <div class="div-default">技术产权交易</div>
            <div class="div-default">知识产权代理</div>
        </div>
        <div>
            <div class="div-default">科技咨询</div>
            <div class="div-default">投融资机构</div>
            <div class="div-default">其他机构</div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script>
        var download = new Vue({
            el: '#download-tab',
            data: {
                'tabList': [
                    {
                        id: 'all',
                        title: '全部'
                    },
                    {
                        id: 'strategy',
                        title: '政策文件'
                    },
                    {
                        id: 'contract',
                        title: '合同模板'
                    },
                    {
                        id: 'rule',
                        title: '规则流程'
                    }
                ],
                'allDownload': {
                    apiUrl: 'Downloads.ashx',
                    list: [],
                    total: 0,
                    rows: 8,
                    page: 1
                },
                'strategyDownload': {
                    apiUrl: 'Downloads.ashx',
                    list: [],
                    total: 0,
                    rows: 8,
                    page: 1
                },
                'contractDownload': {
                    apiUrl: 'Downloads.ashx',
                    list: [],
                    total: 0,
                    rows: 8,
                    page: 1
                },
                'ruleDownload': {
                    apiUrl: 'Downloads.ashx',
                    list: [],
                    total: 0,
                    rows: 8,
                    page: 1
                }
            },
            mounted: function () {
                this.getAllDownloadList();
                this.getStrategyDownloadList();
                this.getContractDownloadList();
                this.getRuleDownloadList();
            },
            methods: {
                getAllDownloadList: function () {
                    var vm = this;
                    this.$http.get(this.allDownload.apiUrl, { params: { page: this.allDownload.page, rows: this.allDownload.rows } })
                    .then(function (response) {
                        console.log(response.data);
                        var result = JSON.parse(response.data);
                        vm.allDownload.total = result.total;
                        vm.allDownload.list = result.rows;
                    })
                    .catch(function (response) {
                        console.log(response);
                    })
                },
                getStrategyDownloadList: function(){
                    var vm = this;
                    this.$http.get(this.strategyDownload.apiUrl, {params: {page:this.strategyDownload.page, rows: this.strategyDownload.rows, type:1}})
                    .then(function(response){
                        console.log(response.data);
                        var result = JSON.parse(response.data);
                        vm.strategyDownload.total = result.total;
                        vm.strategyDownload.list = result.rows;
                    })
                    .catch(function(response){
                        console.log(response);
                    })
                },
                getContractDownloadList: function(){
                    var vm = this;
                    this.$http.get(this.contractDownload.apiUrl, {params: {page: this.contractDownload.page, rows: this.contractDownload.rows, type:2}})
                    .then(function (response){
                        console.log(response.data);
                        var result = JSON.parse(response.data);
                        vm.contractDownload.total = result.total;
                        vm.contractDownload.list = result.rows;
                    })
                    .catch(function (response){
                        console.log(response);
                    })
                },
                getRuleDownloadList: function(){
                    var vm = this;
                    this.$http.get(this.ruleDownload.apiUrl, {params: {page: this.ruleDownload.page, rows: this.ruleDownload.rows, type:3}})
                    .then(function (response){
                        console.log(response.data);
                        var result = JSON.parse(response.data);
                        vm.ruleDownload.total = result.total;
                        vm.ruleDownload.list = result.rows;
                    })
                    .catch(function (response){
                        console.log(response);
                    })
                },
                pageChanged: function (page) {
                    var tabTitle = $(".nav-tabs .active a")[0].innerText;
                    switch (tabTitle) {
                        case "全部":
                            this.allDownload.page = page;
                            this.getAllDownloadList();
                            break;
                        case "政策文件":
                            this.strategyDownload.page = page;
                            this.getStrategyDownloadList();
                            break;
                        case "合同模板":
                            this.contractDownload.page = page;
                            this.getContractDownloadList();
                            break;
                        case "规则流程":
                            this.ruleDownload.page = page;
                            this.getRuleDownloadList();
                            break;
                    }
                    
                }
            }
        })

        Vue.filter('download-type', function (type) {
            switch (type) {
                case '1':
                    return '政策文件';
                case '2':
                    return '合同模板';
                case '3':
                    return '规则流程';
            }
        })
    </script>
</asp:Content>

<%@ Page Title="新闻资讯" Language="C#" MasterPageFile="~/MasterWithLeftNav.master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="zscq.Views.News.News" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            .icon {
                background-color: #0267B5;
                margin: 3px 5px 3px 23px;
                width: 7px;
                height: 24px;
                display: inline-block;
                vertical-align: middle;
            }
            
            .title {
                display: inline-block;
                font-size: 16px;
                font-weight: bold;
                vertical-align: middle;
            }
            
            .news > ul {
                list-style-type: disc;
                list-style-position: inside;
                padding: 15px 50px 15px 25px;
            }
            
            .news > ul > li {
                padding: 5px;
            }
            
            .news-date {
                float: right;
            }
            
            .news-title {
                width: 70%;
                margin: 0;
                display: inline;
            }
            
            .pagebar {
                float: right;
                padding-right: 42px;
            }

            #headNews{
                padding: 10px 20px;
            }

            #headNews > div:first-child{
                width:68%;
                float:left;
                margin-right:10px;
            }

            #headNews h1{
                font-size:16px;
                font-weight:bold;               
                padding-top:5px;
                padding-bottom:5px;
            }

            #headNews h1 > a{
                color:#6384A0;
                line-height: 22px;
            }

            #headNews p{
                height: 55px;
                overflow: hidden;
                line-height: 20px;
            }

            .border-bottom{
                border-bottom: 1px dashed lightgrey;
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="LeftNavPlaceHolder" runat="server">
    </asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="MainPlaceHolder" runat="server">
        <div class="breadcrumb">
            <div style="float:left">
                <span><a href="/Home.aspx">首页</a></span>&nbsp;>&nbsp;<span>新闻资讯</span>
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

        <div id="headNews" class="div-default">
            <div>
                <div v-for="(news,index) in headNewsList">
                    <h1><a :href="'NewsDetail.aspx?id='+news.NewsID">{{news.Title}}</a></h1>
                    <p :class="{'border-bottom':index != headNewsList.length-1}">{{news.MainContentText | hideOverflow}}</p>
                </div>
            </div>
            <div style="width:30%;float:left">
                <carousel id="activity-carousel" :image-list="imageList" :type="2" height="160px">
                </carousel>
            </div>
            <div class="clearfix"></div>
        </div>

        <div id="dynamic" class="div-default news">
            <div class="title-border">
                <div class="icon"></div>
                <div class="title">网站动态</div>
            </div>
            <ul>
                <li v-for="newsItem in newsList">
                    <div class="news-date">发布日期：{{newsItem.PubDate}}</div>
                    <div class="news-title"><a :href="'NewsDetail.aspx?id='+newsItem.NewsID">{{newsItem.Title}}</a></div>
                    <div class="clearfix"></div>
                </li>
            </ul>

            <pagebar :total="total" :per-page="rows" :current-page="page" @pagechanged="pageChanged"></pagebar>
            <div class="clearfix"></div>
        </div>

        <div id="strategy" class="div-default news">
            <div class="title-border">
                <div class="icon"></div>
                <div class="title">最新政策</div>
            </div>
            <ul>
                <li v-for="newsItem in newsList">
                    <div class="news-date">发布日期：{{newsItem.PubDate}}</div>
                    <div class="news-title"><a :href="'NewsDetail.aspx?id='+newsItem.NewsID">{{newsItem.Title}}</a></div>
                    <div class="clearfix"></div>
                </li>
            </ul>

            <pagebar :total="total" :per-page="rows" :current-page="page" @pagechanged="pageChanged"></pagebar>
            <div class="clearfix"></div>
        </div>

        <div id="technology" class="div-default news">
            <div class="title-border">
                <div class="icon"></div>
                <div class="title">科技新闻</div>
            </div>
            <ul>
                <li v-for="newsItem in newsList">
                    <div class="news-date">发布日期：{{newsItem.PubDate}}</div>
                    <div class="news-title"><a :href="'NewsDetail.aspx?id='+newsItem.NewsID">{{newsItem.Title}}</a></div>
                    <div class="clearfix"></div>
                </li>
            </ul>

            <pagebar :total="total" :per-page="rows" :current-page="page" @pagechanged="pageChanged"></pagebar>
            <div class="clearfix"></div>
        </div>
    </asp:Content>
    <asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
        <script>
        var headNews = new Vue({
            el: '#headNews',
            data:{
                imageList: [],
                headNewsList: []
            },
            mounted:function(){
                this.getPicNews();
                this.getHeadNewsList();
            },
            methods: {
                getPicNews: function () {
                    var vm = this;
                    this.$http.get('PicNews.ashx')
                    .then(function (response) {
                        var result = JSON.parse(response.data);
                        vm.imageList = result.rows;
                    })
                    .catch(function (response) {
                        console.log(response);
                    })
                },
                getHeadNewsList: function () {
                    var vm = this;
                    this.$http.get("HotNews.ashx")
                    .then(function (response) {
                        console.log(response.data);
                        var result = JSON.parse(response.data);
                        vm.headNewsList = result.rows;
                    })
                    .catch(function (response) {
                        console.log(response);
                    })
                }
            },
            filters: {
                hideOverflow: function (str) {
                    if (str.length > 100) {
                        return str.substr(0, 90) + "...";
                    } else {
                        return str;
                    }
                    
                }
            }
        })

        var dynamic = new Vue({
            el: '#dynamic',
            data: {
                apiUrl: 'News.ashx',
                newsList: [],
                total: 0,
                rows: 8,
                page: 1
            },
            mounted: function () {
                this.getNews();
            },
            methods: {
                getNews: function () {
                    var vm = this;
                    this.$http.get(this.apiUrl, { params: { page: this.page, rows: this.rows, type: 1 } })
                        .then(function (response) {
                            console.log(response.data);
                            var result = JSON.parse(response.data);
                            vm.total = result.total;
                            vm.newsList = result.rows;
                        })
                        .catch(function (response) {
                            console.log(response);
                        });
                },
                pageChanged: function (page) {
                    this.page = page;
                    this.getNews();
                }
            }
        });

        var strategy = new Vue({
            el: '#strategy',
            data: {
                apiUrl: 'News.ashx',
                newsList: [],
                total: 0,
                rows: 8,
                page: 1
            },
            mounted: function () {
                this.getNews();
            },
            methods: {
                getNews: function () {
                    var vm = this;
                    this.$http.get(this.apiUrl, { params: { page: this.page, rows: this.rows, type: 2 } })
                        .then(function (response) {
                            console.log(response.data);
                            var result = JSON.parse(response.data);
                            vm.total = result.total;
                            vm.newsList = result.rows;
                        })
                        .catch(function (response) {
                            console.log(response);
                        });
                },
                pageChanged: function (page) {
                    this.page = page;
                    this.getNews();
                }
            }
        });

        var technology = new Vue({
            el: '#technology',
            data: {
                apiUrl: 'News.ashx',
                newsList: [],
                total: 0,
                rows: 8,
                page: 1
            },
            mounted: function () {
                this.getNews();
            },
            methods: {
                getNews: function () {
                    var vm = this;
                    this.$http.get(this.apiUrl, { params: { page: this.page, rows: this.rows, type: 3 } })
                        .then(function (response) {
                            console.log(response.data);
                            var result = JSON.parse(response.data);
                            vm.total = result.total;
                            vm.newsList = result.rows;
                        })
                        .catch(function (response) {
                            console.log(response);
                        });
                },
                pageChanged: function (page) {
                    this.page = page;
                    this.getNews();
                }
            }
        });
    </script>
    </asp:Content>
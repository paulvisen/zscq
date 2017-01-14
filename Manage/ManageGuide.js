var manageGuide = new Vue({
    el: '#manage-guide',
    data: {
        list: []
    },
    methods: {
        getGuide: function(){
            var type = $("#ContentPlaceHolder1_hideType")[0].value;
            switch(type){
                case "Admin":
                    this.list = [
                        {
                            title: '用户管理',
                            guideImg: '../images/user_manage.png',
                            dropdown: [
                                {
                                    title: '个人用户管理',
                                    url: 'ManageMain.aspx#User/UserManage.aspx?type=2'
                                },
                                {
                                    title: '企业用户管理',
                                    url: 'ManageMain.aspx#User/UserManage.aspx?type=3'
                                },
                                {
                                    title: '科研院所管理',
                                    url: 'ManageMain.aspx#User/UserManage.aspx?type=4'
                                },
                                {
                                    title: '专家用户管理',
                                    url: 'ManageMain.aspx#User/UserManage.aspx?type=5'
                                },
                                {
                                    title: '管理员用户管理',
                                    url: 'ManageMain.aspx#User/UserManage.aspx?type=1'
                                },
                                {
                                    title: '待审核信息',
                                    url: 'ManageMain.aspx#User/UserAuth.aspx'
                                }
                            ]
                        },
                        {
                            title: '站点内容管理',
                            guideImg: '../images/bookmark_manage.png',
                            dropdown: [
                                {
                                    title: '新闻图片',
                                    url: 'ManageMain.aspx#News/PicNewsManage.aspx'
                                },
                                {
                                    title: '政策资讯',
                                    url: 'ManageMain.aspx#News/NewsManage.aspx'
                                },
                                {
                                    title: '资料下载',
                                    url: 'ManageMain.aspx#Download/DownloadManage.aspx'
                                }
                            ]
                        },
                        {
                            title: '交易信息管理',
                            guideImg: '../images/trade_manage.png',
                            dropdown: [
                                {
                                    title: '交易发布公告',
                                    url:'ManageMain.aspx#'
                                },
                                {
                                    title: '供应信息',
                                    url: 'ManageMain.aspx'
                                },
                                {
                                    title: '求购信息',
                                    url: 'ManageMain.aspx'
                                },
                                {
                                    title: '交易信息审核',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '跟踪评价',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        },
                        {
                            title: '拍卖管理',
                            guideImg: '../images/auc_manage.png',
                            dropdown: [
                                {
                                    title: '拍卖信息管理',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        },
                        {
                            title: '线下活动管理',
                            guideImg: '../images/activity_manage.png',
                            dropdown: [
                                {
                                    title: '活动管理',
                                    url: 'ManageMain.aspx#chengguo/XXJYManager.aspx'
                                },
                                {
                                    title: '参加用户管理',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        }
                    ]
                    break;                
                case "Expert":
                    this.list = [
                        {
                            title: '个人资料',
                            guideImg: '../images/user_manage.png',
                            dropdown: [
                                {
                                    title: '个人资料编辑',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        },
                        {
                            title: '评审意见',
                            guideImg: '../images/bookmark_manage.png',
                            dropdown: [
                                {
                                    title: '对成果提出评价或审核意见',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        },
                        {
                            title: '问题解答',
                            guideImg: '../images/help_manage.png',
                            dropdown: [
                                {
                                    title: '解答在线问题',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        }
                    ]
                    break;
                default:
                    this.list = [
                        {
                            title: '用户资料管理',
                            guideImg: '../images/user_manage.png',
                            dropdown: [
                                {
                                    title: '账号信息管理',
                                    url: 'ManageMain.aspx#User/AccountManage.aspx'
                                },
                                {
                                    title: '成果管理',
                                    url: 'ManageMain.aspx#chengguo/selldoneManager.aspx'
                                },
                                {
                                    title: '认证管理',
                                    url: 'ManageMain.aspx#User/AuthManage.aspx'
                                }
                            ]
                        },
                        {
                            title: '我的收藏',
                            guideImg: '../images/bookmark_manage.png',
                            dropdown: [
                                {
                                    title: '收藏的团队',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '收藏的成果',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '收藏的转让信息',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '收藏的需求信息',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '收藏的竞拍',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '收藏的专家',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        },
                        {
                            title: '供求交易',
                            guideImg: '../images/trade_manage.png',
                            dropdown: [
                                {
                                    title: '发布转让',
                                    url: 'ManageMain.aspx#chengguo/CGPub.aspx'
                                },
                                {
                                    title: '发布需求',
                                    url: 'ManageMain.aspx#chengguo/NeedPub.aspx'
                                },
                                {
                                    title: '我发布的转让',
                                    url: 'ManageMain.aspx#chengguo/CGManager.aspx'
                                },
                                {
                                    title: '我发布的需求',
                                    url: 'ManageMain.aspx#chengguo/NeedManager.aspx'
                                },
                                {
                                    title: '我购买的成果',
                                    url: 'ManageMain.aspx#chengguo/buyManager.aspx'
                                },
                                {
                                    title: '我卖出的成果',
                                    url: 'ManageMain.aspx#chengguo/sellManager.aspx'
                                }
                            ]
                        },
                        {
                            title: '在线竞拍',
                            guideImg: '../images/auc_manage.png',
                            dropdown: [
                                {
                                    title: '发布竞拍',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '我发布的竞拍',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '我参加的竞拍',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '竞拍规则',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        },
                        {
                            title: '线下活动',
                            guideImg: '../images/activity_manage.png',
                            dropdown: [
                                {
                                    title: '发布线下活动',
                                    url: 'ManageMain.aspx#chengguo/XXJYPub.aspx'
                                },
                                {
                                    title: '我发布的活动',
                                    url: 'ManageMain.aspx#chengguo/XXJYManager.aspx'
                                },
                                {
                                    title: '我参与的活动',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        },
                        {
                            title: '在线帮助',
                            guideImg: '../images/help_manage.png',
                            dropdown: [
                                {
                                    title: '联系管理员',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '客服电话',
                                    url: 'ManageMain.aspx#'
                                },
                                {
                                    title: '资料下载',
                                    url: 'ManageMain.aspx#'
                                }
                            ]
                        }
                    ]
                    break;
            }
        }
    }
})
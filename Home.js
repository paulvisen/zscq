var main = new Vue({
    el: '#main',
    data: {
        'imageList': [
            {
                src: '/images/lunbo3.jpg'
            },
            {
                src: '/images/lunbo1.jpg'
            },
            {
                src: '/images/lunbo2.jpg'
            }

        ],
        'newsTabList': [
            {
                id: 'news',
                title: '新闻动态'
            },
            {
                id: 'strategy',
                title: '最新政策'
            }
        ],
        'teamTabList': [
            {
                id: 'hotTeam',
                title: '热门团队'
            },
            {
                id: 'newTeam',
                title: '最新企业'
            }
        ],
        'dynamicList': [],
        'strategyList': [],
        'kejiTeamList': [],
        'keyanTeamList': [],
        'fuwuTeamList': [],
        'newAchievementList': [],
        'cgList': [],
        'needList': [],
        'tabList2': [
          {
              id: 'cg',
              title: '转让成果'
          },
          {
              id: 'need',
              title: '成果需求'
          }
        ],
        classifyList: [
          {
              title: '主要粮食作物',
              url: '/aspx/JYDT_list.aspx',
              child: [
                {
                    title: '原粮',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '成品粮',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '油料',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '油脂',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '粮油加工副产品',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '粮食制品',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '综合利用产品',
                    url: '/aspx/JYDT_list.aspx'
                }
              ]
          },
          {
              title: '果蔬及花卉',
              url: '/aspx/JYDT_list.aspx',
              child: [
                {
                    title: '蔬菜',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '果品',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '花卉',
                    url: '/aspx/JYDT_list.aspx'
                }
              ]
          },
          {
              title: '林产品',
              url: '/aspx/JYDT_list.aspx',
              child: [
                {
                    title: '木材及各种木材加工制品',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '经济林及森林副产品',
                    url: '/aspx/JYDT_list.aspx'
                }
              ]
          },
          {
              title: '禽畜产品',
              url: '/aspx/JYDT_list.aspx',
              child: [
                {
                    title: '家畜',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '家禽',
                    url: '/aspx/JYDT_list.aspx'
                },
                {
                    title: '其他',
                    url: '/aspx/JYDT_list.aspx'
                }
              ]
          },
          {
              title: '水产品',
              url: '/aspx/JYDT_list.aspx',
              child: [
                  {
                      title: '淡水产品',
                      url: '/aspx/JYDT_list.aspx'
                  },
                  {
                      title: '海水产品',
                      url: '/aspx/JYDT_list.aspx'
                  }, {
                      title: '其他水产品',
                      url: '/aspx/JYDT_list.aspx'
                  }
              ]
          },
          {
              title: '其他农副产品',
              url: '/aspx/JYDT_list.aspx',
              child: [
                {
                    title: '其他',
                    url: '/aspx/JYDT_list.aspx'
                }
              ]
          },
        ],
        offlineActivityList: [],
        achievement: {
            src: '/images/chengguo.png',
            title: 'XXXX',
            description: '成果介绍',
            team: 'XXXX'
        },
        expertList: [],
        serviceList1: [
          {
              url: '#',
              title: '食用菌栽培技术推广'
          },
          {
              url: '#',
              title: 'VCD蔬菜育苗关键技术'
          },
          {
              url: '#',
              title: '园艺种植技术咨询（种植技术、植保、生产管理）'
          },
          {
              url: '#',
              title: '专业农业技术指导'
          }
        ],
        serviceList2: [
            {
                url: '#',
                title: '购买农药和化肥免费提供种植技术指导'
            },
            {
                url: '#',
                title: '各种种植方案技术'
            },
            {
                url: '#',
                title: '都市时尚农业规划（生态家居、绿色办公、家庭园艺、室内绿化）'
            },
            {
                url: '#',
                title: '绿色农业生态型规划'
            }
        ],
        serviceList3: [
            {
                url: '#',
                title: '粮食作物专家'
            },
            {
                url: '#',
                title: '畜牧业养殖专家'
            },
            {
                url: '#',
                title: '果蔬花卉专家'
            },
            {
                url: '#',
                title: '林产品专家'
            }
        ],
        serviceList4: [
            {
                url: '#',
                title: '东南大学'
            },
            {
                url: '#',
                title: '南京农业大学'
            },
            {
                url: '#',
                title: '南京林业大学'
            },
            {
                url: '#',
                title: '扬州大学'
            }
        ],
        serviceList5: [
            {
                url: '#',
                title: '祥宏农机 收割服务'
            },
            {
                url: '#',
                title: '插秧 志鹏农机服务'
            },
            {
                url: '#',
                title: '旋耕 志鹏农机服务'
            },
            {
                url: '#',
                title: '收割 志鹏农机服务'
            }
        ],
        serviceList6: [
            {
                url: '#',
                title: '中安信业南京江宁分公司'
            },
            {
                url: '#',
                title: '江苏南京庆欣国际分公司'
            },
            {
                url: '#',
                title: '中国华融资产管理股份有限公司江苏分公司'
            },
            {
                url: '#',
                title: '江苏中贸融资担保有限公司'
            }
        ]
    },
    mounted: function () {
        this.getDynamics();
        this.getStrategies();
        //this.getPicNews();
        this.getKejiTeam();
        this.getKeyanTeam();
        this.getFuwuTeam();
        this.getNewAchievement();
        this.getExpert();
        this.getChengguo();
        this.getNeed();
        this.getOfflineActivity();
    },
    methods: {
        getDynamics: function () {
            var vm = this;
            this.$http.get('Views/News/News.ashx', { params: { page: 1, rows: 6, type: 1 } })
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.dynamicList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            });
        },
        getStrategies: function () {
            var vm = this;
            this.$http.get('Views/News/News.ashx', { params: { page: 1, rows: 6, type: 2 } })
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.strategyList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getPicNews: function () {
            var vm = this;
            this.$http.get('Views/News/PicNews.ashx')
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.imageList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getKejiTeam: function () {
            var vm = this;
            this.$http.get('Views/TeamPres/Team.ashx', { params: { page: 1, rows: 6, type: 1 } })
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.kejiTeamList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getKeyanTeam: function () {
            var vm = this;
            this.$http.get('Views/TeamPres/Team.ashx', { params: { page: 1, rows: 6, type: 2 } })
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.keyanTeamList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getFuwuTeam: function () {
            var vm = this;
            this.$http.get('Views/TeamPres/Team.ashx', { params: { page: 1, rows: 6, type: 3 } })
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.fuwuTeamList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getNewAchievement: function () {
            var vm = this;
            this.$http.get('Views/TeamPres/TeamAchievement.ashx')
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.newAchievementList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getExpert: function () {
            var vm = this;
            this.$http.get('Views/Expert/ExpertList.ashx')
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.expertList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getChengguo: function () {
            var vm = this;
            this.$http.get('ashx/jydt_list.ashx', { params: { page: 1, rows: 19, type: 1 } })
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.cgList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getNeed: function () {
            var vm = this;
            this.$http.get('ashx/jydt_list.ashx', { params: { page: 1, rows: 19, type: 2 } })
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.needList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        },
        getOfflineActivity: function () {
            var vm = this;
            this.$http.get('ashx/xxjy.ashx')
            .then(function (response) {
                var result = JSON.parse(response.data);
                vm.offlineActivityList = result.rows;
            })
            .catch(function (response) {
                console.log(response);
            })
        }
    }
})
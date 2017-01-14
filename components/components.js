/**
 * Created by jwcui on 2016/11/24.
 */
/*导航条*/
Vue.component('navigation', {
    props: ['headerList'],
    template:
    '<nav class="head navbar navbar-default">\
        <div class="container-fluid">\
            <ul class="nav navbar-nav">\
                <nav-item v-for="item in headerList" :item="item"></nav-item>\
            </ul>\
        </div>\
    </nav>',
    components: {
        'nav-item': {
            props: ['item'],
            template:
            '<li :class="{ dropdown : item.dropdown, active: active }" @mouseover="active = true" @mouseout="active = false">\
                <a :href="item.url">{{item.title}}</a>\
                <ul class="dropdown-menu" v-if="item.dropdown">\
                    <li v-for="dropdown in item.dropdown"><a :href="dropdown.url">{{dropdown.title}}</a></li>\
                </ul>\
            </li>',
            data: function () {
                return {
                    active: false
                };
            }
        }
    }
})

/*左侧导航栏*/
Vue.component('left-nav', {
    props: ['navList'],
    template:
    '<nav>\
        <ul class="nav nav-pills nav-stacked left-nav">\
            <li class="left-nav-header"><img src="/images/list.png">&nbsp;&nbsp;{{navList.header}}</li>\
            <li v-for="item in navList.items" class="left-nav-item"><a :href="item.url">{{item.title}}</a></li>\
        </ul>\
    </nav>'
})

/*轮播图片*/
Vue.component('carousel', {
    props: ['imageList', 'id', 'type', 'height'],
    template:
    '<div :id="id" class="carousel slide" data-ride="carousel" :class="{\'carousel-with-center-indicators\':type==1,\'carousel-with-side-indicators\':type==2}"\
        :style="\'height:\'+height">\
        <ol class="carousel-indicators">\
            <li v-for="n in imageList.length" :data-target="\'#\'+id" :data-slide-to="n-1" :class="{ active: n == 1}"><span v-if="type==2">{{n}}</span></li>\
        </ol>\
        <div class="carousel-inner">\
            <div v-for="(image, index) in imageList" class="item" :class="{active: index == 0}">\
                <a :href="image.url"><img :src="image.src" :style="\'width:100%;height:\'+height"></a>\
                <div class="carousel-caption">{{image.captain}}</div>\
            </div>\
        </div>\
    </div>'
})

/*标签页*/
Vue.component('tab-group', {
    props: {
        tabList: Array
    },
    template:
    '<div class="tab-group">\
        <ul class="nav nav-tabs">\
            <li v-for="(tab, index) in tabList" :class="{ active:index==0 }"><a data-toggle="tab" :href="\'#\'+tab.id">{{tab.title}}</a></li>\
        </ul>\
        <div class="tab-content">\
            <div v-for="(tab, index) in tabList" class="tab-pane fade" :class="{in:index==0,active:index==0}" :id="tab.id">\
                <slot :name="tab.id"></slot>\
            </div>\
        </div>\
    </div>'
})

/*带竖排标题的div*/
Vue.component('div-with-vertical-title', {
    props: ['title'],
    template:
    '<div class="div-with-vertical-title">\
        <div class="vertical-title">\
            {{title}}\
        </div>\
        <div class="vertical-bar">\
        </div>\
        <div style="float:left;width:96%;height:100%;padding-left:15px">\
            <slot>\
                没有内容\
            </slot>\
        </div>\
            <div class="clearfix">\
        </div>\
    </div>'
})

/*多列列表*/
Vue.component('multi-ul', {
    props: {
        list: Array,
        col: {
            type: Number,
            default: 1
        },
        underline: {
            type: Boolean,
            default: true
        }
    },
    template:
    '<ul class="multi-ul">\
        <li v-for="content in list" :class="className" \
            :style="underline ? \'border-bottom: 1px dashed lightgrey;\' : \'\'">\
            <a :href="content.url">{{content.title}}</a>\
        </li>\
        <div class="clearfix">\
        </div>\
    </ul>',
    computed: {
        className: function () {
            return 'multi-ul-' + this.col;
        }
    }
})

/*类别*/
Vue.component('classify', {
    props: ['list'],
    template:
    '<div>\
        <div v-for="item in list" class="classify">\
            <div><a :href="item.url">{{item.title}}</a></div>\
            <div>\
                <span v-for="(child,index) in item.child">\
                    <span v-if="index != 0">&nbsp;|&nbsp;\</span>\
                    <a :href="child.url">\
                        {{child.title}}\
                    </a>\
                </span>\
            </div>\
        </div>\
    </div>'
})

/*成果展示图片*/
Vue.component('achievement-show', {
    props: ['achievement'],
    template:
    '<div class="achievement-show">\
        <img :src="achievement.CGPicShow != \'\' ? achievement.CGPicShow : \'/images/chengguo.png\'"></img>\
        <div>\
            <div class="name overflow-hidden">成果名称：{{achievement.CGName}}</div>\
            <div class="description overflow-hidden">{{achievement.CGIntroduction}}</div>\
            <div>\
                <span class="overflow-hidden">所属团队：{{achievement.PublisherName}}</span>&nbsp;&nbsp;\
                <a class="btn btn-primary" :href="\'Views/TeamPres/TeamInfo.aspx?tid=\' + achievement.PublisherId + \'&type=\' + achievement.PublisherType">查看团队</a>\
            </div>\
        </div>\
    </div>'
})

/*专家*/
Vue.component('expert-show', {
    props: ['expert'],
    template:
    '<div class="expert">\
        <img :src="expert.ZJPhoto != \'\' ? expert.ZJPhoto : \'/images/expert.png\'"></img>\
        <div class="name">{{expert.ZJName}}</div>\
        <div class="overflow-hidden">{{expert.BelongSite}}</div>\
        <div class="overflow-hidden">技术领域：{{expert.ResearchArea}}</div>\
    </div>'
})

/*服务*/
Vue.component('service', {
    props: ['serviceList', 'icon'],
    template:
    '<div class="service">\
        <img :src="icon"></img>\
        <ul>\
            <li v-for="(service,index) in serviceList">\
                <span>{{index+1}}</span>&nbsp;&nbsp;\
                <a :href="service.url">{{service.title}}</a>\
            </li>\
        </ul>\
        <div class="clearfix"></div>\
    </div>'
})

/*分页*/
Vue.component('pagebar', {
    props: {
        total: Number,
        perPage: Number,
        visible: {
            type: Number,
            default: 5
        },
        currentPage: {
            type: Number,
            default: 1
        }
    },
    data: function(){
        return {
            inputPage: 1
        }
    },
    computed:{
        totalPage:function(){
            return Math.ceil(this.total / this.perPage);
        }
    },
    template:
    '<div class="pagebar" v-if="total != 0">\
        <ul class="pagination pointer">\
            <li @click="pageChange(currentPage-1)" :class="currentPage==1?\'invisible\':\'visible\'"><a>&laquo;</a></li>\
            <li v-for="n in Math.ceil(total/perPage)" :class="{active:currentPage==n}" @click="pageChange(n)" \
                v-if="(currentPage >= visible && n <= currentPage && n > currentPage-visible) || (currentPage < visible && n <= visible)">\
                <a>{{n}}</a>\
            </li>\
            <li @click="pageChange(currentPage+1)" :class="currentPage==totalPage?\'invisible\':\'visible\'"><a>&raquo;</a></li>\
        </ul>\
        <div>共{{total}}条记录</div>\
        <div>到第</div>\
        <input v-model="inputPage"></input>\
        <div>页</div>\
        <div class="btn btn-default" @click="pageChange(inputPage)">确定</div>\
    </div>',
    methods: {
        pageChange: function (page) {
            if (page > 0 && page <= this.totalPage) {
                this.$emit('pagechanged', Number(page));
            } else {
                alert('输入错误');
            }
        }
    }

})

/*后台引导页*/
Vue.component('manage-guide', {
    props: ['list'],
    template:
    '<div class="manage-guide">\
        <nav class="navbar navbar-default">\
            <ul class="nav navbar-nav">\
                <li v-for="(item,index) in list" :class="{active:active==index,ml5:index!=0}" \
                    @mouseover="active = index">\
                    <img :src="item.guideImg"/>\
                    <p>{{item.title}}</p>\
                </li>\
            </ul>\
        </nav>\
        <div class="clearfix"></div>\
        <ul class="child-guide" v-if="active!=-1">\
            <li v-for="dropdown in list[active].dropdown">\
                <a class="white" :href="dropdown.url">{{dropdown.title}}</a>\
            </li>\
        </ul>\
    </div>',
    data: function () {
        return {
            active: 0
        }
    }
})

Vue.config.devtools = true
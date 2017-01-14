<%@ Page Title="" Language="C#" MasterPageFile="~/aspx/jydt_site.Master" AutoEventWireup="true" CodeBehind="jygz.aspx.cs" Inherits="zscq.aspx.jygz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="user_list">
        <span class="user_listL"><a href="#">首页&nbsp;</a>><a href="#">&nbsp;交易大厅</a></span>
        <span class="user_listR">欢迎您，<asp:Label ID="username" runat="server" Text="XXXXXX"></asp:Label>用户！&nbsp;&nbsp;&nbsp;<a href="#">我的收藏&nbsp;&nbsp;&nbsp;</a><a href="#">我的交易&nbsp;&nbsp;&nbsp;</a><a href="../Manage/ManageMain.aspx">管理中心&nbsp;&nbsp;&nbsp;</a></span>
    </div>
    <%--<div class="contentjydt">--%>
    <%-- 主要内容-左边 --%>
    <div class="contentL">
        <%--行业类别栏 --%>
        <div class="fenlei">
            <ul style="position: relative; top: 30px; padding: 0px; width: 240px;">
                <li>
                    <h2 class="fenlei_head ">主要粮食作物成果</h2>
                    <div class="fenlei_list">
                        <a href="#">原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                        <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                    </div>
                    <div class="pop">
                        <h3><a href="#">主要粮食作物成果</a></h3>
                        <dl>
                            <dt>原粮</dt>
                            <dd>
                                <a class="ui-link" href="#">西湖龙井</a>
                                <a class="ui-link" href="#">龙井</a>
                                <a class="ui-link" href="#">黄山毛峰</a>
                                <a class="ui-link" href="#">安吉白茶</a>
                                <a class="ui-link" href="#">其他绿茶</a>
                            </dd>
                            <dt>成品粮</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link" href="">白毫银针</a>
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>
                            <dt>油料</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link" href="">白毫银针</a>
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>

                        </dl>
                    </div>
                </li>


                <li>
                    <h2 class="fenlei_head ">果蔬及花卉成果</h2>
                    <div class="fenlei_list">
                        <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                        <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                    </div>
                    <div class="pop">
                        <h3><a href="#">主要粮食作物成果</a></h3>
                        <dl>

                            <dt>绿茶</dt>
                            <dd>
                                <a class="ui-link" href="#">西湖龙井</a>
                                <a class="ui-link" href="#">龙井</a>
                                <a class="ui-link" href="#">黄山毛峰</a>
                                <a class="ui-link" href="#">安吉白茶</a>
                                <a class="ui-link" href="#">其他绿茶</a>
                            </dd>


                            <dt>白茶</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link" href="">白毫银针</a>
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>

                        </dl>
                    </div>
                </li>


                <li>
                    <h2 class="fenlei_head ">林产品成果</h2>
                    <div class="fenlei_list">
                        <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                        <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                    </div>
                    <div class="pop">
                        <h3><a href="#">主要粮食作物成果</a></h3>
                        <dl>

                            <dt>绿茶</dt>
                            <dd>
                                <a class="ui-link" href="#">西湖龙井</a>
                                <a class="ui-link" href="#">龙井</a>
                                <a class="ui-link" href="#">黄山毛峰</a>
                                <a class="ui-link" href="#">安吉白茶</a>
                                <a class="ui-link" href="#">其他绿茶</a>
                            </dd>


                            <dt>白茶</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link" href="">白毫银针</a>
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>

                        </dl>
                    </div>
                </li>


                <li>
                    <h2 class="fenlei_head ">畜牧产品成果</h2>
                    <div class="fenlei_list">
                        <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                        <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                    </div>
                    <div class="pop">
                        <h3><a href="#">主要粮食作物成果</a></h3>
                        <dl>

                            <dt>绿茶</dt>
                            <dd>
                                <a class="ui-link" href="#">西湖龙井</a>
                                <a class="ui-link" href="#">龙井</a>
                                <a class="ui-link" href="#">黄山毛峰</a>
                                <a class="ui-link" href="#">安吉白茶</a>
                                <a class="ui-link" href="#">其他绿茶</a>
                            </dd>


                            <dt>白茶</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link" href="">白毫银针</a>
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>

                        </dl>
                    </div>
                </li>


                <li>
                    <h2 class="fenlei_head ">水产品成果</h2>
                    <div class="fenlei_list">
                        <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                        <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                    </div>
                    <div class="pop">
                        <h3><a href="#">主要粮食作物成果</a></h3>
                        <dl>

                            <dt>绿茶</dt>
                            <dd>
                                <a class="ui-link" href="#">西湖龙井</a>
                                <a class="ui-link" href="#">龙井</a>
                                <a class="ui-link" href="#">黄山毛峰</a>
                                <a class="ui-link" href="#">安吉白茶</a>
                                <a class="ui-link" href="#">其他绿茶</a>
                            </dd>


                            <dt>白茶</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link" href="">白毫银针</a>
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>

                        </dl>
                    </div>
                </li>


                <li>
                    <h2 class="fenlei_head ">农资农机成果</h2>
                    <div class="fenlei_list">
                        <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                        <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                    </div>
                    <div class="pop">
                        <h3><a href="#">主要粮食作物成果</a></h3>
                        <dl>

                            <dt>绿茶</dt>
                            <dd>
                                <a class="ui-link" href="#">西湖龙井</a>
                                <a class="ui-link" href="#">龙井</a>
                                <a class="ui-link" href="#">黄山毛峰</a>
                                <a class="ui-link" href="#">安吉白茶</a>
                                <a class="ui-link" href="#">其他绿茶</a>
                            </dd>


                            <dt>白茶</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link" href="">白毫银针</a>
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>

                        </dl>
                    </div>
                </li>


                <li>
                    <h2 class="fenlei_head ">其他成果</h2>
                    <div class="fenlei_list">
                        <a>原粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>成品粮</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>油料</a><br />
                        <a>油脂</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮油加工副产品</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a>粮食制品</a>
                    </div>
                    <div class="pop">
                        <h3><a href="#">主要粮食作物成果</a></h3>
                        <dl>

                            <dt>绿茶</dt>
                            <dd>
                                <a class="ui-link" href="#">西湖龙井</a>
                                <a class="ui-link" href="#">龙井</a>
                                <a class="ui-link" href="#">黄山毛峰</a>
                                <a class="ui-link" href="#">安吉白茶</a>
                                <a class="ui-link" href="#">其他绿茶</a>
                            </dd>


                            <dt>白茶</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link" href="">白毫银针</a>
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>

                        </dl>
                    </div>
                </li>

            </ul>

        </div>
        <div style="float: left; position: relative; left: 20px;">
            <a href="#">
                <div class="col1">&nbsp;中介机构</div>
            </a>
            <a href="#">
                <div class="col2">&nbsp;法务机构</div>
            </a>
            <a href="#">
                <div class="col1">&nbsp;代理机构</div>
            </a>
            <a href="#">
                <div class="col2">&nbsp;常用下载</div>
            </a>
            <div class="col3">
                <img src="../images/kefu.png" />
            </div>
        </div>


    </div>
    <div class="contentR" style="position: relative; left: 10px; font: 13px microsoft yahei; line-height: 25px; margin: 12px auto; width: 910px;">
        <%--<div style="margin: 4px 10px;"><a href="JYDT.aspx">交易大厅</a>&nbsp;&nbsp;>&nbsp;&nbsp;交易公告&交易规则</div>
        <hr style="height: 2px; border: none; border-top: 2px solid rgb(220,220,220);" />--%>
      
        <div class="jygg0" >
         <p style="font-size:17px;font-weight:600;text-align:center;">江苏省农业科技成果交易与服务交易云平台交易规则</p>
          <p style="text-align:center;">发布时间：2016-11-12</p>
          <div style="width:850px; white-space:pre-wrap;margin:0 auto;">     为保证江苏省农业科技成果交易与服务交易云平台供应信息合法性、真实性、完整性、相关性、维护交易秩序，避免出现非法信息、虚假信息、重复信息，制定本规范。
 
<b>信息发布规则</b>
重复信息定义：相同类目、规格、品种属于同一信息
1.未实名认证会员只能发布3条（包括销售中、已下架、被驳回、删除的供应）
2.非农批通会员每日最多发布5条，农批通会员无限发布。（包括销售中、已下架、被驳回、删除的供应）
3.无分类供应不能发布
4.同类目每个账号只能保留60条（销售中） 
5.同类目同品种每个账号只能保留10条（销售中）
6.同类目同品种同规格每个账号只能保留3条（销售中） 

（类目：指第三级类目，如水果蔬菜〉水果〉苹果，这里的类目指“苹果”这一级）

<b>审核规范</b>
标题：
1.同一标题中只能包含一种产品品种
2.不得出现广告信息
3.产品标题必须写明产品名称
4.产品标题请勿出现联系方式
5.产品标题必须与图片、详细说明保持一致
图片：
1.图片请保持清晰、无水印、无电话的实物图
2.图片请勿上传资质证件（营业执照、身份证、组织机构）
3.图片请勿上传二维码
4.图片不能带有与本站无关的水印或者其它（非惠农网）平台的标识及字段
5.未经过人民银行的允许，禁止上传人民币图案
详细说明：
1.详情请与标题、图片保持一致
2.详情描述清楚产品的功能、规格、价格、图片、交易方式等相关说明
3.杜绝出现其它（非惠农网）平台的标识及链接
4.国家保护性动物或特定产品详情中请描述是否属于人工养殖并上传相关资质证件
5.产品介绍不得出现虚假、夸大等与产品信息不一致的表述
产品价格：
为了保障信息的真实性和及时性，请正确填写符合市场行情的价格，如有变动请及时跟新，不能以虚假不实的价格吸引买家眼球。
最新广告法：
不得出现违禁词及敏感词：如：国家级、世界级、最高级、最佳、最大、第一、唯一、首个、首选、最好、最大、精确、顶级、最高、最低、最、最具、最便宜、最新、最先进、最大程度、最新技术、最先进科学、国家级产品、填补国内空白、绝对、独家、首家、最新、最先进、第一品牌、金牌、名牌、优秀、最先、顶级、独家、全网销量第一、全球首发、全国首家、全网首发、世界领先、顶级工艺、最新科学、最新技术、最先进加工工艺、最时尚、极品、顶级、顶尖、终极、最受欢迎、王牌、销量冠军、第一（NO.1/Top1）、极致、永久、王牌、掌门人、领袖品牌、独一无二、独家、绝无仅有、前无古人、史无前例、万能等均属于极限用语。极限用语包括但不仅限于商品列表页、商品的标题，副标题，主图以及详情页，商品包装等。但有事实依据且能完整清楚表示，不至引人误解的允许使用
 
<b>判断标准及处理方式</b>
第一：非法信息（信息中包含黄、赌、毒非法文字及链接）
中国惠农网有权下架和删除信息
第二：发布违禁信息（国家禁止发布的物品及与惠农网违禁产品）
立即删除该产品信息，同时根据情节轻重对会员予以警告、帐号限权直至帐号关闭等处罚。
第三：发布虚假信息（1.产品标题、详情、包装等明显与内容不符，过分承诺、明示或暗示有治疗作用的词语妨害买家权益的行为）
删除或关闭虚假交易的内容，并根据情节轻重对会员予以警告、帐号限权直至帐号关闭等处罚
第四：发布广告信息（信息标题、图片、补充说明出现与农业无关或其它（非惠农网）平台的标识及侵犯第三方合法权益的内容）
中国惠农网有权下架或删除信息
第五：发布重复信息
不符合平台发布规则的重复信息，有权删除或下架产品</div>
           
        </div>
    </div>

</asp:Content>

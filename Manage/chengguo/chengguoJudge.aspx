<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chengguoJudge.aspx.cs" Inherits="zscq.Manage.chengguo.chengguoJudge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>judge</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        a {
        text-decoration:none;
        color:#808080;
        }

        body {
            color: #666;
            font: 12px/1.5 Arial;
        }
        /* star */
        .star {
            position: relative;
            width: 600px;
            margin: 20px auto;
            height: 24px;
        }

            .star ul, .star span {
                float: left;
                display: inline;
                height: 19px;
                line-height: 19px;
            }

            .star ul {
                margin: 0 10px;
            }

            .star li {
                float: left;
                width: 24px;
                cursor: pointer;
                text-indent: -9999px;
                background: url(../../images/star.png) no-repeat;
            }

            .star strong {
                color: #f60;
                padding-left: 10px;
            }

            .star li.on {
                background-position: 0 -28px;
            }

            .star p {
                z-index: 10;
                position: absolute;
                top: 20px;
                width: 159px;
                height: 60px;
                display: none;
                background: url(../../images/icon.gif) no-repeat;
                padding: 7px 10px 0;
            }

                .star p em {
                    color: #f60;
                    display: block;
                    font-style: normal;
                }
        .img {
        margin:2px;
        
        }
    </style></head>
<body>
    <form id="form1" runat="server">
        
        <div class="star" style="height: 170px;">
            <span style="display: inline-block; width:105px;">
                <asp:Image ID="Image1" runat="server" Width="100px" Height="100px"  cssclass="img"  />
                <label id="cgname" runat="server"></label>
            </span>
            <textarea name="txtjud" cols="55" rows="9" style="margin-left: 15px;"></textarea>
        </div>
        <div class="form-group">
            <span class="col-sm-2 control-label" style="display:inline-block;">晒图片</span>
            <div class="col-sm-10" style="margin-left:70px;">
                <%--<asp:Image ID="Image1" runat="server" Height="200px" Width="200px" />--%>
                <%--<p id="delImg" runat="server"><a href="javascript:delImg()">删除</a></p>--%>
                <div id="Imgupld" runat="server">
                    <div id="fileQueue">
                    </div>
                    <input type="file" name="uploadify" id="uploadify"  />
                    <p>
                        <a id="upld" href="javascript:$('#uploadify').uploadify('upload')">上传</a>| 
                        <a href="javascript:$('#uploadify').uploadify('cancel')">取消上传</a>
                    </p>
                    <input type="text" value="" style="display: none;" name="imgurl" id="imgurl" /><!--这里的input用于提交数据，给他们个name/id就好-->
                </div>
            </div>
        </div>
        <link href="../../css/uploadify.css" rel="stylesheet" />
        <script src="../../js/jquery-2.1.1.min.js"></script>
        <script src="../../js/jquery.uploadify-3.1.js"></script>
        <script src="../../js/jquery.uploadify-3.1.min.js"></script>
       
        <script type="text/javascript">
            $(function () {
                if ($("#ContentPlaceHolder2_hideImgPath").val() != "") {
                    $("#ContentPlaceHolder2_Image1").attr("src", $("#ContentPlaceHolder2_hideImgPath").val());
                }
                var img = document.getElementById("imgurl");
                $("#uploadify").uploadify({
                    //指定swf文件
                    'swf': '../../ashx/uploadify.swf',
                    //后台处理的页面
                    'uploader': '../../ashx/UploadHandler.ashx?',
                    //按钮显示的文字
                    'buttonText': '上传图片',
                    //显示的高度和宽度，默认 height 30；width 120
                    //'height': 15,
                    //'width': 80,
                    //上传文件的类型  默认为所有文件    'All Files'  ;  '*.*'
                    //在浏览窗口底部的文件类型下拉菜单中显示的文本
                    'fileTypeDesc': 'Image Files',
                    //允许上传的文件后缀
                    'fileTypeExts': '*.gif; *.jpg; *.png',
                    //发送给后台的其他参数通过formData指定
                    //'formData': { 'fileTitle': '22' },
                    //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
                    //'queueID': 'fileQueue',
                    //选择文件后自动上传
                    'auto': false,
                    //设置为true将允许多文件上传
                    'multi': true,
                    'removeCompleted': false,
                    //上传后执行
                    'onUploadSuccess': function (file, data, response) {
                        if (data != "0") {
                            img.value = img.value + data + ",";
                        }

                    }
                });
            });
            function delImg() {
                $("#ContentPlaceHolder2_Image1").attr("src", "");//置空
                $("#ContentPlaceHolder2_hideImgPath").val("");//地址清除
                $("#ContentPlaceHolder2_Imgupld").attr("style", "display:block");//显示上传栏
                $("#ContentPlaceHolder2_delImg").attr("style", "display:none");//隐藏删除
            }

            function neo(id) { //这里id
                var in0 = 5, in1 = 5, in2 = 5;
                var oStar = document.getElementById(id);
                var aLi = oStar.getElementsByTagName("li");
                var oUl = oStar.getElementsByTagName("ul")[0];
                var oSpan = oStar.getElementsByTagName("span")[1];
                var oP = oStar.getElementsByTagName("p")[0];
                var input = oStar.getElementsByTagName("input")[0];
                var i = iScore = iStar = 0;
                var aMsg = [
                            "很不满意|差得太离谱，与卖家描述的严重不符，非常不满",
                            "不满意|部分有破损，与卖家描述的不符，不满意",
                            "一般|质量一般，没有卖家描述的那么好",
                            "满意|质量不错，与卖家描述的基本一致，还是挺满意的",
                            "非常满意|质量非常好，与卖家描述的完全一致，非常满意"
                ]

                for (i = 1; i <= aLi.length; i++) {
                    aLi[i - 1].index = i;
                    //鼠标移过显示分数
                    aLi[i - 1].onmouseover = function () {
                        fnPoint(this.index);
                        //浮动层显示
                        oP.style.display = "block";
                        //计算浮动层位置
                        oP.style.left = oUl.offsetLeft + this.index * this.offsetWidth - 104 + "px";
                        //匹配浮动层文字内容
                        oP.innerHTML = "<em><b>" + this.index + "</b> 分 " + aMsg[this.index - 1].match(/(.+)\|/)[1] + "</em>" + aMsg[this.index - 1].match(/\|(.+)/)[1]
                    };

                    //鼠标离开后恢复上次评分
                    aLi[i - 1].onmouseout = function () {
                        fnPoint(input.value);
                        //关闭浮动层
                        oP.style.display = "none"
                    };
                    //点击后进行评分处理
                    aLi[i - 1].onclick = function () {
                        iStar = this.index;
                        oP.style.display = "none";
                        oSpan.innerHTML = "<strong>" + (this.index) + " 分</strong> (" + aMsg[this.index - 1].match(/\|(.+)/)[1] + ")";
                        input.value = this.index;
                    }
                }
                //评分处理
                function fnPoint(iArg) {
                    //分数赋值
                    iScore = iArg || iStar;
                    for (i = 0; i < aLi.length; i++) aLi[i].className = i < iScore ? "on" : "";
                }

            };
        </script>

        <div id="star" class="star" onmouseover="neo('star')">
            <span style="display: inline-block;">成果质量</span>
            <ul>
                <li class="on"><a href="javascript:;">1</a></li>
                <li class="on"><a href="javascript:;">2</a></li>
                <li class="on"><a href="javascript:;">3</a></li>
                <li class="on"><a href="javascript:;">4</a></li>
                <li class="on"><a href="javascript:;">5</a></li>
            </ul>
            <span><strong>5 分</strong> (质量非常好，与卖家描述的完全一致，非常满意)</span>
            <input type="text" value="5" style="display: none;" name="input0" /><!--这里的input用于提交数据，给他们个name/id就好-->
            <p style="display: none; left: 60px;"><em><b>3</b> 分 一般</em>质量一般，没有卖家描述的那么好</p>
        </div>
        <%--<hr/>--%>
        <div id="name" class="star" onmouseover="neo('name')">
            <span style="display: inline-block;">描述相符</span>
            <ul>
                <li class="on"><a href="javascript:;">1</a></li>
                <li class="on"><a href="javascript:;">2</a></li>
                <li class="on"><a href="javascript:;">3</a></li>
                <li class="on"><a href="javascript:;">4</a></li>
                <li class="on"><a href="javascript:;">5</a></li>
            </ul>
            <span><strong>5 分</strong> (质量非常好，与卖家描述的完全一致，非常满意)</span>
            <input type="text" value="5" style="display: none;" name="input1" />
            <p style="display: none; left: 60px;"><em><b>3</b> 分 一般</em>质量一般，没有卖家描述的那么好</p>
        </div>
        <%--<hr/>--%>
        <div id="na" class="star" onmouseover="neo('na')">
            <span style="display: inline-block;">卖家服务</span>
            <ul>
                <li class="on"><a href="javascript:;">1</a></li>
                <li class="on"><a href="javascript:;">2</a></li>
                <li class="on"><a href="javascript:;">3</a></li>
                <li class="on"><a href="javascript:;">4</a></li>
                <li class="on"><a href="javascript:;">5</a></li>
            </ul>
            <span><strong>5 分</strong> (质量非常好，与卖家描述的完全一致，非常满意)</span>
            <input type="text" value="5" style="display: none;" name="input2" />
            <p style="display: none; left: 60px;"><em><b>3</b> 分 一般</em>质量一般，没有卖家描述的那么好</p>
        </div>
        <div class="star">
            <asp:Button Style="width: 80px; margin: 0px; height: 30px; line-height: 20px; background: #707070; float: right; color: #fff; text-align: center; font-size: 15px;" ID="search0" runat="server" OnClick="Button1_Click" Text="提交" />

        </div>

         <style type="text/css">
            .form-group {
            width:600px;
            margin:20px auto;
            }
            .uploadify-button {
            background-color:rgb(255,175,0);
            border:none;
            }
        </style>
    </form>
</body>
</html>

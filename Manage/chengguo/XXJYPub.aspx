<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XXJYPub.aspx.cs" Inherits="zscq.Manage.chengguo.XXJYPub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../css/uploadify.css" rel="stylesheet" />
     <script src="../../js/jquery-2.1.1.min.js"></script>
    <script src="../../js/WdatePicker.js"></script>
     <style type="text/css">
        a {
            text-decoration: none;
            color: #000;
        }

        ._pubdiv {
            font: 14px microsoft yahei;
            margin-left: 30px;
        }

        ._red {
            color: red;
        }

        ._hidden {
            /*visibility: hidden;*/
            display:none;
        }

        ._show {
            /*visibility: visible;*/
            display:inline-block;
        }

        .uploadify-button {
            border: none;
            margin: 10px 0px;
        }
         tr {
         line-height:35px;
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div id="fade" name="fade" runat="server" class="_pubdiv">
            <h3 class="_mgrban"><span>成果需求信息登记 &nbsp;&nbsp;&nbsp;温馨提示：带<span class="_red">*</span>的为必填</span></h3>
            <br />
           
            <table  cellpadding="2" cellspacing="1" border="0">
                <tbody>
                    <tr>
                        <td width="20%">
                            <span class="_red">*</span>线下活动名称:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="xxjy_name"  runat="server"  size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="_red">*</span>活动简介(150字以内):
                        </td>
                        <td colspan="3">
                            <textarea rows="10" type="text" cols="70"  id="details_short"  runat="server"></textarea>
                        </td>
                    </tr>
                 
                    <tr>
                        <td width="20%">活动主办方:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="host"  runat="server"  size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">活动地点:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="location"  runat="server"  size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">联系电话:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="con_phone"  runat="server"  size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td>活动开始时间:
                        </td>
                        <td >
                                    <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"  required="" aria-required="true" id="start_time" runat="server" />
                        </td>
                        <td>活动结束时间:
                        </td>
                        <td >
                                    <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"  required="" aria-required="true" id="end_time" runat="server" />
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <span class="_red">*</span>活动主要内容:
                        </td>
                        <td colspan="3">
                            <textarea rows="10" type="text" cols="70"  id="main_content"  runat="server"></textarea>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <span class="_red">*</span>活动日程:
                        </td>
                        <td colspan="3">
                            <textarea rows="10" type="text" cols="70"  id="timeline"  runat="server"></textarea>
                        </td>
                    </tr>
                     <tr>
                        <td>相关图片上传:
                        </td>
                        <td colspan="3" id="materials">
                            <div id="Imgupld" runat="server">
                                <div id="fileQueue">
                                </div>
                                <input type="file" name="uploadify" id="uploadify" />
                                <p>
                                    <a id="upld" href="javascript:$('#uploadify').uploadify('upload')">上传</a>| 
                                    <a href="javascript:$('#uploadify').uploadify('cancel')">取消上传</a>
                                </p>
                                <input type="text" value="" style="display: none;" name="image_url" id="image_url" runat="server" /><!--这里的input用于提交数据，给他们个name/id就好-->
                                
                                <input type="text" value="" style="display: none;" name="image_list" id="image_list" runat="server" />
                            </div>
                        </td>
                    </tr>
                  
                    <tr>
                        <td colspan="4">
                            <br />
                           
                            <asp:Button Text="提交" style="background:rgb(100,100,100);color:#fff;width:80px;height:30px;" runat="server" ID="Button1" OnClick="sumitme_Click" />

                        </td>
                    </tr>
                </tbody>
            </table>
            <br />
        </div>
    </div>
         <script src="../../js/jquery.uploadify-3.1.js"></script>
        <script src="../../js/jquery.uploadify-3.1.min.js"></script>
        <script type="text/javascript">
            $(function () {
                if ($("#ContentPlaceHolder2_hideImgPath").val() != "") {
                    $("#ContentPlaceHolder2_Image1").attr("src", $("#ContentPlaceHolder2_hideImgPath").val());
                }
                var img = document.getElementById("image_url");
                var img0 = document.getElementById("image_list");
                $("#uploadify").uploadify({
                    //指定swf文件
                    'swf': 'uploadify.swf',
                    //后台处理的页面
                    'uploader': 'UploadHandler.ashx?',
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
                            img0.value = data;
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


        </script>
    </form>
</body>
</html>

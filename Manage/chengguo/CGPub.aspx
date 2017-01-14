<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CGPub.aspx.cs" Inherits="zscq.Manage.chengguo.CGPub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../css/uploadify.css" rel="stylesheet" />
    <script src="../../js/jquery-2.1.1.min.js"></script>
    <script src="../../js/WdatePicker.js"></script>
    <title></title>
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
            display: none;
        }

        ._show {
            /*visibility: visible;*/
            display: inline-block;
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
    <form id="form2" runat="server">
        <div id="fade" name="fade" runat="server" class="_pubdiv">
            <h3 class="_mgrban"><span>成果转让信息登记 &nbsp;&nbsp;&nbsp;温馨提示：带<span class="_red">*</span>的为必填</span></h3>
            <br />
            <div id="draftsmen">
            </div>
            <table cellpadding="2" cellspacing="1" border="0">
                <tbody>
                    <tr>
                        <td width="20%">
                            <span class="_red">*</span>成果名称:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="CGName" runat="server" size="70" />
                             
                        </td>
                       
                    </tr>
                    <tr>
                        <td>
                            <span class="_red">*</span>成果简介(140字以内):
                        </td>
                        <td colspan="3">
                            <textarea rows="10" type="text" cols="70" id="CGDetails_short" runat="server"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="_red">*</span>成果关键词:
                        </td>
                        <td colspan="3" class="_ft13">
                            <input type="text" id="keyword1" runat="server" />
                            <input type="text" id="keyword2" runat="server" />
                            <input type="text" id="keyword3" runat="server" />
                            <input type="hidden" runat="server" id="keyword" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">单位:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="CGCompany" runat="server" size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">联系人:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="ConPerson" runat="server" size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">电话:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="ConPhone" name="ConPhone" runat="server" size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">主要完成人:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="main_person" name="main_person" runat="server" size="20" />  <%-- 如果为一个人要改成70--%>
                             <input type="text" id="Text1" name="main_person" runat="server" size="20" /> 
                             <input type="text" id="Text2" name="main_person" runat="server" size="20" /> 
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">主要完成人电话:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="main_person_phone" name="main_person_phone" runat="server" size="20" /><%-- 如果为一个人要改成70--%>
                             <input type="text" id="Text3" name="main_person" runat="server" size="20" /> 
                             <input type="text" id="Text4" name="main_person" runat="server" size="20" /> 
                        </td>
                    </tr>
                    <tr>
                        <td>成果登记时间:
                        </td>
                        <td colspan="3">
                            <table>
                                <tr>
                                    <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" required="" aria-required="true" id="RegTime" runat="server" />
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class=" _ft13">品种审定号或专利号:
                        </td>
                        <td colspan="3">
                            <input type="text" id="PatentNum" runat="server" size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td><span class="_red">*</span>知识产权类型:
                        </td>
                        <td colspan="3">
                            <input type="radio" name="CGType" runat="server" value="品系" />品系
								<input type="radio" name="CGType" runat="server" value="品种" />品种
								<input type="radio" name="CGType" runat="server" value="专利" />专利
								<input type="radio" name="CGType" runat="server" value="农药" />农药
								<input type="radio" name="CGType" runat="server" value="兽药" />兽药
                            <input type="radio" name="CGType" runat="server" value="专有技术" />专有技术
                             <input type="radio" name="CGType" runat="server" value="其他" />其他&nbsp;&nbsp;<input type="text" id="qtCGType" class="_hidden" />
                            <input type="hidden" value="" runat="server" id="CGType" />
                        </td>
                    </tr>
                    <tr>
                        <td><span class="_red">*</span>拟转化方式:
                        </td>
                        <td colspan="3">
                            <input type="radio" name="TransMode" runat="server" value="独占许可" />独占许可
                            <input type="radio" name="TransMode" runat="server" value="独家许可" />独家许可
                            <input type="radio" name="TransMode" runat="server" value="普通许可" />独占许可
                            <input type="radio" name="TransMode" runat="server" value="所有权转让" />所有权转让
                            <input type="radio" name="TransMode" runat="server" value="合作开发" />合作开发<br />
                            <input type="radio" name="TransMode" runat="server" value="技术服务" />技术服务
								<input type="radio" name="TransMode" runat="server" value="技术咨询" />技术咨询
                             <input type="radio" name="TransMode" runat="server" value="其他方式" />其他方式&nbsp;&nbsp;<input type="text" id="qtTransMode" class="_hidden" />
                            <input type="hidden" value="" runat="server" id="TransMode" />

                        </td>
                    </tr>

                    <tr>
                        <td>预期交易价格:
                        </td>
                        <td colspan="3">
                            <table>
                                <tr>

                                    <td>
                                        <input type="text" id="TransPrice" runat="server" /></td>
                                    <td>万元</td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>所属领域:<br />
                            <span>（可多选）</span>
                        </td>
                        <td colspan="3">
                            <table>

                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="checkbox" value="主要粮食作物成果" id="CGField0" runat="server" />主要粮食作物成果
                                        </td>
                                        <td class="auto-style1">
                                            <input type="checkbox" value="果蔬及花卉成果" id="CGField1" runat="server" />果蔬及花卉成果</td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <input type="checkbox" value="林产品成果" id="CGField2" runat="server" />林产品成果
                                        </td>
                                        <td class="auto-style1">
                                            <input type="checkbox" value="畜禽产品成果" id="CGField3" runat="server" />畜禽产品成果 </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <input type="checkbox" value="水产品成果" id="CGField4" runat="server" />水产品成果
                                        </td>
                                        <td class="auto-style1">
                                            <input type="checkbox" value="其他" runat="server" id="CGField5" />其他</td>
                                        <td class="auto-style1">
                                            <div id="menuchild">
                                                <input type="text" name="qtCGField" runat="server" id="qtCGField" class="_hidden" />
                                            </div>
                                            <input type="hidden" value="" runat="server" id="CGField" />
                                        </td>
                                </tbody>
                            </table>

                        </td>
                    </tr>


                    <%--  <tr>
                        <td>成果成熟度:
                        </td>
                        <td colspan="3">
                            <input type="radio" name="maturesel" runat="server" value="可以量产" />可以量产
								<input type="radio" name="maturesel" runat="server" value="通过中试" />通过中试
								<input type="radio" name="maturesel" runat="server" value="通过小试" />通过小试
								<input type="radio" name="maturesel" runat="server" value="已有样品" />已有样品
								<input type="radio" name="maturesel" runat="server" value="正在研发" />正在研发
                                <input type="hidden" value="" runat="server" name="mature" id="mature" />
                        </td>
                    </tr>

                    <tr id="tr-topLevel">
                        <td>技术水平:
                        </td>
                        <td colspan="3">
                            <input type="radio" value="国际领先" runat="server" name="techlevelsel" />国际领先
								<input type="radio" value="国际先进" runat="server" name="techlevelsel" />国际先进
								<input type="radio" value="国内领先" runat="server" name="techlevelsel" />国内领先
								<input type="radio" value="国内先进" runat="server" name="techlevelsel" />国内先进
								<input type="radio" value="国内一般" runat="server" name="techlevelsel" />国内一般
                                <input type="hidden" value="" runat="server" name="techlevel" id="techlevel" />
                        </td>
                    </tr>--%>

                    <%--                    <tr>
                        <td>成果获奖情况:
                        </td>
                        <td colspan="3">
                            <textarea rows="6" cols="70" class=" form-control input-sm" name="awards" id="awards" runat="server"></textarea>
                        </td>
                    </tr>--%>





                    <tr>
                        <td>单位意见:
                        </td>
                        <td colspan="1">
                            <input type="text" class=" form-control input-sm pbls_sm_input" maxlength="150" id="unit_com" runat="server" />
                        </td>
                        <td>院主管部门意见:
                        </td>
                        <td colspan="1">
                            <input type="text" class=" form-control input-sm pbls_sm_input" maxlength="150" id="admin_com" runat="server" />
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
                                <input type="text" value="" style="display: none;" name="imgurl" id="imgurl" /><!--这里的input用于提交数据，给他们个name/id就好-->
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <input type="hidden" name="tachieves.id" value="" />
                            <asp:Button Text="提交" Style="background: rgb(100,100,100); color: #fff; width: 80px; height: 30px;" runat="server" ID="Button1" OnClick="sumitme_Click" OnClientClick="CGdata()" />

                        </td>
                    </tr>
                </tbody>
            </table>
            <br />
        </div>


        <asp:HiddenField ID="hideState" runat="server" />
        <asp:HiddenField ID="hideInid" runat="server" />
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

            //////获取知识产权类型
            $("input[type='radio'][name='CGType']").on("click", function () {
                var choice = $("input[type='radio'][name='CGType']:checked").val();
                var str;
                if (choice == "其他") {
                    $("#qtCGType").removeClass("_hidden");
                    $("#qtCGType").addClass("_show");
                    $("#qtCGType").on("keyup", function () {
                        str = $("#qtCGType").val();
                    });
                    $("#CGType").val(str);
                } else {
                    $("#qtCGType").removeClass("_show");
                    $("#qtCGType").addClass("_hidden");
                    $("#CGType").val(choice);
                    //alert($("#CGType").val());
                }
            });

            ////获取拟转化方式
            $("input[type='radio'][name='TransMode']").on("click", function () {
                var choice = $("input[type='radio'][name='TransMode']:checked").val();
                var str;
                if (choice == "其他方式") {
                    $("#qtTransMode").removeClass("_hidden");
                    $("#qtTransMode").addClass("_show");
                    $("#qtTransMode").on("keyup", function () {
                        str = $("#qtTransMode").val();
                    });
                    $("#TransMode").val(str);
                } else {
                    $("#qtTransMode").removeClass("_show");
                    $("#qtTransMode").addClass("_hidden");
                    $("#TransMode").val(choice);
                    //alert($("#TransMode").val());
                }
            });

            //////获取所属领域
            $("#CGField5").on("click", function () {
                if ($("#CGField5").is(":checked")) {//选中  
                    $("#qtCGField").removeClass("_hidden");
                    $("#qtCGField").addClass("_show");
                } else {
                    $("#qtCGField").removeClass("_show");
                    $("#qtCGField").addClass("_hidden");
                }

            });
            function CGdata() {
                var str = "";
                if ($("#CGField0").is(":checked")) {//选中  
                    str += $("#CGField0").val() + ",";
                }
                if ($("#CGField1").is(":checked")) {//选中  
                    str += $("#CGField1").val() + ",";
                }
                if ($("#CGField2").is(":checked")) {//选中  
                    str += $("#CGField2").val() + ",";
                }
                if ($("#CGField3").is(":checked")) {//选中  
                    str += $("#CGField3").val() + ",";
                }
                if ($("#CGField4").is(":checked")) {//选中  
                    str += $("#CGField4").val() + ",";
                }
                if ($("#CGField5").is(":checked")) {//选中  
                    str += $("#qtCGField").val() + ",";
                }
                $("#CGField").val(str);


            }





        </script>
    </form>

</body>
</html>

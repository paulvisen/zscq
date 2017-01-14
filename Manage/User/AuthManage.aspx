<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthManage.aspx.cs" Inherits="zscq.Manage.User.AuthManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/uploadify.css" />
    <style>
        .uploadify-button {
            border: none;
            margin: 10px 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="form-horizontal" style="margin:0 55px 0 15px">
        <label class="col-sm-2 control-label" style="font-size:18px;">基本信息</label>
        <div class="clearfix"></div>
        <div class="form-group">
            <label for="UserType" class="col-sm-2 control-label">用户类型</label>
            <div class="col-sm-10">
                <select id="UserType" class="form-control" onchange="selectChange()" runat="server">
                    <option>个人用户</option>
                    <option>科技企业</option>
                    <option>科研院所</option>
                    <option>专家用户</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="Name" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" id="Name" class="form-control" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label for="NickName" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-10">
                <input type="text" id="NickName" class="form-control" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label for="Email" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-10">
                <input type="text" id="Email" class="form-control" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label for="Phone" class="col-sm-2 control-label">联系方式</label>
            <div class="col-sm-10">
                <input type="text" id="Phone" class="form-control" runat="server" />
            </div>
        </div>
        <div class="personal-info">
            <div class="form-group">
                <label class="col-sm-2 control-label">上传身份证正面</label>
                <div class="col-sm-10">
                    <img id="frontIdentifyCardImg" style="width:300px;display:none;"/>
                    <input type="file" name="frontIdentifyCardUpload" id="frontIdentifyCardUpload" />
                    <input type="hidden" id="frontCardUrl" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">上传身份证反面</label>
                <div class="col-sm-10">
                    <img id="backIdentifyCardImg" style="width:300px;display:none;" />
                    <input type="file" name="backIdentifyCardUpload" id="backIdentifyCardUpload" />
                    <input type="hidden" id="backCardUrl" runat="server"/>
                </div>
            </div>
        </div>
        <div class="company-info" style="display:none">
            <label class="col-sm-2 control-label" style="font-size:18px;">企业信息</label>
            <div class="clearfix"></div>
            <div class="form-group">
                <label for="ComName" class="col-sm-2 control-label">企业名称</label>
                <div class="col-sm-10">
                    <input id="ComName" class="form-control" runat="server" placeholder="需与证件名称保持一致" />
                </div>
            </div>
            <div class="form-group">
                <label for="LegalRepresentative" class="col-sm-2 control-label">法人代表</label>
                <div class="col-sm-10">
                    <input id="LegalRepresentive" class="form-control" runat="server" placeholder="需与证件名称保持一致"/>
                </div>
            </div>
            <div class="form-group">
                <label for="BusinessLicenseNum" class="col-sm-2 control-label">统一社会信用代码</label>
                <div class="col-sm-10">
                    <input id="BusinessLicenseNum" class="form-control" runat="server" placeholder="需与图片号码保持一致" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">上传执照图片</label>
                <div class="col-sm-10">
                    <img id="licenseImg" style="width:300px;display:none;"/>
                    <input type="file" name="licenseUpload" id="licenseUpload"/>
                    <input type="hidden" id="licenseUrl" runat="server" />
                    <label style="color:red">(公司名称、有效期及证件号码必须清晰可辨)</label>
                </div>
            </div>
            <div class="form-group">
                <label for="ComArea" class="col-sm-2 control-label">经营领域</label>
                <div class="col-sm-10">
                    <input id="ComArea" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="ComAddress" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-10">
                    <input id="ComAddress" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="ComIntroduce" class="col-sm-2 control-label">公司简介</label>
                <div class="col-sm-10">
                    <textarea id="ComIntroduce" class="form-control" runat="server"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="RegMoney" class="col-sm-2 control-label">注册资金</label>
                <div class="col-sm-10">
                    <input id="RegMoney" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="WorkerAmount" class="col-sm-2 control-label">员工人数</label>
                <div class="col-sm-10">
                    <input id="WorkerAmount" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="MainCustomer" class="col-sm-2 control-label">主要客户</label>
                <div class="col-sm-10">
                    <input id="MainCustomer" class="form-control" runat="server" />
                </div>
            </div>
        </div>
        <div class="academy-info" style="display:none">
            <label class="col-sm-2 control-label" style="font-size:18px;">科研院所信息</label>
            <div class="clearfix"></div>
            <div class="form-group">
                <label for="AcaName" class="col-sm-2 control-label">科研院所名称</label>
                <div class="col-sm-10">
                    <input id="AcaName" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="AcaArea" class="col-sm-2 control-label">研究领域</label>
                <div class="col-sm-10">
                    <input id="AcaArea" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="AcaAddress" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-10">
                    <input id="AcaAddress" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="AcaIntroduce" class="col-sm-2 control-label">简介</label>
                <div class="col-sm-10">
                    <textarea id="AcaIntroduce" class="form-control" runat="server"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="SubjectType" class="col-sm-2 control-label">学科类型</label>
                <div class="col-sm-10">
                    <input id="SubjectType" class="form-control" runat="server" />
                </div>
            </div>
        </div>
        <div class="expert-info" style="display:none">
            <label class="col-sm-2 control-label" style="font-size:18px;">专家信息</label>
            <div class="clearfix"></div>
            <div class="form-group">
                <label for="Qualification" class="col-sm-2 control-label">学历</label>
                <div class="col-sm-10">
                    <input id="Qualification" class="form-control" runat="server"/>
                </div>
            </div>
            <div class="form-group">
                <label for="Graduation" class="col-sm-2 control-label">毕业于</label>
                <div class="col-sm-10">
                    <input id="Graduation" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="ExpertTitle" class="col-sm-2 control-label">职称</label>
                <div class="col-sm-10">
                    <input id="ExpertTitle" class="form-control" runat="server"/>
                </div>
            </div>
            <div class="form-group">
                <label for="ResearchArea" class="col-sm-2 control-label">研究领域</label>
                <div class="col-sm-10">
                    <input id="ResearchArea" class="form-control" runat="server"/>
                </div>
            </div>
            <div class="form-group">
                <label for="ExpertAddress" class="col-sm-2 control-label">地址</label>
                <div class="col-sm-10">
                    <input id="ExpertAddress" class="form-control" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="Awards" class="col-sm-2 control-label">获奖情况</label>
                <div class="col-sm-10">
                    <textarea id="Awards" class="form-control" runat="server"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">上传照片</label>
                <div class="col-sm-10">
                    <img id="expertPhotoImg" style="width:100px;display:none;"/>
                    <input type="file" name="expertPhotoUpload" id="expertPhotoUpload"/>
                    <input type="hidden" id="expertPhotoUrl" runat="server"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-2">
                <asp:Button CssClass="btn btn-primary" OnClick="SaveUserInfo" Text="保存" runat="server"></asp:Button>
            </div>    
        </div>
         
    </div>
    </form>
    <script src="/js/jQuery.js"></script>
    <script src="/js/jquery.uploadify-3.1.min.js"></script>
    <script>
        $(document).ready(function () {
            setParentHeight();
        });

        $("#licenseUpload").uploadify(uploadParam('license', function (file, data, response) {
            $("#licenseUrl").val(data);
            $("#licenseImg").attr("src", data);
            $("#licenseImg").show();
        }));

        $("#frontIdentifyCardUpload").uploadify(uploadParam('frontIdentifyCard', function (file, data, response) {
            $("#frontCardUrl").val(data);
            $("#frontIdentifyCardImg").attr("src", data);
            $("#frontIdentifyCardImg").show();
        }));

        $("#backIdentifyCardUpload").uploadify(uploadParam('backIdentifyCard', function (file, data, response) {
            $("#backCardUrl").val(data);
            $("#backIdentifyCardImg").attr("src", data);
            $("#backIdentifyCardImg").show();
        }));

        $("#expertPhotoUpload").uploadify(uploadParam('expertPhoto', function (file, data, response) {
            $("#expertPhotoUrl").val(data);
            $("#expertPhotoImg").attr("src", data);
            $("#expertPhotoImg").show();
        }))

        function uploadParam(type, callback) {
            return {
                //指定swf文件
                'swf': '../chengguo/uploadify.swf',
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
                'formData': { 'type': type },
                //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
                //'queueID': 'fileQueue',
                //选择文件后自动上传
                'auto': true,
                //设置为true将允许多文件上传
                'multi': false,
                'removeCompleted': true,
                //上传后执行
                'onUploadSuccess': callback
            }
        }

        function selectChange() {
            var val = $("#UserType").val();
            switch (val) {
                case '个人用户':
                    $(".personal-info").show();
                    $(".company-info").hide();
                    $(".academy-info").hide();
                    $(".expert-info").hide();
                    break;
                case '科技企业':
                    $(".personal-info").hide();
                    $(".company-info").show();
                    $(".academy-info").hide();
                    $(".expert-info").hide();
                    break;
                case '科研院所':
                    $(".personal-info").hide();
                    $(".company-info").hide();
                    $(".academy-info").show();
                    $(".expert-info").hide();
                    break;
                case '专家用户':
                    $(".personal-info").hide();
                    $(".company-info").hide();
                    $(".academy-info").hide();
                    $(".expert-info").show();
                    break;
            }
            setParentHeight();
        }

        function setParentHeight() {
            var doc = window.parent.document;
            $("#iframepage", doc).height($("html").height());
        }

    </script>
</body>
</html>

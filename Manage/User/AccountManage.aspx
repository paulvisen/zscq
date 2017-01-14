<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountManage.aspx.cs" Inherits="zscq.Manage.AccountManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/master.css" />
    <style>
        .form-group {
            margin-bottom: 25px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server" style="padding:5px;">
        <div class="div-default">
            <div class="form-horizontal" style="margin:15px 55px 25px 15px">
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
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2">
                        <asp:Button ID="BtnSave" runat="server" class="btn btn-primary" type="submit" Text="保存内容" OnClick="BtnSave_Click" />
                        <button class="btn btn-white" onclick="cancel()" type="reset">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
    function cancel() {
        parent.window.location.href = "/Manage/ManageGuide.aspx";
    }
    </script>
</body>

</html>
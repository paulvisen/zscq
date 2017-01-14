<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownloadPub.aspx.cs" Inherits="zscq.Manage.Download.DownloadFileManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css//ui-dialog.css" />
    <link rel="stylesheet" href="/css/manage.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="form-group">
                <label for="DownloadTitle" class="control-label">标&nbsp;题</label>
                <input type="text" id="DownloadTitle" class="form-control" runat="server" /> 
            </div>
            <div class="form-group">
                <label for="DownloadType" class="control-label">类&nbsp;型</label>
                <select id="DownloadType" class="form-control" runat="server">
                    <option>政策文件</option>
                    <option>合同模板</option>
                    <option>规则流程</option>
                </select>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered" style="text-align:center">
                    <thead>
                        <tr>
                            <th>标题</th>
                            <th>描述</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="grid" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("FileName") %></td>
                                    <td><%#Eval("FileDescription") %></td>
                                    <td>
                                        <button class="btn btn-danger" onclick="deleteFile(<%#Eval("FileID") %>)">删除</button>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td colspan="3">
                                <button type="button" class="btn btn-success" onclick="showFileDialog()">添加文件</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <asp:Button runat="server" ID="PubDownloadButton" Text="确定" class="btn btn-primary" 
            OnClientClick="checkbefore()" OnClick="PubDownloadButton_Click" />
            <asp:Button runat="server" ID="CancelButton" Text="取消" class="btn btn-default" OnClick="CancelButton_Click" />
        </div>
        <div id="fileAdd">
            <input id="fileToUpload" name="fileToUpdate" type="file" style="margin-bottom:10px" />
            <div class="form-group">
                <label for="FileDescription" class="control-label">文件描述</label>
                <textarea id="FileDescription" class="form-control"></textarea>
            </div>
            <button class="btn btn-primary" onclick="addFile();">提交</button>
            <button class="btn btn-default" onclick="cancelFileDialog()">取消</button>
        </div>
        <input type="hidden" id="downloadID" runat="server" />
    </form>
    <script src="/js/jQuery.js"></script>
    <script src="/js/dialog-min.js"></script>
    <script src="/js/ajaxfileupload.js"></script>
    <script>
        function deleteFile(id) {
            if (confirm("确认删除？")) {
                $.get("DelFile.ashx", { id: id })
                .done(function (data) {
                    if (data == "True") {
                        alert("删除成功");
                        //location.reload();
                        $("#form1").submit();
                    } else {
                        alert("删除失败");
                    }
                })
            }
        }

        var d = dialog({
            title: '添加文件',
            content: document.getElementById("fileAdd"),
            cancel: false,
        });
        function showFileDialog() {            
            d.show();
        }

        function cancelFileDialog() {
            d.close();
        }

        function addFile() {
            if ($("#fileToUpload").val() == "") {
                alert("请选择文件");
                return;
            }
            if ($("#FileDescription").val() == "") {
                alert("请输入文件描述");
                return;
            }
            $.ajaxFileUpload({
                url: 'UploadFile.ashx',
                fileElementId: 'fileToUpload',
                data: {
                    fileDescription: $('#FileDescription').val(),
                    downloadID: $('#downloadID').val()
                },
                dataType: 'text',
                success: function (msg, state) {
                    var begin = msg.indexOf("#");
                    var end = msg.lastIndexOf("#");
                    msg = msg.substring(begin + 1, end);
                    if (msg == "0") {
                        alert("添加失败");
                    } else {
                        alert("添加成功");                       
                    }
                    d.close();
                    //window.location.reload();
                    $("#form1").submit();
                    $('#FileDescription')[0].value = "";
                },
                error: function (data, status, e) {
                    console.log(e);
                    alert("添加失败");
                    d.close();
                    $('#FileDescription')[0].value = "";
                }
            });
        }

        function checkbefore() {
            if ($("#DownloadTitle").val() == "") {
                alert("请输入标题");
                return false;
            }
        }
    </script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsManage.aspx.cs" Inherits="zscq.Manage.NewsManage" %>
<%@ Import Namespace="zscq.BasicCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/bootstrap-datepicker.min.css"/>
    <link rel="stylesheet" href="/css/manage.css" />
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <div style="margin-bottom: 10px;margin-left:-15px">
                <div class="col-sm-5">
                    <select id="SearchNewsType" class="form-control" runat="server">
                        <option>全部</option>
                        <option>网站动态</option>
                        <option>最新政策</option>
                        <option>科技新闻</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <input id="SearchTitle" class="form-control" placeholder="请输入标题" runat="server" />
                </div>
                <div class="col-sm-2">
                    <input id="SearchPubDate" class="form-control" placeholder="请选择时间" runat="server" />
                </div>
                <asp:Button ID="btnSearch" runat="server" Text="搜索" type="button" class="btn btn-primary" OnClick="btnSearch_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-success" onclick="parent.location.href='/Manage/ManageMain.aspx#News/NewsPub.aspx';return false;"> 添加</button>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered" style="text-align:center">
                    <thead>
                        <tr>
                            <th>新闻标题</th>
                            <th>新闻类型</th>
                            <th>发布日期</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="grid" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="max-width:300px;">
                                        <%#Eval("Title") %>
                                    </td>
                                    <td>
                                        <%#Tools.EnumToString((enumNewsType)Eval("SubType")) %>
                                    </td>
                                    <td>
                                        <%#Eval("PubDate") %>
                                    </td>
                                    <td>
                                        <button class="btn btn-info" onclick="editNews(<%#Eval(" NewsID ") %>);return false;">修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button class="btn btn-danger" onclick="deleteNews(<%#Eval(" NewsID ") %>);return false;">删除</button>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <td colspan="4">
                                <span style="float:left">
                                <span>共</span>
                                <asp:Label ID="lbRowCount" runat="server"></asp:Label>
                                <span>条&nbsp;第</span>
                                <asp:TextBox ID="PageIndex" runat="server" Width="30px"></asp:TextBox>
                                <span>/<asp:Label ID="lbPageCount" runat="server"></asp:Label>页</span>
                                <asp:Button ID="btnPageChange" runat="server" CssClass="btn" Text="跳转" style="height:26px;padding: 0 10px" OnClick="btnPageChange_Click"
                                />
                                </span>
                                <span style="float:right">
                                    <asp:Button ID="btnFirstPage" runat="server" CssClass="btn" Text="首页" style="height:26px;padding: 0 10px" OnClick="btnFirstPage_Click" />
                                    <asp:Button ID="btnPreviousPage" runat="server" CssClass="btn" Text="上一页" style="height:26px;padding: 0 10px" OnClick="btnPreviousPage_Click" />
                                    <asp:Button ID="btnNextPage" runat="server" CssClass="btn" Text="下一页" style="height:26px;padding: 0 10px" OnClick="btnNextPage_Click" />
                                    <asp:Button ID="btnLastPage" runat="server" CssClass="btn" Text="尾页" style="height:26px;padding: 0 10px" OnClick="btnLastPage_Click" />
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
    <script src="/js/jQuery.js"></script>
    <script src="/js/bootstrap-datepicker.js"></script>
    <script src="/js/locales/bootstrap-datepicker.zh-CN.js"></script>
    <script>
    function editNews(id){
        parent.location.href = "/Manage/ManageMain.aspx#News/NewsPub.aspx?id=" + id;
    }

    function deleteNews(id) {
        if (confirm("确认删除？")) {
            $.get("DelNews.ashx", { id: id })
            .done(function (data) {
                if (data == "True") {
                    alert("删除成功");
                    location.reload();
                } else {
                    alert("删除失败");
                }
            })
        }
    }

    $("#SearchPubDate").datepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true,
        format: 'yyyy-mm-dd'
    })
    </script>
</body>

</html>
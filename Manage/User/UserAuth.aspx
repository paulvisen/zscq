<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAuth.aspx.cs" Inherits="zscq.Manage.User.UserAuth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/manage.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="table-responsive">
            <table class="table table-bordered" style="text-align:center">
                <thead>
                    <tr>
                        <th>用户名</th>
                        <th>名称</th>
                        <th>邮箱</th>
                        <th>联系方式</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="grid" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("UserName") %></td>
                                <td><%#Eval("NickName") %></td>
                                <td><%#Eval("Email") %></td>
                                <td><%#Eval("Phone") %></td>
                                <td>
                                    <button class="btn btn-info" <%--onclick="deleteUser(<%#Eval(" UserID ") %>);return false;"--%>>通过审核</button>
                                    <button class="btn btn-danger">驳回</button>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td colspan="5">
                            <span style="float:left">
                            <span>共</span>
                            <asp:Label ID="lbRowCount" runat="server"></asp:Label>
                            <span>条&nbsp;第</span>
                            <asp:TextBox ID="PageIndex" runat="server" Width="30px"></asp:TextBox>
                            <span>/<asp:Label ID="lbPageCount" runat="server"></asp:Label>页</span>
                            <asp:Button ID="btnPageChange" runat="server" CssClass="btn" Text="跳转" style="height:26px;padding: 0 10px" OnClick="btnPageChange_Click" />
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
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selldoneManager.aspx.cs" Inherits="zscq.Manage.chengguo.selldoneManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>交易完成的成果——卖方</title>
     <script src="js/jquery-2.1.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function EditIn(sender) {
            //window.location.href = "CGjydone.aspx?cgid=" + sender;
        }

        function ValidateValue(textbox) {
            var IllegalString = "\`~@#;,.!#$%^&*()+{}|\\:\"<>?-=/,\'";
            var textboxvalue = textbox.value;
            var index = textboxvalue.length - 1;

            var s = textbox.value.charAt(index);

            if (IllegalString.indexOf(s) >= 0) {
                s = textboxvalue.substring(0, index);
                textbox.value = s;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="ibox-content">

                <div class="row">

                    <div class="col-sm-3">
                        <input type="text" placeholder="请输入产业名称" onkeyup="ValidateValue(this)" class="input-sm form-control" id="SeaUName" runat="server" />
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">

                            <span class="input-group-btn">
                                <asp:Button ID="btnSearch" runat="server" Text="搜索" type="button" class="btn btn-sm btn-primary" OnClick="btnSearch_Click" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr style="text-align: center;">
                                <th style="text-align: center;">编号</th>
                                <th style="text-align: center;">成果名称</th>
                                <th style="text-align: center;">购买用户</th>
                                <th style="text-align: center;">购买时间</th>
                                <th style="text-align: center;">交易价格</th>
                                <%--<th style="text-align: center;">评价状态</th>--%>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="grid" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td style="text-align: center;"><%# Container.ItemIndex + 1%></td>
                                        <td style="text-align: center;"><%# Eval("CGName")%></td>
                                        <%--读取id之后join成果数据库--%>
                                        <td style="text-align: center;"><%# Eval("UserName")%></td>
                                        <%--读取id之后join用户数据库--%>
                                        <td style="text-align: center;"><%# Convert.ToDateTime(Eval("RR_FinishDate")).ToShortDateString()%></td>
                                        <td style="text-align: center;"><%# Eval("RR_Price")%></td>
                                        <%--<td style="text-align: center;"><%# Eval("Commstate")%></td>--%>
                                       
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr>
                                <td colspan="8" class="auto-style1">
                                    <span style="float: left;">
                                        <%--<img src="img/datarow.gif" />--%>
                                        <span>数据：</span>
                                        <asp:Label ID="lblRowCount" runat="server" Text=""></asp:Label>
                                        <span>条，&nbsp;第</span>
                                        <asp:TextBox ID="pageIndex" runat="server" Style="width: 30px;"></asp:TextBox>
                                        <span>/<asp:Label ID="lblpagecount" runat="server" Text=""></asp:Label>页</span>
                                        <asp:Button ID="btnPageClick" runat="server" class="btn btn-white" OnClick="btnPageClick_Click" Text="转" Style="width: 30px; height: 20px; padding: 0px;" />
                                    </span>
                                    <span style="float: right;">
                                        <asp:Button ID="btnFrpage" runat="server" class="btn btn-white" Text="首页" OnClick="btnFrpage_Click" Style="width: 50px; height: 20px; padding: 0px;" />
                                        <asp:Button ID="btnSpage" runat="server" class="btn btn-white" Text="上一页" OnClick="btnSpage_Click" Style="width: 50px; height: 20px; margin-left: 5px; padding: 0px;" />
                                        <asp:Button ID="btnXpage" runat="server" class="btn btn-white" Text="下一页" OnClick="btnXpage_Click" Style="width: 50px; height: 20px; margin-left: 5px; padding: 0px;" />
                                        <asp:Button ID="btnLapage" runat="server" class="btn btn-white" Text="尾页" OnClick="btnLapage_Click" Style="width: 50px; height: 20px; margin-left: 5px; padding: 0px;" />
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </form>
</body>
</html>

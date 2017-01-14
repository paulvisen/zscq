<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CGManager.aspx.cs" Inherits="zscq.Manage.chengguo.CGManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="renderer" content="webkit" />
    <title>我发布的成果</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
   <%-- <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="js/WdatePicker.js"></script>--%>
      <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   <%-- <script src="js/jquery.metisMenu.js"></script>
    <script src="js/jquery.slimscroll.min.js"></script>
    <script src="js/jquery.peity.min.js"></script>
    <script src="js/hplus.js"></script>
    <script src="js/pace.min.js"></script>
    <script src="js/icheck.min.js"></script>
    <script src="js/peity-demo.js"></script>--%>
    <script type="text/javascript">
        function EditIn(sender) {
            window.location.href = "CGPub.aspx?cgid=" + sender;
        }
        function DelIn(sender) {
            if (confirm("确认删除此条成果信息？删除后不可恢复。")) {
                $.post("DelCG.aspx", { cgid: sender }, function (d) {
                    if (d != "1") {
                        alert("删除记录失败！");
                    }
                    else {
                        alert("删除记录成功！");
                        window.location.href = "CGManager.aspx";
                    }

                }

                    );
            }

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
    <style type="text/css">
        .auto-style1 {
            height: 42px;
        }
    </style>
</head>
<body style="background-color:#fff;height:850px; min-height:850px;" >
   <form runat="server" id="form1" method="post" style="height:850px;">
        
                                <div class="ibox-content" >

                                    <div class="row">

                                        <div class="col-sm-3">
                                            <input type="text" placeholder="请输入产业名称" onkeyup="ValidateValue(this)" class="input-sm form-control" id="SeaUName" runat="server" />
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="input-group">

                                                <span class="input-group-btn">
                                                    <asp:Button ID="btnSearch" runat="server" Text="搜索" type="button" class="btn btn-sm btn-primary" OnClick="btnSearch_Click" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>
                                                <button type="button" class="btn btn-sm btn-success" onclick="window.location.href='CGPub.aspx'">添加</button>
                                            </span>
                                            </div>
                                        </div> 
                                        <div class="col-sm-1">
                                            <asp:DropDownList runat="server" ID="selectYear">
                                                <%--autopostback="true" OnSelectedIndexChanged="selectYear_SelectedIndexChanged"--%>
                                                <asp:ListItem Value="1">发布成功</asp:ListItem>
                                                <asp:ListItem Value="255">已删除</asp:ListItem>
                                                <asp:ListItem Value="2">已驳回</asp:ListItem>
                                                <asp:ListItem Value="0">未审核</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <asp:Button ID="BtnSelect" runat="server" Text="根据成果状态筛选" type="button" class="btn btn-sm btn-primary" OnClick="selectYear_SelectedIndexChanged" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                            
                                            </div>

                                        </div>
                                        

                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center;">编号</th>
                                                    <th style="text-align: center;">成果名称</th>
                                                    <th style="text-align: center;">添加时间</th>
                                                    <th style="text-align: center;">操作</th>
                                                  
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="grid" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: center;"><%# Container.ItemIndex + 1%></td>
                                                            <td style="text-align: center;"><%# Eval("CGName")%></td>
                                                            <td style="text-align: center;"><%# Convert.ToDateTime(Eval("RegTime")).ToShortDateString()%></td>
                                                            <td style="text-align: center;" class="center">
                                                                <button type="button" class="btn btn-info" onclick="EditIn(<%# Eval("id") %>)">修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                          <button type="button" class="btn btn-danger" onclick="DelIn(<%# Eval("id") %>)">删除</button>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <tr>
                                                    <td colspan="5" class="auto-style1">
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
                         
    </form>
  
</body>
</html>

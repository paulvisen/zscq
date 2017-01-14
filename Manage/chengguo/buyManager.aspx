<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buyManager.aspx.cs" Inherits="zscq.Manage.chengguo.buyManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="renderer" content="webkit" />
    <title>我购买的成果</title>
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
            window.location.href = "chengguoJudge.aspx?cgid=" + sender;
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
<body style="background-color:#fff;">
     <form runat="server" id="form1" method="post">
        <%--<div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="wrapper wrapper-content">
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">--%>
                                <%--<div class="ibox-title">
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>--%>
                                <div class="ibox-content">

                                    <div class="row">

                                       <%-- <div class="col-sm-2">
                                            <input type="text" placeholder="请输入产业名称" onkeyup="ValidateValue(this)" class="input-sm form-control" id="SeaUName" runat="server" />
                                        </div>--%>
                                        <div class="col-sm-5">
                                            <div class="input-group">

                                                <span class="input-group-btn">
                                                    <%--<asp:Button ID="btnSearch" runat="server" Text="搜索" type="button" class="btn btn-sm btn-primary" OnClick="btnSearch_Click" /></span>&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                           <%-- <span>
                                                <button type="button" class="btn btn-sm btn-success" onclick="window.location.href='CGPub.aspx'">添加</button>
                                            </span>--%>
                                            </div>
                                        </div> 
                                       <%-- <div class="col-sm-1">
                                            <asp:DropDownList runat="server" ID="selectYear">
                                                
                                                <asp:ListItem Value="1">购买成功</asp:ListItem>
                                                <asp:ListItem Value="25">已填写报价</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <asp:Button ID="BtnSelect" runat="server" Text="根据购买状态筛选" type="button" class="btn btn-sm btn-primary" onclick="BtnSelect_Click" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                            
                                            </div>

                                        </div>--%>
                                        

                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center;">编号</th>
                                                    <th style="text-align: center;">成果名称</th>
                                                    <th style="text-align: center;">购买时间</th>
                                                    <th style="text-align: center;">操作</th>
                                                  
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="grid" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td style="text-align: center;"><%# Container.ItemIndex + 1%></td>
                                                            <td style="text-align: center;"><%# Eval("CGName")%></td>
                                                            <td style="text-align: center;"><%# Convert.ToDateTime(Eval("RR_FinishDate")).ToShortDateString()%></td>
                                                            <td style="text-align: center;" class="center">
                                                                <button type="button" class="btn btn-info" onclick="EditIn(<%# Eval("id") %>)">评价</button>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <tr>
                                                    <td colspan="5">
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
                          <%--  </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>--%>
    </form>
   
</body>
</html>

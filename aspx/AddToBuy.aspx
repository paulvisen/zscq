<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToBuy.aspx.cs" Inherits="cgjy.aspx.AddToBuy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../js/jQuery.js"></script>
    <link href="../css/InNodes.css" rel="stylesheet" />
     <script src="../js/artDialog/artDialog.js?skin=twitter"></script>
     <script src="../js/artDialog/plugins/iframeTools.js"></script>
    <script src="../js/AddToBuy.js"></script>
     <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
         .addbuydiv {
         font:15px microsoft yahei;
         }
    </style>
    <script>
        function cl() {
            var ii = $("#userprice").val()
            if (ii == undefined || ii == "") {
                alert("请填写出价!");
            } else {
                alert("填写购买信息成功");
                //var win = art.dialog.open.origin;//来源页面
                //// 如果父页面重载或者关闭其子对话框全部会关闭
                //win.location.reload();
                //art.dialog.close();
                
                
            }
           
            
        }

        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <div class="addbuydiv" id="fade" runat="server" >
        <fieldset>
            <div runat="server" id="warn"  ></div>
            <table>
                <tr>
                    <td class="auto-style1"><label for="userprice">出&nbsp;&nbsp;价</label> </td>
                    <td class="auto-style1"><input type="text" id="userprice" name="userprice" runat="server" />万元</td>
                </tr>
                <tr>
                    <td><label for="userprice">联系方式</label> </td>
                    <td><input type="text" id="usercomm" name="usercomm" runat="server" /></td>
                </tr>
                <tr>
                    <td class="auto-style1"><label for="mess">留&nbsp;&nbsp;言</label> </td>
                    <td class="auto-style1"><textarea id="mess" cols="40" rows="5" name="mess" runat="server"></textarea></td>
                </tr>
                <%--<tr>
                    <td> <label for="username">密&nbsp;&nbsp;码</label> </td>
                    <td>  <input type="password" id="userpwd" runat="server" /></td>
                </tr>--%>
                <tr>
                    <td></td>
                    <td> <asp:Button ID="buttonsHandleIn" OnClientClick="cl()" Text="确&nbsp;定" runat="server" onclick="buttonsHandleIn_Click" />   </td>
                </tr>
            </table>        
           
        </fieldset>
    </div>
    
    </div>
    </form>
</body>
</html>

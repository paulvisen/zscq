<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteToBuy.aspx.cs" Inherits="zscq.aspx.DeleteToBuy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../js/jQuery.js"></script>
    <link href="../css/InNodes.css" rel="stylesheet" />
     <script src="../js/artDialog/artDialog.js?skin=twitter"></script>
     <script src="../js/artDialog/plugins/iframeTools.js"></script>
     <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
         .delbuydiv {
         font:15px microsoft yahei;
         position:relative;
         top:40px;
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="delbuydiv" id="fade" runat="server" >
        
            <div runat="server" id="warn"  ></div>
            <table>
                <tr>
                    <td class="auto-style1"><label for="mess">留&nbsp;&nbsp;言</label> </td>
                    <td class="auto-style1"><textarea id="mess" cols="40" rows="5" name="mess" runat="server"></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td> <asp:Button ID="buttonsHandleIn"  Text="确&nbsp;定" runat="server" onclick="buttonsHandleIn_Click" />   </td>
                </tr>
            </table>        
           
       
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamRelateList.aspx.cs" Inherits="jyypt.TeamPres.TeamRelateList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/team.css" />
    <style>
        #AspNetPager1 {
            width:auto;
        }
        #AspNetPager1 div{
            width:auto !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
           <div class = "teamrelatelist" id="teamRelateList" runat="server">
                <asp:Repeater ID="RpTeamRelateList" runat="server" OnItemDataBound="RpTeamRelateList_ItemDataBound"> 
                    <ItemTemplate>
                      <div class = "oneTeamRelate">
                            <table>
                                <tr>
                                    <td rowspan="3" style="width:14%;vertical-align:top;"> <img style="width:120px;height:120px;" src ="<%#Eval("colPict")%>" /></td>
                                    <td style="width:40%;font-size:16px;font-weight:bold"><a style="color:#000000" target="_parent" href="<%=strHref%><%#Eval("colId").ToString()%>">
                                        <%#Eval("colName")%></a></td>
                                    <td style="width:15%"><%#Eval("colCont1")%></td>
                                    <%--<td style="width:15%"><%#Eval("colCont2")%></td>--%>                                 
                                </tr>
                                <tr>
                                    <td rowspan="2" colspan="3">&nbsp;&nbsp<%#Eval("colIntr")%></td>
                                </tr>
                            </table>
                        </div>                                                                    
                    </ItemTemplate> 
                </asp:Repeater>
           </div>
        <webdiyer:AspNetPager class="pagerecord" id="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged1" 
            FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
            CustomInfoHTML = "共%PageCount%页" ShowCustomInfoSection="right" CustomInfoStyle="font-size:14px;text-align:left;padding:3px"
            TextBeforePageIndexBox="转到" TextAfterPageIndexBox="页" Font-Size="14px"  pageindexboxtype="TextBox"
            SubmitButtonText="跳转" SubmitButtonClass="btn btn-default" 
            ShowPageIndexBox="Always" AlwaysShow="true" UrlPaging="true" ReverseUrlPageIndex="true"
            CurrentPageButtonStyle="background-color:#6194FF;color:white;">
        </webdiyer:AspNetPager>
    </form>
</body>
</html>

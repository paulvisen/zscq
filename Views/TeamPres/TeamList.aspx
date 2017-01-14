<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamList.aspx.cs" Inherits="jyypt.TeamPres.TeamList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/team.css" rel="stylesheet" />
    <style>
        #AspNetPager1 {
            width:auto;
        }
        #AspNetPager1 div{
            width:auto !important;
        }
        body{
            margin:0;
            font-family: "Microsoft YaHei";
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
           <div class = "divteamlist" id ="teamlist" runat="server">
                <asp:Repeater ID="RpTeamlist" runat="server" OnItemDataBound="RpTeamlist_ItemDataBound"> 
                    <ItemTemplate>
                    <div class="teaminfo">
                        <asp:HiddenField ID="hfid" runat="server" Value='<%#Eval("Id")%>' />
                        <table>
                            <tr>
                                <td rowspan="3" style="padding-right:20px; width:16%"> <img src="/images/jaas.png" /></td>
                                <td style="width:15%"><b>团队名称：</b></td>
                                <td style="width:40%;font-size:16px;font-weight:bold"><a style="color:#000000" target="_parent" href="TeamInfo.aspx?tid=<%#Eval("Id").ToString()%>&type=<%#Eval("Type").ToString() %>"><%#Eval("Name")%></a></td>
                                <td style="width:15%"><b>团队类型：</b></td>
                                <td style="width:14%"><%#Eval("Type")%></td> 
                            </tr>
                            <tr>
                                <td>团队地址：</td>
                                <td style="width:40%"><%#Eval("Address") %></td>
                                <td><b>发布成果：</b></td>
                                <td><span style="font-size:18px;color:#200567;font-weight:bolder">200</span>&nbsp;<b>条</b></td>
                            </tr>
                            <tr>
                                <td style="width:15%">研究领域：</td>                                                                                                                                                                                                                                                                    
                                <td style="width:40%"><%#Eval("Area") %></td>
                                <td><b>好评率：</b></td>
                                <td style="font-size:18px;color:#ff6a00;font-weight:bolder">100%</td> 
                            </tr>
                            <tr>
                                <td id="teamcotent" rowspan="2" colspan="5" style="padding-top:10px">&nbsp;&nbsp<%#Eval("Introduce")%></td>
                            </tr>
                        </table> 
                        <ul>
                        <asp:Repeater ID="RpGainlist" runat="server" >
                            <ItemTemplate>
                                <li><%#Eval("CGName") %></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        </ul>
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
<!--
    FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                <h1>第<span id="page_curr"></span>页/共<span id="page_total"></span>页&nbsp;&nbsp;转到<input id="changePage" type="text" />页</h1>
                <button type="submit";>确定</button> 
            </div> 
-->
    </form>
</body>
</html>

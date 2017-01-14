<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsPub.aspx.cs" Inherits="zscq.Manage.NewsPub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" style="padding:10px;height:1100px">
        <div>
            <div class="form-group">
                <label for="NewsTitle" class="col-sm-2 control-label">标&nbsp;题</label>
                <input type="text" id="NewsTitle" class="form-control" runat="server"/>
            </div>
            <div class="form-group">
                <label for="NewsType" class="col-sm-2 control-label">新闻类型</label>
                <select id="NewsType" class="form-control" runat="server">
                    <option>网站动态</option>
                    <option>最新政策</option>
                    <option>科技新闻</option>
                </select>
            </div>
        </div>
        <br />
        <script id="editor" type="text/plain" style="width:100%;height:500px"></script>
        <br />
        <div id="onTop">
            <div class="checkbox">
                <label>
                    <input runat="server" type="checkbox" id="ApplyForTop" onclick="onTop.selimg()"/>
                    是否申请放在首页图片显示
                </label>           
            </div>
            <br />
            <div v-if="applyForTop" v-for="item in pic_match" style="float:left;margin-right:20px">
                <img style="width:100px;height:100px" :src="item"/><br />
                <input type="radio" :checked="item == selected" @click="selected = item" />
                作为首页图片
            </div>
            <div class="clearfix"></div>
        </div>
        <br />
        <asp:Button runat="server" ID="PubNewsButton" Text="确定" class="btn btn-primary" 
            OnClientClick="checkbefore()" OnClick="PubNewsButton_Click" />
        <button type="button" class="btn btn-default" onclick="parent.location.href='/Manage/ManageMain.aspx#News/NewsManage.aspx'">取消</button>
        <input type="hidden" id="hideurl" name="hideurl" runat="server" />
        <input type="hidden" id="hideria" name="hideria" runat="server" />
        <input type="hidden" id="hidetext" name="hidetext" runat="server" />
    </form>

    <script src="/ueditor/ueditor.config.js"></script>
    <script src="/ueditor/ueditor.all.min.js"></script>
    <script src="/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="/js/jQuery.js"></script>
    <script src="/js/vue.min.js"></script>
    <script>
        var ue = UE.getEditor('editor', {
            scaleEnabled: true,
            wordCount: false,
            elementPathEnabled: false,
        });
    </script>
    <script src="NewsPub.js"></script>

</body>
</html>

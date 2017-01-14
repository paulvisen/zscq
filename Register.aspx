<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="zscq.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/css/head_bottom.css" />
    <style type="text/css">
    *, *:after, *:before {
        box-sizing: border-box;
    }

    body{
        font-family: Microsoft YaHei;
    }

    a{
        text-decoration: none;
    }

    .head{
        height: 40px;
        background:none;
    }

    .content {
        width: 100%;
        height: 700px;
        background: url('/images/login_bg.jpg') no-repeat center 0;
        padding-top: 100px;
    }

    .content > div{
        width: 700px;
        height: 400px;
        margin: 0 auto;
        background-color: white;
        box-shadow: 0 0 20px gray;
        padding: 50px;
    }

    #fm1 .row{
        margin-bottom: 30px;
    }

    #fm1 .row label{
        display: inline-block;
        color: #777777;
        font-size: 14px;
        font-weight: bold;
        margin-right: 20px;
    }

    #fm1 .row input{
        padding: 6px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        border: 1px solid #DDDDDD;
        background: #FFFFDD;
        margin-right: 10px;
    }

    #fm1 .btn-submit{
        width: 200px;
        height: 38px;
        border: 0;
        background-color: #448BCB;
        color: white;
        font-weight: 500;
        font-size: 15px;
        font-family: Microsoft YaHei;
        margin: 0 auto;
        display: block;
    }

    #login_title{
        font-size: 20px; 
        font-weight: bold; 
        color: gray;
        line-height: 34px; 
        background: url(../images/login_logo.png) no-repeat; 
        padding-left: 40px;
        padding-right: 20px; 
        margin-bottom: 30px;
        display: inline-block;
        cursor: pointer;
        -webkit-filter: grayscale(100%);
        filter: grayscale(100%);
    }

    #signup_title{
        font-size: 20px;
        font-weight: bold;
        color: orange;
        line-height: 34px;
        background: url(../images/signup_logo.png) no-repeat;
        padding-left: 40px;
        margin-bottom: 30px;
        display: inline-block;
        cursor: pointer;
    }

    .divider{
        margin: 0 30px;
        display: inline-block;
        border: solid gray;
        border-width: 13px 1px;
        vertical-align: sub;
    }
    </style>
    <title></title>
</head>
<body>
    <div class="head">
        <nav class="animenu">
            <ul class="animenu__nav">
                <li>
                    <a href="/Home.aspx">首页</a>
                </li>
                <li>
                    <a href="/Views/News/News.aspx">资讯&动态</a>
                </li>
                <li>
                    <a href="/Views/TeamPres/TeamPres.aspx">团队展示</a>
                </li>
                <li>
                    <a href="/aspx/JYDT.aspx">交易大厅</a>
                    <ul class="animenu__nav__child">
                        <li><a href="/aspx/JYDT_list.aspx">供求对接</a></li>
                        <li><a href="#">在线交易</a></li>
                        <li><a href="#">在线竞拍</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/aspx/XXJY.aspx">线下活动</a>
                </li>
                <li>
                    <a href="#">科技服务</a>
                </li>
                <li>
                    <a href="/Views/Downloads/Downloads.aspx">资料下载</a>
                </li>
                <li>
                    <a href="#">农产品商城</a>
                </li>
                <li>
                    <a href="#">订单农业</a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="content">
        <div>
            <form runat="server" id="fm1">
                <div>
                    <a id="login_title" href="http://120.77.212.103:8080/cas/login?service=http://localhost:51119/SSO.aspx">用户登录</a>
                    <p class="divider"></p>
                    <a id="signup_title">注册账号</a>
                </div>
                <section class="row">
                    <label for="username" style="font-size:16px;">用户名:　</label>
                    <input id="username" size="25" tabindex="1" />
                    <label>4-12位字母（区分大小写）、数字组成</label>
                </section>
                <section class="row">
                    <label for="password" style="font-size:16px">密码:　　</label>
                    <input id="password" type="password" size="25" tabindex="2" />
                    <label>6-16位字母（区分大小写）、数字组成</label>
                </section>
                <section class="row">
                    <label for="recheck" style="font-size:16px">确认密码:</label>
                    <input id="recheck" type="password" size="25" tabindex="3" />
                    <label>请再次输入密码</label>
                </section>
                <button type="button" class="btn-submit" onclick="checkbefore()">注册</button>
            </form>
        </div>
        
    </div>
    <div style="background-color:#1F2730;">
        <div class="bottom">
            <div class="con1">
                <a href="#">新手指南</a><br />
                <a href="#">注册新用户</a>&nbsp;&nbsp;&nbsp;<a href="#">交易入门</a><br />
                <a href="#">交易规则</a>&nbsp;&nbsp;&nbsp;<a href="#">拍卖规则</a>
            </div>
            <div class="con2">
                <a href="#">新手指南</a><br />
                <a href="#">注册新用户</a>&nbsp;&nbsp;&nbsp;<a href="#">交易入门</a><br />
                <a href="#">交易规则</a>&nbsp;&nbsp;&nbsp;<a href="#">拍卖规则</a>
            </div>
		    <div class="contact">
			    <span>400-150-9966<br />0515-86208888<br /></span>
			    <span>周一至周日9:00 - 23:00</span><br />
			    <button>联系客服</button>
		    </div>
        </div>          
    </div>

    <script src="/js/jQuery.js"></script>
    <script src="/js/md5.js"></script>
    <script>
        function checkbefore() {
            var reg = /^[A-Za-z0-9]{4,12}$/g;
            var username = $("#username").val();
            if (username == "") {
                alert("用户名不能为空");
                return;
            }
            if (!reg.exec(username)) {
                alert("用户名格式错误");
                return;
            }

            reg = /^[A-Za-z0-9]{6,16}$/g;
            var password = $("#password").val();
            if (password == "") {
                alert("密码不能为空");
                return;
            }
            if (!reg.exec(password)) {
                alert("密码格式错误");
                return;
            }

            var recheck = $("#recheck").val();
            if (recheck == "") {
                alert("确认密码不能为空");
                return;
            }
            if (password != recheck) {
                alert("两次输入密码不一致");
                return;
            }

            $.get("UserCheck.ashx", {
                username: username,
                password: hex_md5(password)
            }).done(function (data) {
                if (data == "True") {
                    alert("用户已存在");
                    return;
                } else {
                    $.get("Register.ashx", {
                        username: username,
                        password: hex_md5(password)
                    }).done(function (data) {
                        if (data == "True") {
                            alert("注册成功")
                        } else {
                            alert("注册失败");
                        }
                    })
                }
            })
        }
    </script>
</body>
</html>

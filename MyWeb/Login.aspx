<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyWeb.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登陆</title>
    <link href="CSS/LoginandRegister.css" rel="stylesheet" />
    <script src="JS/jquery-1.7.1.min.js"></script>
    <script src="JS/Login.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="SVcode" name="SVcode" runat="server" />
        <div class="mn-content">
            <div class="mn-inner">
                <div class="pg-form">
                    <div  style="margin-left:70px;">
                        <h3>用户登录</h3>
                    </div>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="td-left" valign="top">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="td-title" valign="top">账 号：</td>
                                        <td>
                                            <input type="text" class="m-text" id="Account" name="Account" placeholder="请输入账号" runat="server" value="" maxlength="50" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title" valign="top">密 码：</td>
                                        <td>
                                            <input type="password" class="m-text" id="Password" name="Password" placeholder="请输入密码" maxlength="50" runat="server" data-tip="请输入登录密码" />
                                        </td>
                                    </tr>
                                    <tr id="novcode" style="">
                                        <td class="td-title" valign="top">验证码</td>
                                        <td>
                                            <input type="text" class="m-text" id="VCode" placeholder="请输入验证码" name="VCode" runat="server" maxlength="4" style="width: 100px;" />
                                            <img alt="" src="INC/VerifyCode.aspx" onclick="checkCode();" style="vertical-align: middle; margin-left: 5px;" id="VcodeImg" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title"></td>
                                        <td>
                                            <button type="button" class="btn btn-primary" id="btn_login" onserverclick="btn_login_ServerClick" runat="server">立即登录</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title" valign="top"></td>
                                        <td>
                                            <span style="color:#555">还没有账号？</span><a href="Register.aspx" style="text-decoration:none;"><span style="color:red;">去注册</span></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title" valign="top"></td>
                                        <td>
                                            <span style="color:#555">管理员登陆入口：</span><a href="AdminLogin.aspx" style="text-decoration:none;"><span style="color:red;">管理员登录</span></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title"></td>
                                        <td>
                                            <a href="/MSofts/ChromeCore_1277_3.0.1.6.exe" style="text-decoration:none;"><span style="color:#555">点击下载谷歌浏览器</span></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
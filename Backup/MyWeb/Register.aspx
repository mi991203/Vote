<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MyWeb.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link href="CSS/LoginandRegister.css" rel="stylesheet" />
    <script src="JS/jquery-1.7.1.min.js"></script>
    <script src="JS/Register.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="mn-content">
            <div class="mn-inner">
                <div class="pg-form">
                    <div style="margin-left:70px;">
                        <h3>用户注册</h3>
                    </div>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="td-left" valign="top">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="td-title" valign="top">账 号：</td>
                                        <td>
                                            <input type="text" class="m-text" id="Account" name="Account" placeholder="请输入账号" value="" maxlength="50" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title" valign="top">密 码：</td>
                                        <td>
                                            <input type="password" class="m-text" id="Password" name="Password" placeholder="请输入密码" maxlength="50" data-tip="请输入登录密码" />
                                        </td>
                                    </tr>
                                    <tr id="novcode" style="">
                                        <td class="td-title" valign="top">姓 名：</td>
                                        <td>
                                            <input type="text" class="m-text" id="UserName" placeholder="请输入姓名" name="UserName" maxlength="20" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title" valign="top">性 别：</td>
                                        <td>
                                            <span><input type="radio" checked="checked" value="1" id="sex1" name="sex" />男</span>
                                            <input type="radio" id="sex2" value="0" name="sex" />女
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title" valign="top">身份证号：</td>
                                        <td>
                                            <input type="text" class="m-text" id="Identity" placeholder="请输入身份证号" name="Identity" maxlength="20" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title"></td>
                                        <td>
                                            <button type="button" class="btn btn-primary" id="btn_login" onclick="checkForm();" runat="server">立即注册</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-title" valign="top"></td>
                                        <td>
                                            <span style="color:#555">注册成功？</span><a href="Login.aspx" style="text-decoration:none;"><span style="color:red;">去登陆</span></a>
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


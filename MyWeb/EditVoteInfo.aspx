<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageForAdmin.Master" AutoEventWireup="true" CodeBehind="EditVoteInfo.aspx.cs" Inherits="MyWeb.EditVoteInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tbl tr td {
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="tbl">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="投票主题："></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="提 交" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

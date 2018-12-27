<%----------------------------------------
 -- Created by: Jason 
 -- Date: December 24th, 2018
 -- Purpose: Student login page
----------------------------------------%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_login.aspx.cs" Inherits="LapakMikir.Pages.Student.student_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LapakMikir | Login</title>

    <link rel="stylesheet" type="text/css" href="~/Style/style.css" />

    <style type="text/css">
        .auto-style1 {
            width: 125px;
        }
    </style>
</head>
<body>
    <header class="Header">
        LapakMikir
    </header>

    <div class="ClearTopBottom150p"></div>

    <form id="form1" runat="server">
        <h3 class="TextAlignCenter">Login</h3>

        <table style="margin:auto;">
            <tr>
                <td class="auto-style1">Email</td>

                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="215px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">Password</td>

                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Width="215px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>

        <div class="ClearTopBottom100px"></div>

        <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="FontRed TextAlignCenter"></asp:Label><br />
        <div class="TextAlignCenter">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="Btn FlexBtn BorderRadius10px" OnClick="btnLogin_Click" />
        </div>
    </form>

    <div class="ClearTopBottom150p"></div>
    <p class="TextAlignCenter">Don't have an account yet? <a href="#">Click here</a> to register!</p>
    <p class="TextAlignCenter"><a href="#">Forget password</a>?</p>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-form {
            width: 300px;
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .login-button {
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .login-button:hover {
            background-color: #0056b3;
        }
        .message {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <form class="login-form" runat="server">
            <h2>Login</h2>
            <div class="input-group">
                <label for="username">Username:</label>
                <asp:TextBox ID="txtUserid" runat="server" CssClass="form-control" />
            </div>
            <div class="input-group">
                <label for="password">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
            </div>
            <div class="input-group">
                <input type="checkbox" id="keepLoggedIn" name="keepLoggedIn" />
                <label for="keepLoggedIn">Keep me logged in</label>
            </div>
            <div class="button-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="login-button" />
            </div>
            <div class="link-group">
                <asp:HyperLink ID="SignUpLink" runat="server" NavigateUrl="~/WebForm2.aspx">Sign Up</asp:HyperLink>
                <asp:HyperLink ID="ForgottenPasswordLink" runat="server" NavigateUrl="~/ForgottenPassword.aspx">Forgotten Password</asp:HyperLink>
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </form>
    </div>
</body>
</html>

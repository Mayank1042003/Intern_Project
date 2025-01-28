<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication2.WebForm3" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tax Regime</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
        .content {
            padding: 20px;
        }
        .button-group button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
            border-radius: 4px;
        }
        .button-group button:hover {
            background-color: #45a049;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group input[type="checkbox"] {
            width: auto;
        }
        .error-field {
            border-color: red;
            background-color: #ffe6e6;
        }
    </style>
</head>
<body>
    <form id="taxForm" runat="server">
        <div class="container">
            <div class="header">
                <h1>Tax Regime</h1>
            </div>
            <div class="content">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
                <div class="form-group">
                    <label for="txtPno">Pno:</label>
                    <asp:TextBox ID="txtPno" runat="server" CssClass="form-control" placeholder="Enter your Pro number"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtName">Name:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtLevel">Level:</label>
                    <asp:TextBox ID="txtLevel" runat="server" CssClass="form-control" placeholder="Enter your Level"></asp:TextBox>
                </div>
                <div class="button-group">
                    <button type="button" onclick="location.href='#'">CBDT clarification for TDS - 115BAC</button>
                    <button type="button" onclick="location.href='#'">New Tax Slab Vs Old Tax Slab Options</button>
                    <button type="button" onclick="location.href='#'">Tax Calculator</button>
                </div>
                <div class="form-group">
                    <label>Do you want to switch from Option-I (New Tax Regime) to Option-II (Old Tax Regime)?</label>
                    <asp:DropDownList ID="ddlSwitchOption" runat="server">
                        <asp:ListItem Value="yes">Yes</asp:ListItem>
                        <asp:ListItem Value="no">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:CheckBox ID="chkReadDocs" runat="server" />
                    <label for="chkReadDocs">I have read the enclosed documents attached carefully before exercising the switching option.</label>
                </div>
                <div class="form-group">
                    <asp:CheckBox ID="chkOneSwitch" runat="server" />
                    <label for="chkOneSwitch">I can switch only once in a Financial Year.</label>
                </div>
                <div class="form-group">
                    <asp:Button ID="Save" runat="server" Text="Submit" OnClick="Save_Click" CssClass="btn" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="YourNamespace.Report" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tax Regime Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 80%;
            margin: 0 auto;
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input,
        .form-group button {
            padding: 8px;
            margin: 5px 0;
        }
        .form-group button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        .form-group button:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Tax Regime Report</h1>
        </div>
        <div class="content">
            <div class="form-group">
                <label for="fromDate">From Date:</label>
                <input type="date" id="fromDate" runat="server">
                <label for="toDate">To Date:</label>
                <input type="date" id="toDate" runat="server">
                <button type="button" onclick="viewReport()">View</button>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Pro" HeaderText="P. No." />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Level" HeaderText="Level" />
                    <asp:BoundField DataField="CreatedOn" HeaderText="Created On" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Option" HeaderText="Option" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <script>
        function viewReport() {
            document.getElementById('<%= ViewReport.ClientID %>').click();
        }
    </script>
    <asp:Button ID="ViewReport" runat="server" Text="View Report" OnClick="ViewReport_Click" style="display:none;" />
</body>
</html>

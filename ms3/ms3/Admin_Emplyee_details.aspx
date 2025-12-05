<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Emplyee_details.aspx.cs" Inherits="ms3.Admin_Emplyee_details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Details</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        /* Responsive container */
        .container {
            width: 95%;
            max-width: 1200px;
            min-width: 320px;
            background-color: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: #1E3A8A;
            margin-bottom: 20px;
            font-size: 2em;
        }

        .btn-back {
            background-color: #FACC15;
            color: #1E3A8A;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            cursor: pointer;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .btn-back:hover {
            background-color: #eab308;
        }

        /* Make table scrollable if too wide */
        .table-wrapper {
            overflow-x: auto;
            width: 100%;
        }

        /* GridView styling */
        asp\:GridView, .gvTable {
            width: 100%;
            border-collapse: collapse;
            table-layout: auto;
            min-width: 600px; /* ensures horizontal scroll appears if table is too wide */
        }

        .gvTable th, .gvTable td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .gvTable th {
            background-color: #1E3A8A;
            color: white;
        }

        .gvTable tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gvTable tr:hover {
            background-color: #e0e7ff;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Button ID="back" runat="server" OnClick="goToAdminHomePage" Text="⟵ Back" CssClass="btn-back" />

            <h2>Employee Details</h2>

            <div class="table-wrapper">
                <asp:GridView ID="Details_Table" runat="server" CssClass="gvTable" AutoGenerateColumns="True"
                    EmptyDataText="No employee data available." GridLines="None">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>

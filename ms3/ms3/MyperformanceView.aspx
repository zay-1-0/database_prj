<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyperformanceView.aspx.cs" Inherits="ms3.MyperformanceView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Retrieve Performance</title>

    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 700px;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        h2 {
            color: #1E3A8A;
            margin-bottom: 20px;
            font-size: 26px;
        }

        label {
            display: block;
            font-weight: 600;
            color: #1E3A8A;
            margin-bottom: 10px;
            font-size: 17px;
        }

        .styled-input {
            width: 70%;
            padding: 12px;
            border: 1px solid #60A5FA;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 16px;
            background-color: #f9fafb;
            color: #1E3A8A;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .styled-input:hover,
        .styled-input:focus {
            border-color: #1E3A8A;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            outline: none;
        }

        .btn {
            width: 80%;
            padding: 14px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            margin-top: 10px;
        }

        .btn:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
        }

        /* Home Button styled */
        .btn-home {
            background: #FACC15;
            margin-top: 25px;
        }

        .btn-home:hover { background: #eab308; }

        /* Grid Styling */
        .performance-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            font-size: 15px;
        }

        .performance-grid th {
            background-color: #1E3A8A;
            color: white;
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .performance-grid td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
            background-color: #f9fafb;
        }

        .performance-grid tr:nth-child(even) {
            background-color: #eef3ff;
        }

        /* Simple fade animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">

            <h2>Retrieve Performance</h2>

            <!-- Semester Input -->
            <label for="Semester">Enter Semester Number:</label>
            <asp:TextBox ID="Semester" runat="server" CssClass="styled-input"
                MaxLength="3" placeholder="e.g., W24"></asp:TextBox>

            <!-- Get Performance Button -->
            <asp:Button ID="GetTable" runat="server" Text="Get Performance"
                CssClass="btn" OnClick="GetTable_Click" />

            <hr style="margin: 30px auto; width: 80%; border-top: 1px solid #ddd;" />

            <!-- Grid View -->
            <asp:GridView ID="PerformanceGridView" runat="server"
                AutoGenerateColumns="true"
                CssClass="performance-grid"
                EmptyDataText="No performance records found for this semester.">
            </asp:GridView>

            <asp:Literal ID="litMessage" runat="server"></asp:Literal>

            <!-- Home Button -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page"
                CssClass="btn btn-home" OnClick="HomeButton_Click" />

        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FetchDeduction_Attendance.aspx.cs" Inherits="ms3.FetchDeduction_Attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fetch Attendance Deductions</title>

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
            max-width: 900px;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        h1 {
            color: #1E3A8A;
            font-size: 30px;
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-weight: 600;
            color: #1E3A8A;
            margin-bottom: 10px;
            font-size: 17px;
        }

        .styled-input {
            width: 60%;
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
            width: 60%;
            padding: 14px;
            margin-top: 15px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
        }

        .btn-home {
            background: #FACC15;
            color: #1E3A8A;
            margin-top: 25px;
        }

        .btn-home:hover { background: #eab308; }

        /* Grid Styling */
        .Deduction-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            font-size: 15px;
        }

        .Deduction-grid th {
            background-color: #1E3A8A;
            color: white;
            padding: 12px;
            border: 1px solid #ccc;
        }

        .Deduction-grid td {
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f9fafb;
            text-align: center;
        }

        .Deduction-grid tr:nth-child(even) {
            background-color: #eef3ff;
        }

        .message {
            font-weight: bold;
            margin-top: 20px;
            color: #1E3A8A;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">

            <h1>Attendance Deductions by Month</h1>

            <!-- Month Dropdown -->
            <label for="month">Select Month</label>
            <asp:DropDownList ID="month" runat="server" CssClass="styled-input">
                <asp:ListItem Text="-- Select Month --" Value="" />
                <asp:ListItem Text="January" Value="1" />
                <asp:ListItem Text="February" Value="2" />
                <asp:ListItem Text="March" Value="3" />
                <asp:ListItem Text="April" Value="4" />
                <asp:ListItem Text="May" Value="5" />
                <asp:ListItem Text="June" Value="6" />
                <asp:ListItem Text="July" Value="7" />
                <asp:ListItem Text="August" Value="8" />
                <asp:ListItem Text="September" Value="9" />
                <asp:ListItem Text="October" Value="10" />
                <asp:ListItem Text="November" Value="11" />
                <asp:ListItem Text="December" Value="12" />
            </asp:DropDownList>

            <!-- Fetch Button -->
            <asp:Button ID="GetTable" runat="server" Text="Fetch Deductions"
                CssClass="btn" OnClick="GetTable_Click" />

            <hr style="margin: 30px auto; width: 80%; border-top: 1px solid #ddd;" />

            <!-- Grid -->
            <asp:GridView ID="DeductionGridView" runat="server"
                AutoGenerateColumns="true"
                CssClass="Deduction-grid"
                EmptyDataText="No Deduction records found for this month.">
            </asp:GridView>

            <!-- Home Button -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page"
                CssClass="btn btn-home" OnClick="HomeButton_Click" />

            <div class="message">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            </div>

        </div>
    </form>
</body>
</html>

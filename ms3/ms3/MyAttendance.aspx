<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAttendance.aspx.cs" Inherits="ms3.MyAttendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Attendance Records</title>

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

        /* Grid Styling */
        .Attendance-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 15px;
        }

        .Attendance-grid th {
            background-color: #1E3A8A;
            color: white;
            padding: 12px;
            border: 1px solid #ccc;
        }

        .Attendance-grid td {
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f9fafb;
            text-align: center;
        }

        .Attendance-grid tr:nth-child(even) {
            background-color: #eef3ff;
        }

        /* Message Styling */
        .message {
            margin-top: 20px;
            font-weight: bold;
            color: #1E3A8A;
        }

        /* Buttons */
        .btn {
            width: 60%;
            padding: 14px;
            margin-top: 25px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: #FACC15;
            color: #1E3A8A;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
            background: #eab308;
            transform: translateY(-3px);
        }

        /* Animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>


<body>
    <form id="form1" runat="server">
        <div class="container">

            <h1>My Attendance Records</h1>

            <!-- Attendance Table -->
            <asp:GridView ID="AttendanceGridView" runat="server"
                AutoGenerateColumns="true"
                CssClass="Attendance-grid"
                EmptyDataText="No Attendance records found for this month.">
            </asp:GridView>

            <!-- Message -->
            <div class="message">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            </div>

            <!-- Home Button -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page"
                CssClass="btn" OnClick="HomeButton_Click" />

        </div>
    </form>
</body>
</html>
